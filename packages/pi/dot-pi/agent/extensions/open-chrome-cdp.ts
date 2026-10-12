import { execFile } from "node:child_process";
import { promisify } from "node:util";
import { Type } from "@earendil-works/pi-ai";
import { defineTool, type ExtensionAPI } from "@earendil-works/pi-coding-agent";

const execFileAsync = promisify(execFile);
const CDP_ADDRESS = "127.0.0.1";
const CDP_PORT = 9222;
const CDP_URL = `http://${CDP_ADDRESS}:${CDP_PORT}`;
const PROFILE_DIR = `${process.env.HOME}/.chrome-cdp-profile`;

function pageUrl(input?: string): string {
  const value = input?.trim();
  if (!value) return "about:blank";

  const url = new URL(value);
  if (url.protocol !== "http:" && url.protocol !== "https:") {
    throw new Error("URL must use http or https.");
  }

  return url.href;
}

async function cdpWebSocketUrl(): Promise<string | undefined> {
  try {
    const response = await fetch(`${CDP_URL}/json/version`);
    if (!response.ok) return undefined;

    const version = (await response.json()) as { webSocketDebuggerUrl?: string };
    return version.webSocketDebuggerUrl;
  } catch {
    return undefined;
  }
}

async function openCdpTab(url: string): Promise<void> {
  const webSocketUrl = await cdpWebSocketUrl();
  if (!webSocketUrl) throw new Error(`Chrome is not listening at ${CDP_URL}.`);

  await new Promise<void>((resolve, reject) => {
    const socket = new WebSocket(webSocketUrl);
    const timeout = setTimeout(() => {
      socket.close();
      reject(new Error("Timed out creating a Chrome tab."));
    }, 5_000);

    socket.addEventListener("open", () => {
      socket.send(JSON.stringify({ id: 1, method: "Target.createTarget", params: { url } }));
    });
    socket.addEventListener("message", (event) => {
      const message = JSON.parse(String(event.data)) as { id?: number; error?: { message: string } };
      if (message.id !== 1) return;

      clearTimeout(timeout);
      socket.close();
      if (message.error) {
        reject(new Error(message.error.message));
      } else {
        resolve();
      }
    });
    socket.addEventListener("error", () => {
      clearTimeout(timeout);
      reject(new Error("Could not connect to Chrome CDP."));
    });
  });
}

async function openChrome(url?: string): Promise<{ launched: boolean; url: string }> {
  const targetUrl = pageUrl(url);
  const alreadyRunning = Boolean(await cdpWebSocketUrl());

  if (!alreadyRunning) {
    await execFileAsync("open", [
      "-na",
      "Google Chrome",
      "--args",
      `--remote-debugging-address=${CDP_ADDRESS}`,
      `--remote-debugging-port=${CDP_PORT}`,
      `--user-data-dir=${PROFILE_DIR}`,
      targetUrl,
    ]);

    for (let attempt = 0; attempt < 20; attempt += 1) {
      if (await cdpWebSocketUrl()) {
        return { launched: true, url: targetUrl };
      }
      await new Promise((resolve) => setTimeout(resolve, 250));
    }

    throw new Error(`Chrome did not expose CDP at ${CDP_URL}.`);
  }

  await openCdpTab(targetUrl);
  return { launched: false, url: targetUrl };
}

const openChromeCdpTool = defineTool({
  name: "open_chrome_cdp",
  label: "Open Chrome with CDP",
  description:
    "Open a standard Chrome browser window with its address bar visible and CDP listening on localhost:9222. Use when the user asks to open Chrome for browser inspection or automation.",
  parameters: Type.Object({
    url: Type.Optional(
      Type.String({ description: "Optional http(s) URL to open in the browser window." }),
    ),
  }),
  async execute(_toolCallId, params) {
    const result = await openChrome(params.url);
    const action = result.launched ? "Started Chrome" : "Chrome CDP was already running";

    return {
      content: [{ type: "text", text: `${action}: ${result.url}\nCDP: ${CDP_URL}` }],
      details: result,
    };
  },
});

export default function (pi: ExtensionAPI) {
  pi.registerTool(openChromeCdpTool);

  pi.registerCommand("open-chrome", {
    description: "Open a normal Chrome window with CDP on localhost:9222: /open-chrome [url]",
    handler: async (args, ctx) => {
      try {
        const result = await openChrome(args);
        const action = result.launched ? "Started Chrome" : "Opened URL in Chrome";
        ctx.ui.notify(`${action}: ${result.url}`, "info");
      } catch (error) {
        ctx.ui.notify(
          error instanceof Error ? error.message : "Could not open Chrome.",
          "error",
        );
      }
    },
  });
}

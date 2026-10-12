import {
  createLocalBashOperations,
  isToolCallEventType,
  type ExtensionAPI,
} from "@earendil-works/pi-coding-agent";

const GH_WRAPPER = `unalias gh 2>/dev/null || true
gh() {
  op run -- gh "$@"
}`;

function wrapGh(command: string): string {
  return `${GH_WRAPPER}\n${command}`;
}

export default function (pi: ExtensionAPI) {
  pi.on("tool_call", (event) => {
    if (!isToolCallEventType("bash", event)) return;

    event.input.command = wrapGh(event.input.command);
  });

  const localBash = createLocalBashOperations();
  pi.on("user_bash", () => ({
    operations: {
      exec(command, cwd, options) {
        return localBash.exec(wrapGh(command), cwd, options);
      },
    },
  }));
}

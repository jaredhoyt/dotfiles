local current_buffer = vim.api.nvim_get_current_buf()

vim.keymap.set("ia", "xpry", "require IEx; IEx.pry()", { buffer = current_buffer })
vim.keymap.set("ia", "xinf", "@tag timeout: :infinity", { buffer = current_buffer })

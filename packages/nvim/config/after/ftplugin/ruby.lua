local current_buffer = vim.api.nvim_get_current_buf()

vim.keymap.set("ia", "bpry", "require 'pry'; binding.pry", { buffer = current_buffer })

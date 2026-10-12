vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "**.thor",
  callback = function()
    vim.bo.filetype = "ruby"
  end
})

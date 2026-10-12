_G._vue_transform_fname = function(fname)
  fname = fname:gsub("^@/", "src/")
  fname = fname:gsub("^#", "src/")
  fname = fname:gsub("^~/", "")
  return fname
end

vim.cmd([[setlocal includeexpr=v:lua._vue_transform_fname(v:fname)]])
vim.cmd([[setlocal suffixesadd=.vue,.js,.ts,.jsx,.tsx]])
vim.cmd([[setlocal path+=src/**,node_modules]])

local options = {
  -- Search
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  incsearch = true,                        -- highlight all search results as you are typing
  smartcase = true,                        -- smart case

  -- Indentation
  autoindent = true,                       -- new lines inherit the indentation of previous lines
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- 2 spaces indentation  when using '>>' '<<'
  smartindent = true,                      -- does the right thing (mostly) in programs
  tabstop = 2,                             -- 2 spaces for a line indent

  -- Encoding
  encoding = "utf-8",
  fileencoding = "utf-8",                  -- the encoding written to a file

  -- Interface
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  linebreak = true,                        -- companion to wrap, don't split words
  -- mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  pumheight = 10,                          -- pop up menu height
  relativenumber = false,                  -- set relative numbered lines
  scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 1,                         -- always show tabs
  sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  wrap = true,                             -- display lines as one long line

  -- Misc
  backup = false,                          -- creates a backup file
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  swapfile = false,                        -- creates a swapfile
  undofile = true,                         -- enable persistent undo
  updatetime = 250,                        -- faster completion (4000ms default)
  -- whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use

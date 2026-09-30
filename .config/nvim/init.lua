-- ~/.config/nvim/init.lua
-- Minimal, plugin-free config. Every line here is something I chose.

-- Line numbers ---------------------------------------------------------
vim.opt.number = true            -- show absolute line numbers
vim.opt.relativenumber = false   -- keep them static (no relative numbers)

-- Colors ----------------------------------------------------------------
vim.opt.termguicolors = true     -- kitty supports 24-bit color
-- Built-in themes: type :colorscheme <Tab> to browse them, then set one:
-- vim.cmd("colorscheme habamax")

-- Syntax highlighting ---------------------------------------------------
-- Neovim ships highlighting for python, markdown, html, c, cpp, java,
-- json, and more. These two lines make sure it's on.
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Highlight code inside ```lang fenced blocks in markdown files
vim.g.markdown_fenced_languages = { "python", "cpp", "c", "java", "json", "html", "bash=sh" }

-- Indentation (optional: delete if you prefer Neovim's defaults) --------
vim.opt.expandtab = true         -- Tab key inserts spaces
vim.opt.shiftwidth = 4           -- indent width for >> and auto-indent
vim.opt.tabstop = 4              -- how wide a literal tab character looks

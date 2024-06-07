-- dodatkowe wymagania nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- zmiana klawiszu <Leader>, jest ustawiony na spacja
vim.g.mapleader = " "

-- https://github.com/folke/lazy.nvim
-- konfiguracja plugin managera Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--rozdzielenie ładowania na konfiguracje po plikach, by skrócić plik konfiguracyjny
require("lazy").setup("plugins")

--dodanie keymapy do konfiguracji
--wcisnięcie spacja e spowoduje wywołanie polecenia :NvimTreeToggle
vim.keymap.set('n', '<Leader>e', ":NvimTreeToggle<cr>", {
  silent = true
})
vim.keymap.set('n', '<C-e>', ':NvimTreeFocus<cr>', {

})

--dodanie keymap od telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) --znajdz pliki
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  --wyszukaj
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})    -- przeszukaj buffery
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.cmd [[colorscheme tokyonight]]

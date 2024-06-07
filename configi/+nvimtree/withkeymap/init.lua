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

-- uruchomienie pluginu Lazy
require("lazy").setup({
  -- plugin nvim-treesitter
  -- https://github.com/nvim-treesitter/nvim-treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- plugin Nvim-Tree
  -- https://github.com/nvim-tree/nvim-tree.lua/
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- ustawienia pluginu
      require("nvim-tree").setup {
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        }
      }
    end,
  }
})

--dodanie keymapy do konfiguracji
--wcisnięcie spacja e spowoduje wywołanie polecenia :NvimTreeToggle

vim.keymap.set('n', '<Leader>e', ":NvimTreeToggle<cr>", {
  silent = true
})
vim.keymap.set('n', '<C-e>', ':NvimTreeFocus<cr>', {

})

vim.g.mapleader = "<Space>"
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

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
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
  },
  {'ojroques/nvim-hardline'},
  {"rafamadriz/neon"},
  {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim", handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end}},{
	  "neovim/nvim-lspconfig"
    },
  {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
},
{'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },{"ms-jpq/coq_nvim"}
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup()

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {
	silent = true;
})

require('hardline').setup {}

vim.g.neon_style = "dark"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true

vim.cmd[[colorscheme neon]]
require("mason").setup()

require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = true,
    }
)
vim.lsp.start_client()
require("mason").setup()
    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
}

require("barbecue.ui").toggle(true)

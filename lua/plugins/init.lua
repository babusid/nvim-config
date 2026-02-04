return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-smart-history.nvim" },
      { "kkharji/sqlite.lua" },
    },
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"
      
      conf.extensions_list = { "themes", "terms", "live_grep_args", "smart_history" }
      conf.defaults = conf.defaults or {}
      conf.defaults.history = {
        path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
        limit = 100,
      }
      conf.defaults.mappings = conf.defaults.mappings or {}
      conf.defaults.mappings.i = conf.defaults.mappings.i or {}
      conf.defaults.mappings.i["<C-S-Up>"] = actions.cycle_history_next
      conf.defaults.mappings.i["<C-S-Down>"] = actions.cycle_history_prev
      return conf
    end,
  },
}

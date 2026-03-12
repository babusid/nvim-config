return {
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        disable_inline_completion = true,
        disable_keymaps = true,
        -- Optional: Ignore specific filetypes
        -- ignore_filetypes = { "cpp" },
      })
    end,
  },
}

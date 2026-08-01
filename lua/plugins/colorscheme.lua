return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd("colorscheme catppuccin")
    end,
  },
}

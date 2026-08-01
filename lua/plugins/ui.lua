return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = false,
      auto_hide = true,
      sidebar_filetypes = {
        ["neo-tree"] = {
          text = "explorer",
          align = "center",
        },
        Outline = { text = "Outline", align = "center" },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      extensions = { "neo-tree", "symbols-outline" },
    },
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local startify = require("alpha.themes.startify")
      startify.file_icons.provider = "devicons"
      require("alpha").setup(startify.config)
    end,
  },
}

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle reveal<cr>", mode = { "n" }, desc = "Toggle Neotree" },
    },
    opts = {
      window = {
        auto_expand_width = true,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}

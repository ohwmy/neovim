return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "▏" },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
      options = {
        show_source = {
          enabled = true,
          if_many = true,
        },
        add_messages = {
          display_count = true,
        },
        multilines = {
          enabled = true,
        },
        show_related = {
          enabled = false,
        },
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "abecodes/tabout.nvim",
    lazy = false,
    opts = {},
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    -- keys = { -- Example mapping to toggle outline
    --   { "<leader>cs", "<cmd>Outline<CR>", desc = "Toggle outline" },
    -- },
    opts = {
      outline_window = {
        width = 35,
      },
      symbol_folding = {
        auto_unfold = {
          hovered = true,
        },
      },
    },
  },
  {
    "kkew3/jieba.vim",
    tag = "v2.1.0",
    build = ":call jieba_vim#install()",
    init = function()
      vim.g.jieba_vim_lazy = 1
      vim.g.jieba_vim_keymap = 1
    end,
  },
  {
    "tris203/precognition.nvim",
    opts = {
      startVisible = false,
      highlightFullVirtLine = true,
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}

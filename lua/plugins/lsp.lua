return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust_analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })
      vim.lsp.config("clangd", {
        keys = {
          {
            "<leader>ch",
            "<cmd>LspClangdSwitchSourceHeader<cr>",
            desc = "Switch Source/Header (C/C++)",
          },
        },
        root_markers = {
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac", -- AutoTools
          "Makefile",
          "configure.ac",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja",
          ".git",
        },
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      })
      vim.lsp.enable({ "lua_ls", "tinymist" })
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = vim.version.range("1.*"),
    opts = {
      keymap = {
        preset = "enter",

        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
    },
    config = function(_, opts) require("blink.cmp").setup(opts) end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        typst = { "typstyle", lsp_format = "prefer" },
        rust = { "rustfmt", args = { "--edition", "2021" } },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    -- cmd = { "TypstPreview", "TypstPreviewToggle", "TypstPreviewUpdate" },
    keys = {
      {
        "<leader>tp",
        ft = "typst",
        "<cmd>TypstPreviewToggle<cr>",
        desc = "Toggle Typst Preview",
      },
    },
    opts = {
      dependencies_bin = {
        tinymist = "tinymist",
      },
    },
  },
  { "Civitasv/cmake-tools.nvim", opts = {} },
  {
    "aznhe21/actions-preview.nvim",
    opts = {
      backend = { "telescope" },
    },
  },
}

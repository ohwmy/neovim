return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      -- automatically install parser for current file
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local treesitter = require("nvim-treesitter")
          local lang = vim.treesitter.language.get_lang(args.match)
          if vim.list_contains(treesitter.get_available(), lang) then
            if not vim.list_contains(treesitter.get_installed(), lang) then
              treesitter.install(lang):wait()
            end
            vim.treesitter.start(args.buf)
          end
        end,
        desc = "Enable nvim-treesitter and install parser if not installed",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function() vim.g.no_plugin_maps = true end,
    opts = {
      select = {
        lookahead = true,
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = false,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable = true,
      max_lines = 5,
      trim_scope = "outer",
      min_window_height = 0,
      patterns = {
        default = { "class", "function", "method", "for", "while", "if", "switch", "case" },
        -- tex = { 'chapter', 'section', 'subsection', 'subsubsection' },
        -- rust = { 'impl_item', 'struct', 'enum' },
        -- scala = { 'object_definition' },
        -- vhdl = { 'process_statement', 'architecture_body', 'entity_declaration' },
        -- markdown = { 'section' },
        -- elixir = { 'anonymous_function', 'arguments', 'block', 'do_block', 'list', 'map', 'tuple', 'quoted_content' },
        -- json = { 'pair' },
        -- yaml = { 'block_mapping_pair' },
      },
      exact_patterns = {},
      zindex = 20,
      mode = "cursor",
      separator = nil,
    },
  },
}

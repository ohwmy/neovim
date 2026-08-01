local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = true })
map(
  { "n", "x" },
  "<Down>",
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, noremap = true, silent = true }
)
map(
  { "n", "x" },
  "<Up>",
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, noremap = true, silent = true }
)

-- move window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- resize window
map("n", "<C-A-h>", "<cmd>vertical resize -2<cr>", { noremap = true, silent = true })
map("n", "<C-A-j>", "<cmd>resize -2<cr>", { noremap = true, silent = true })
map("n", "<C-A-k>", "<cmd>resize +2<cr>", { noremap = true, silent = true })
map("n", "<C-A-l>", "<cmd>vertical resize +2<cr>", { noremap = true, silent = true })

-- buffers
map("n", "H", "<cmd>BufferPrevious<cr>", { noremap = true })
map("n", "L", "<cmd>BufferNext<cr>", { noremap = true })
map("n", "[b", "<cmd>BufferPrevious<cr>", { noremap = true })
map("n", "]b", "<cmd>BufferNext<cr>", { noremap = true })
map("n", "<leader>bd", "<cmd>BufferClose<cr>", { noremap = true, silent = true })
map("n", "<leader>bo", "<cmd>BufferCloseAllButCurrent<cr>", { noremap = true, silent = true })

-- editor
map("n", "<leader>cs", "<cmd>Outline<cr>", { noremap = true, silent = true })
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
map("n", "<leader>\\", "<cmd>Precognition toggle<cr>", { noremap = true, silent = true })

-- treesitter
local treesitter_select = function(obj)
  require("nvim-treesitter-textobjects.select").select_textobject(obj, "textobjects")
end

local treesitter_goto_next = function(obj)
  require("nvim-treesitter-textobjects.move").goto_next_start(obj, "textobjects")
end

local treesitter_goto_previous = function(obj)
  require("nvim-treesitter-textobjects.move").goto_previous_start(obj, "textobjects")
end

map({ "v" }, "am", function() treesitter_select("@function.outer") end)
map({ "v" }, "im", function() treesitter_select("@function.inner") end)
map({ "v" }, "ac", function() treesitter_select("@class.outer") end)
map({ "v" }, "ic", function() treesitter_select("@class.inner") end)
map({ "n", "x", "o" }, "]m", function() treesitter_goto_next("@function.outer") end)
map({ "n", "x", "o" }, "]]", function() treesitter_goto_next("@class.outer") end)
map({ "n", "x", "o" }, "[m", function() treesitter_goto_previous("@function.outer") end)
map({ "n", "x", "o" }, "[[", function() treesitter_goto_previous("@class.outer") end)

-- LSP
local telescope_builtin = function(func_name)
  local func = require("telescope.builtin")[func_name]
  if type(func) == "function" then
    func({ reuse_win = true })
  else
    error("telescope.builtin does not contain a function named '" .. func_name .. "'", 2)
  end
end

map("n", "gd", function() telescope_builtin("lsp_definitions") end)

map("n", "<leader>ca", function() require("actions-preview").code_actions() end)

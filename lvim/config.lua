-- Settings
vim.opt.relativenumber = true
lvim.colorscheme = "vscode"
lvim.format_on_save = true

-- Plugins
lvim.plugins = {
  { "tpope/vim-surround" },
  { "Mofiqul/vscode.nvim" },
  { "metakirby5/codi.vim", cmd = "Codi" },
  {
    "tomasky/bookmarks.nvim",
    config = function()
      require('bookmarks').setup()
      lvim.builtin.telescope.extensions = {
        'bookmarks'
      }
      local bm = require("bookmarks")
      lvim.keys.normal_mode["m"] = bm.bookmark_toggle
      lvim.builtin.which_key.mappings["f"]["b"] = { "<cmd>Telescope bookmarks list<cr>", "Bookmark" }
      lvim.builtin.which_key.mappings["m"] = {
        name = "Marks",
        m = { bm.bookmark_toggle, "Toggle" },
        e = { bm.bookmark_ann, "Edit" },
        c = { bm.bookmark_clean, "Clean" },
        n = { bm.bookmark_next, "Next" },
        p = { bm.bookmark_prev, "Previous" },
        l = { "<cmd>Telescope bookmarks list<cr>", "List" }
      }
    end
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require('leap').opts.special_keys.prev_target = '<bs>'
      require('leap').opts.special_keys.prev_group = '<bs>'
      require('leap.user').set_repeat_keys('<cr>', '<bs>')
    end,
  },
  -- {
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup()
  --   end,
  -- },
  -- {
  --   "karb94/neoscroll.nvim",
  --   event = "WinScrolled",
  --   config = function()
  --     require('neoscroll').setup({
  --       -- All these keys will be mapped to their corresponding default scrolling animation
  --       mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
  --         '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
  --       hide_cursor = true,          -- Hide cursor while scrolling
  --       stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  --       use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  --       respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --       easing_function = nil,       -- Default easing function
  --       pre_hook = nil,              -- Function to run before the scrolling animation starts
  --       post_hook = nil,             -- Function to run after the scrolling animation ends
  --     })
  --   end
  -- },
}


lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Global mappings
lvim.keys.normal_mode["H"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["s"] = "<Plug>(leap-forward)"
lvim.keys.normal_mode["S"] = "<Plug>(leap-backward)"
lvim.keys.normal_mode["<C-t>"] = "<cmd>ToggleTerm<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.normal_mode["]<space>"] = "<cmd>call append(line('.'), '')<cr>"
lvim.keys.normal_mode["[<space>"] = "<cmd>call append(line('.')-1, '')<cr>"

-- Which key mappings
lvim.builtin.which_key.mappings["s"] = nil
lvim.builtin.which_key.mappings["b"]["p"] = nil
lvim.builtin.which_key.mappings["b"]["j"] = nil
lvim.builtin.which_key.mappings["b"]["n"] = nil
lvim.builtin.which_key.mappings["b"]["D"] = nil
lvim.builtin.which_key.mappings["b"]["L"] = nil

lvim.builtin.which_key.mappings["b"]["n"] = { "<cmd>enew<cr>", "New" }
lvim.builtin.which_key.mappings["b"]["f"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" }
lvim.builtin.which_key.mappings["b"]["e"] = { "<cmd>Telescope buffers<cr>", "Buffers (preview)" }
lvim.builtin.which_key.mappings["b"]["c"] = { "<cmd>BufferLinePickClose<cr>", "Pick close" }
lvim.builtin.which_key.mappings["b"]["C"] = { "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
  "Close all but this" }
lvim.builtin.which_key.mappings["b"]["b"] = { "<cmd>BufferLinePick<cr>", "Buffer select" }
lvim.builtin.which_key.mappings["b"]["s"] = {
  name = "Sort",
  d = { "<cmd>BufferLineSortByDirectory<cr>", "Directory" },
  e = { "<cmd>BufferLineSortByExtension<cr>", "Extension" },
  t = { "<cmd>BufferLineSortByTabs<cr>", "Tabs" },
}

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope bookmarks list<cr>", "Bookmark" },
  B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme" },
  f = { function() require("lvim.core.telescope.custom-finders").find_project_files { previewer = false } end, "File", },
  e = { "<cmd>Telescope find_files<cr>", "File (preview)" },
  h = { "<cmd>Telescope help_tags<cr>", "Help" },
  H = { "<cmd>Telescope highlights<cr>", "Highlight groups" },
  m = { "<cmd>Telescope marks<cr>", "Marks" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps " },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  ["<cr>"] = { "<cmd>Telescope resume<cr>", "Resume last search" },
  w = { "<cmd>Telescope live_grep<cr>", "Word" },
}

lvim.builtin.which_key.mappings["g"]["b"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" }
lvim.builtin.which_key.mappings["g"]["l"] = {}

-- Buffer mappings
lvim.lsp.buffer_mappings.normal_mode["[b"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" }
lvim.lsp.buffer_mappings.normal_mode["]b"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" }

lvim.lsp.buffer_mappings.normal_mode["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" }
lvim.lsp.buffer_mappings.normal_mode["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" }

lvim.lsp.buffer_mappings.normal_mode["[g"] = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
  "Previous git hunk" }
lvim.lsp.buffer_mappings.normal_mode["]g"] = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
  "Next git hunk" }

-- UI Changes

lvim.builtin.telescope.defaults["layout_strategy"] = "horizontal"
lvim.builtin.telescope.defaults.layout_config["prompt_position"] = 'top'
lvim.builtin.telescope.defaults.layout_config["height"] = 0.95
lvim.builtin.telescope.defaults.layout_config["width"] = 0.95

lvim.builtin.telescope.pickers.git_files["layout_strategy"] = "center"
lvim.builtin.telescope.pickers.git_files["layout_config"] = { height = 20, width = 0.8 }

-- Lint and Formatting

local linters = require "lvim.lsp.null-ls.linters"

linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact" } },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "eslint_d",   filetypes = { "javascript", "typescript", "typescriptreact" } },
  { name = "phpcsfixer", filetypes = { "php" } },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup { { name = "eslint_d", }, }

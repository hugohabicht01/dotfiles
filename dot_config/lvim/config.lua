-- remap function by prime
local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")


-- Remove the annoying warning when editing C files
-- local notify = vim.notify
-- vim.notify = function(msg, ...)
--     if msg:match("warning: multiple different client offset_encodings detected for buffer, this is not supported yet neovim") then
--         return
--     end

--     notify(msg, ...)
-- end

vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.astro" },
      command = "set filetype=astro",
})


vim.api.nvim_create_autocmd("BufRead", {
      pattern = { "*.astro" },
      command = "set filetype=astro",
})
-- general
-- lvim.builtin.breadcrumbs.active = true
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

-- lvim.builtin.breadcrumbs.active = true

-- guifont for neovide
vim.o.guifont = "Iosevka Nerd Font"

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- special slashes for removed parts in git diffs
vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["gh"] = "<cmd>lua vim.lsp.buf.hover()<CR>"

lvim.builtin.gitsigns.opts.current_line_blame = true
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Keybinds stolen from theprimeagen
-- Moving visual selection up and down
lvim.keys.visual_mode['J'] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode['K'] = ":m '<-2<CR>gv=gv"

lvim.keys.normal_mode['n'] = "nzzzv"
lvim.keys.normal_mode['N'] = "Nzzzv"

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")
-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

vnoremap("<leader>d", "\"_d")

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["g"]["v"] = {
  "<cmd>DiffviewOpen<cr>",
  "Diffview"
}

lvim.builtin.which_key.mappings["b"]["n"] = {
  ":bn<cr>",
  "Next buffer"
}

lvim.builtin.which_key.mappings["b"]["p"] = {
  ":bp<cr>",
  "Previous buffer"
}

lvim.builtin.which_key.mappings["b"]["k"] = {
  ":BufferKill<cr>",
  "Kill buffer"
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"
local code_actions = require "lvim.lsp.null-ls.code_actions"

code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue"
    },
  },
}

formatters.setup({
  {
    exe = "eslint_d",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue"
    },
  },
})

linters.setup({
  {
    exe = "eslint_d",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
})

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "tpope/vim-surround"
  },
  {
    "tpope/vim-repeat",
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "dracula/vim"
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "tpope/vim-sleuth"
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
            'if',
            'for',
            'while'
          },
          json = {
            'pair',
          },
        },
      }
    end
  },
  {
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("noice").setup()
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   config = function()
  --     local opts = {
  --       char = "▏",
  --       -- filetype_exclude = {
  --       --   "alpha",
  --       --   "help",
  --       --   "terminal",
  --       --   "dashboard",
  --       --   "lspinfo",
  --       --   "lsp-installer",
  --       --   "mason",
  --       -- },
  --       buftype_exclude = { "terminal" },
  --       -- bufname_exclude = { "config.lua" },

  --       -- show_trailing_blankline_indent = false,
  --       -- show_first_indent_level = false,
  --       space_char_blankline = " ",
  --       show_current_context = true,
  --       show_current_context_start = true,
  --       use_treesitter = true,
  --     }

  --     require("indent_blankline").setup(opts)
  --   end
  -- },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  -- { "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
  --       }
  --     end, 100)
  --   end,
  -- },

  -- { "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua", "nvim-cmp" },
  -- },
}


-- Can not be placed into the config method of the plugins.
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = require "home",
  },

  -- {
  --   "rebelot/heirline.nvim",
  --   opts = function(_, opts)
  --     local status = require("astronvim.utils.status")
  --     opts.statusline = { -- statusline
  --       hl = { fg = "fg", bg = "bg" },
  --       status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
  --       status.component.git_branch(),
  --       status.component.file_info { filetype = {}, filename = false, file_modified = false },
  --       status.component.git_diff(),
  --       status.component.diagnostics(),
  --       status.component.fill(),
  --       status.component.cmd_info(),
  --       status.component.fill(),
  --       status.component.lsp(),
  --       status.component.treesitter(),
  --       status.component.nav(),
  --       -- remove the 2nd mode indicator on the right
  --     }
  --     -- return the final configuration table
  --     return opts
  --   end,
  -- },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  -- {
  --   "willothy/flatten.nvim",
  --   opts = {
  --     window = {
  --       open = "alternate"
  --     },
  --     callbacks = {
  --       should_block = function(argv)
  --         -- Note that argv contains all the parts of the CLI command, including
  --         -- Neovim's path, commands, options and files.
  --         -- See: :help v:argv
  --
  --         -- In this case, we would block if we find the `-b` flag
  --         -- This allows you to use `nvim -b file1` instead of `nvim --cmd 'let g:flatten_wait=1' file1`
  --         return vim.tbl_contains(argv, "-b")
  --
  --         -- Alternatively, we can block if we find the diff-mode option
  --         -- return vim.tbl_contains(argv, "-d")
  --       end,
  --       post_open = function(bufnr, winnr, ft, is_blocking)
  --         if is_blocking then
  --           -- Hide the terminal while it's blocking
  --           require("toggleterm").toggle(0)
  --         else
  --           -- If it's a normal file, just switch to its window
  --           vim.api.nvim_set_current_win(winnr)
  --         end
  --
  --         -- If the file is a git commit, create one-shot autocmd to delete its buffer on write
  --         -- If you just want the toggleable terminal integration, ignore this bit
  --         if ft == "gitcommit" then
  --           vim.api.nvim_create_autocmd(
  --             "BufWritePost",
  --             {
  --               buffer = bufnr,
  --               once = true,
  --               callback = function()
  --                 -- This is a bit of a hack, but if you run bufdelete immediately
  --                 -- the shell can occasionally freeze
  --                 vim.defer_fn(
  --                   function()
  --                     vim.api.nvim_buf_delete(bufnr, {})
  --                   end,
  --                   50
  --                 )
  --               end
  --             }
  --           )
  --         end
  --       end,
  --       block_end = function()
  --         -- After blocking ends (for a git commit, etc), reopen the terminal
  --         require("toggleterm").toggle(0)
  --       end
  --     }
  --   }
  -- },
  --
  { "mattn/flappyvird-vim" },
  { "nvim-rogue/rogue.nvim" },
  { "alec-gibson/nvim-tetris", lazy = false },
  { "mfussenegger/nvim-jdtls" },
  {
    "RaafatTurki/hex.nvim",
    lazy = false,
    config = function() require("hex").setup() end,
  },
}

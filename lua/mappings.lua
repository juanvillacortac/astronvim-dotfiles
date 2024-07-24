-- Mappings can be configured through AstroCore as well.
-- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
    H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

    -- mappings seen under group name "Buffer"
    ["<Leader>bD"] = {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with just a `desc` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<Leader>rr"] = { "<cmd>Rest run<cr>", desc = "Run the request under the cursor" },
    ["<Leader>rl"] = { "<cmd>Rest run last<cr>", desc = "Re-run the last request" },
    ["<Leader>r"] = { name = "REST client" },
    ["<Leader>z"] = { "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
    ["<leader>Su"] = {
      function() require("utils").load_user_config_session() end,
      desc = "Open Neovim user settings",
    },
    ["<leader>Sw"] = { function() require("utils").load_workspace() end, desc = "Open workspace" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

local M = {}

M.exists_buffers = function()
  local bufs = vim.fn.getbufinfo { buflisted = true }
  return not (require("astrocore").is_available "alpha-nvim" and not bufs[2])
end

M.load_user_config_session = function()
  if M.exists_buffers() then require("resession").save(nil, {
    dir = vim.fn.getcwd(),
  }) end
  require("neo-tree.ui.renderer").close_all_floating_windows()
  local cfg_path = vim.fn.stdpath "config"
  vim.cmd.cd(cfg_path)
  vim.cmd.e(cfg_path .. "/lua/home.lua")
  ---@diagnostic disable-next-line: param-type-mismatch
  -- local session_name = require("session_manager.config").defaults.dir_to_session_filename(vim.loop.cwd())
  -- if session_name:exists() then
  --   require("session_manager.utils").load_session(session_name.filename, true)
  -- else
  --   vim.cmd.e(cfg_path .. "/polish.lua")
  -- end
  vim.cmd "Neotree"
end

M.load_workspace = function()
  require("neo-tree.ui.renderer").close_all_floating_windows()
  local env = vim.fn.environ()
  if vim.fn.has_key(env, "NVIM_WORKSPACE") == 0 then
    vim.notify('"NVIM_WORKSPACE" env var not set', vim.log.levels.ERROR, {
      title = "Error opening workspace",
    })
    return
  end
  local path = env["NVIM_WORKSPACE"]
  vim.cmd.cd(path)
  vim.cmd "Neotree"
end

return M

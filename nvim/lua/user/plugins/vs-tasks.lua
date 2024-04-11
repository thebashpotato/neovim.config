local M = {
  "EthanJWright/vs-tasks.nvim",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "Joakker/lua-json5",
  },
}
function M.config()
  require("vstask").setup {
    harpoon = true,
    cache_json_conf = false,
    terminal = "toggleterm",
    json_parser = require("json5").parse,
  }
end

return M

local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local harpoon = require "harpoon"
  harpoon:setup {}

  vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():append()
    local buf_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
    vim.notify("Added '" .. buf_name .. "' to harpoon list")
  end)

  vim.keymap.set("n", "<leader>hs", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<leader>hl", function()
    harpoon:list():next()
  end)

  vim.keymap.set("n", "<leader>hh", function()
    harpoon:list():prev()
  end)
end

return M

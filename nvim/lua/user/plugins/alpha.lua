local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local dashboard = require("alpha.themes.dashboard")
  local icons = require "user.utils.icons"

  -- First class function to build a button 
  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Macro"
    return b
  end
  
  dashboard.section.header.val = {
    [[🛸　　　 　🌎　°　　🌓　•　　.°•　　　🚀 ✯   ]],
    [[　　　★　*　　　　　°　　　　🛰 　°·      🪐 ]],
    [[.　　　•　° ★　•  ☄                          ]],
    [[                 ▁▂▃▄▅▆▇▇▆▅▄▃▂▁.             ]],
  }

  dashboard.section.buttons.val = {
    button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
    button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
    button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  }

  local function footer()
    return "github.com/thebashpotato"
  end

  dashboard.section.footer.val = footer()
  dashboard.section.header.opts.h1 = "String"
  dashboard.section.buttons.opts.h1 = "Macro"
  dashboard.section.footer.opts.h1 = "Type"
  dashboard.opts.opts.noautocmd = true

  require("alpha").setup(dashboard.opts)
  
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
          set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
      ]]
    end,
  })
end

return M

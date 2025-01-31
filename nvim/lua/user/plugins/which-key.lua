local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"

  wk.add {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },
    { "<C-i>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },

    -- Top-level mappings
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>c", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
    { "<leader>,", "<cmd>Telescope find_files<cr>", desc = "Find Files" },

    -- Buffers group
    { "<leader>b", group = "Buffers" },
    { "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find Buffers" },
    { "<leader>bd", "<cmd>lua require('bufdelete').bufdelete(0, false)<cr>", desc = "Delete Buffer" },

    -- Debug group
    { "<leader>d", group = "Debug" },
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor" },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle REPL" },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },

    -- Plugin Manager group
    { "<leader>p", group = "Plugin Manager" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install Plugins" },
    { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync Plugins" },
    { "<leader>pS", "<cmd>Lazy clear<cr>", desc = "Clear Plugins" },
    { "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean Plugins" },
    { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update Plugins" },
    { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile Plugins" },
    { "<leader>pl", "<cmd>Lazy log<cr>", desc = "View Plugin Logs" },
    { "<leader>pd", "<cmd>Lazy debug<cr>", desc = "Debug Plugins" },

    -- Find group
    { "<leader>f", group = "Find" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text/Pattern" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find Specific String" },
    { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search Current Buffer" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Search Git Files" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
    { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
    { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Resume Last Search" },
    { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },

    -- Git group
    { "<leader>g", group = "Git" },
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    { "<leader>gj", "<cmd>lua require('gitsigns').next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
    { "<leader>gl", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "Blame" },
    { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open Changed File" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout Commit (Current File)" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },

    -- Continue with remaining mappings...

    -- LSP group
    { "<leader>l", group = "LSP" },
    { "<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
    { "<leader>lgd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
    { "<leader>lgI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to Implementation" },
    { "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Show All References" },
    { "<leader>lgl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open Float" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = { "n", "v" } },
    { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({timeout_ms = 1000000})<cr>", desc = "Format" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
    { "<leader>ll", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    { "<leader>lh", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previos Diagnostic" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quick Fix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quick Fix" },

    -- Utils
    { "<leader>o", group = "Utils" },
    { "<leader>of", "<cmd>TodoQuickFix<cr>", desc = "Quick Fix List" },
    { "<leader>oz", "<cmd>ZenMode<cr>", desc = "Distraction free programming" },

    -- Tree Sitter
    { "<leader>T", group = "Tree Sitter" },
    { "<leader>Ti", ":TSConfigInfo<cr>", desc = "Info" },

    -- Harpoon
    { "<leader>h", group = "Harpoon" },
    {
      "<leader>ha",
      function()
        local harpoon = require "harpoon"
        harpoon:list():add()
        local buf_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
        vim.notify("Added '" .. buf_name .. "' to harpoon list")
      end,
      desc = "Add buffer to harpoon list",
    },
    {
      "<leader>hs",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "List all buffers",
    },
    {
      "<leader>hl",
      function()
        local harpoon = require "harpoon"
        harpoon:list():next()
      end,
      desc = "Go to next buffer in the harpoon list",
    },
    {
      "<leader>hh",
      function()
        local harpoon = require "harpoon"
        harpoon:list():prev()
      end,
      desc = "Go to previos buffer in the harpoon list",
    },
  }
  wk.setup()
end

return M

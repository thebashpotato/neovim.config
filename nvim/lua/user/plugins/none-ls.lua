local M = {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local null_ls = require "null-ls"
  local config = require "user.managers.config_man"
  local supported_sources = {}

  for _, source in pairs(config:get_non_lsp_sources()) do
    if source == "stylua" then
      table.insert(supported_sources, null_ls.builtins.formatting.stylua)
    elseif source == "black" then
      table.insert(supported_sources, null_ls.builtins.formatting.black)
    elseif source == "isort" then
      table.insert(supported_sources, null_ls.builtins.formatting.isort)
    elseif source == "just" then
      table.insert(supported_sources, null_ls.builtins.formatting.just)
    elseif source == "shfmt" then
      table.insert(supported_sources, null_ls.builtins.formatting.shfmt)
    elseif source == "codespell" then
      table.insert(supported_sources, null_ls.builtins.diagnostics.codespell)
    elseif source == "markdownlint" then
      table.insert(supported_sources, null_ls.builtins.diagnostics.markdownlint)
    elseif source == "dictionary" then
      table.insert(supported_sources, null_ls.builtins.hover.dictionary)
    end
  end

  null_ls.setup {
    sources = supported_sources,
  }
end

return M

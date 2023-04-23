local M = {}

M.config = {
  ['json'] = {
    patterns = { '*.json', '*.jsonc' },
    lspconfig = 'jsonls',
    mason = 'json-lsp',
  },
  ['python'] = {
    patterns = { '*.py' },
    lspconfig = 'pyright',
    mason = { 'autopep8' },
    treesitter = 'python',
  },
  ['typescript'] = {
    patterns = { '*.ts', '*.tsx', '*.js', '*.jsx' },
    lspconfig = 'tsserver',
    mason = { 'typescript-language-server', 'prettierd', 'eslint_d' },
    treesitter = { 'javascript', 'typescript', 'tsx' },
  },
  ['lua'] = {
    patterns = { '*.lua' },
    lspconfig = 'lua_ls',
    mason = { 'lua-language-server', 'stylua' },
  },
  ['rust'] = {
    patterns = { '*.rs' },
    lspconfig = 'rust_analyzer',
    mason = 'rust-analyzer',
  },
  ['cpp'] = {
    patterns = { '*.cpp', '*.cc', '*.c', '*.hpp', '*.h' },
    lspconfig = 'clangd',
    mason = { 'clangd', 'clang-format' },
  },
  ['cmake'] = {
    patterns = { '*.txt', 'cmake' },
    lspconfig = 'cmake',
    mason = { 'cmake-language-server' },
  },
  ['markdown'] = {
    patterns = { '*.md', '*.markdown' },
    lspconfig = 'marksman',
    mason = 'marksman',
  },
  ['sh'] = {
    patterns = { '*.sh', '*.bash', '*.zsh' },
    mason = { 'shellcheck', 'shfmt' },
    treesitter = 'bash',
  },
}

M.filetypes = vim.tbl_keys(M.config)

M.mason_packages = {}
M.treesitter_parsers = {}

for filetype, config in pairs(M.config) do
  -- mason package names
  if type(config.mason) == 'string' then
    table.insert(M.mason_packages, config.mason)
  else
    for _, package in
      ipairs(config.mason --[[@as table]])
    do
      table.insert(M.mason_packages, package)
    end
  end

  -- treesitter parser names
  if type(config.treesitter) == 'string' then
    table.insert(M.treesitter_parsers, config.treesitter)
  elseif type(config.treesitter) == 'table' then
    table.insert_all(M.treesitter_parsers, config.treesitter)
  else
    table.insert(M.treesitter_parsers, filetype)
  end
end

-- extras not associated with any one language

table.insert(M.mason_packages, 'codespell')

table.insert(M.treesitter_parsers, 'comment')
table.insert(M.treesitter_parsers, 'fish')

return M

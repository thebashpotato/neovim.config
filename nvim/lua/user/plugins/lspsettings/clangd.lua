return {
  settings = {
    clangd = {
      -- Command line arguments converted to setup
      cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=Microsoft",
        "--background-index",
        "--pch-storage=memory",
        "--header-insertion=never",
        "--all-scopes-completion",
      },
      -- -- LSP-specific settings
      filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp", "cuda", "proto" },
      single_file_support = true,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      -- -- Compilation settings
      compilationDatabasePath = "build",
      -- -- File handling
      excludeFilePatterns = {
        "node_modules/*",
        "build/*",
        "tmp/*",
        ".git/*",
        "vendor/*",
      },
      -- -- Project-specific settings
      diagnostics = {
        onOpen = 1000, -- Limit diagnostics on file open
        onChange = 1000, -- Limit diagnostics on change
      },
      -- -- Performance settings
      index = {
        threads = 25, -- Adjust based on your CPU
        trackDependencies = true,
      },
    },
  },
}

local config = require "user.managers.config_man"

---  Theme
config:set_theme "onedark"

--- Misc plugin configuration
config:set_toggle_term_direction "horizontal"

---  LSP
config:add_lsp_config("lua_ls", true) -- LSP
config:add_lsp_config("pyright", true) -- LSP
config:add_lsp_config("bashls", true) -- LSP
config:add_lsp_config("jsonls", true) -- LSP
config:add_lsp_config("marksman", true) -- LSP
config:add_lsp_config("clangd", true) -- Lsp + Formatting
config:add_lsp_config("cmake", false) -- LSP + Formatting
config:add_lsp_config("mesonlsp", true) -- LSP
config:add_lsp_config("rust_analyzer", false) -- LSP + Formatting

--- Non Lsp Sources (Formatters, Linters etc) anything that you would install via null-ls/none-ls
config:add_non_lsp_source "stylua" -- An opinionated code formatter for Lua
config:add_non_lsp_source "black" -- The uncompromising Python code formatter
config:add_non_lsp_source "isort" -- Python utility / library to sort imports alphabetically and automatically separate them into sections and by type
config:add_non_lsp_source "just" -- Format your justfile
config:add_non_lsp_source "shfmt" -- A shell parser, formatter, and interpreter with bash support.

---  Debug Adapters (DAPs)
config:add_debug_adapter "codelldb" -- C/C++/Rust (codelldb)
config:add_debug_adapter "cppdbg" -- C/C++/Rust (cppdbg)
config:add_debug_adapter "python" -- Python (debugpy)
config:add_debug_adapter "bash" -- Bash (bash-debug-adpater)

--- Treesitter language parsers (for better and faster syntax highlighting)
config:add_treesitter_parser "lua"
config:add_treesitter_parser "luadoc"
config:add_treesitter_parser "markdown"
config:add_treesitter_parser "markdown_inline"
config:add_treesitter_parser "bash"
config:add_treesitter_parser "python"
config:add_treesitter_parser "c"
config:add_treesitter_parser "cpp"
config:add_treesitter_parser "rust"
config:add_treesitter_parser "just"
config:add_treesitter_parser "make"
config:add_treesitter_parser "cmake"
config:add_treesitter_parser "desktop"
config:add_treesitter_parser "dockerfile"
config:add_treesitter_parser "doxygen"
config:add_treesitter_parser "git_config"
config:add_treesitter_parser "git_rebase"
config:add_treesitter_parser "gitcommit"
config:add_treesitter_parser "gitignore"
config:add_treesitter_parser "toml"
config:add_treesitter_parser "json"
config:add_treesitter_parser "yaml"
config:add_treesitter_parser "zathurarc"
config:add_treesitter_parser "xresources"
config:add_treesitter_parser "meson"

return {
  settings = {
    ['rust-analyzer'] = {
      procMacro = {
        enabled = true,
      },
      init_options = {
        numThreads = 19,
      },
      settings = {
        cachePriming = {
          numThreads = 19,
        },
      },
      checkOnSave = {
        command = 'clippy',
      },
      diagnostics = {
        disabled = { 'inactive-code' },
      },
      files = {
        excludeDirs = {
          './js/',
          './node_modules/',
          './assets/',
          './ci/',
          './data/',
          './docs/',
          './store-metadata/',
          './.gitlab/',
          './.vscode/',
          './.git/',
        },
      },
    },
  },
}

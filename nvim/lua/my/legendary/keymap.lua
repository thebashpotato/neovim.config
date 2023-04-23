local M = {}

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

function M.default_keymaps()
  local h = require('legendary.toolbox')
  return {
    -- jk is mapped to escape by better-escape.nvim plugin
    -- make escape work in terminal mode,
    -- jk will enter vi mode of the shell itself
    { '<ESC>', '<C-\\><C-n>', mode = 't' },

    -- <ESC> clears hlsearch highlighting in normal mode
    { '<ESC>', ':noh<CR>', description = 'Clear hlsearch highlighting', mode = 'n' },
    -- <Space>jk to clear floating 'noice' notifications
    { '<Space>jk', ':Dismiss<CR>', description = 'Clear notifications' },

    -- allow moving the cursor through wrapped lines using j and k,
    -- note that I have line wrapping turned off but turned on only for Markdown
    { 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true }, mode = { 'n', 'v' } },
    { 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true }, mode = { 'n', 'v' } },

    {
      '<C-p>',
      require('legendary').find,
      description = 'Search keybinds and commands',
      mode = { 'n', 'i', 'x' },
    },

    { '<leader>s', ':wa<CR>', description = 'Write all buffers' },

    -- NOTE Fill out these commands
    -- @begin bufferline.nvim keymaps
    -- @end bufferline.nvim keymaps

    {
      'gx',
      function()
        local url = vim.fn.expand('<cfile>')
        -- plugin paths as interpreted by plugin manager, e.g. mrjones2014/op.nvim
        if not string.match(url, '[a-z]*://[^ >,;]*') and string.match(url, '[%w%p\\-]*/[%w%p\\-]*') then
          url = string.format('https://github.com/%s', url)
        end
        vim.fn.jobstart({ 'open', url }, { detach = true })
      end,
      description = 'Open URL under cursor',
    },

    { '<A-.>', ':bn<CR>', description = 'Move to next buffer' },
    { '<A-,>', ':bp<CR>', description = 'Move to previous buffer' },

    { '<F3>', ':NvimTreeToggle<CR>', description = 'Toggle file tree' },
    { '<leader><leader>t', ':ToggleTerm<CR>', description = 'Toggle floating terminal' },
    { '<leader><leader>z', ':ZenMode<CR>', description = 'Distraction free coding mode' },

    {
      'gnn',
      h.lazy_required_fn('nvim-treesitter.incremental_selection', 'init_selection'),
      description = 'Start selection with Treesitter',
    },
    {
      'grn',
      h.lazy_required_fn('nvim-treesitter.incremental_selection', 'node_incremental'),
      description = 'Expand selection to next Treesitter node',
    },
    {
      'grm',
      h.lazy_required_fn('nvim-treesitter.incremental_selection', 'node_decremental'),
      description = 'Shrink selection to next Treesitter node',
    },

    -- @begin Telescope builtin search features
    {
      '<C-f>',
      function()
        local search = vim.fn.getcmdline()
        vim.fn.setcmdline('')
        require('telescope.builtin').command_history({ default_text = search })
      end,
      description = 'Search command history',
      mode = 'c',
    },
    {
      '<Space>fr',
      h.lazy_required_fn('telescope.builtin', 'resume'),
      description = 'Resume last Telescope finder',
    },
    { '<Space>ff', h.lazy_required_fn('telescope.builtin', 'find_files'), description = 'Find files' },
    { '<Space>fb', h.lazy_required_fn('telescope.builtin', 'buffers'), description = 'Find open buffers' },
    { '<Space>fg', h.lazy_required_fn('telescope.builtin', 'live_grep'), description = 'Find a global pattern' },
    {
      '<Space>ft',
      h.lazy_required_fn('telescope.builtin', 'tags'),
      description = 'Find tags in current directory with tag location file preview',
    },
    {
      '<Space>fm',
      h.lazy_required_fn('telescope.builtin', 'man_pages'),
      description = 'Find manpage entries',
    },

    {
      '<Space>fh',
      h.lazy_required_fn('telescope.builtin', 'oldfiles'),
      description = 'Find recent files',
    },
    {
      '<leader>f',
      h.vsplit_then(h.lazy_required_fn('telescope.builtin', 'find_files')),
      description = 'Split vertically, then find files',
    },
    {
      '<leader>b',
      h.vsplit_then(h.lazy_required_fn('telescope.builtin', 'buffers')),
      description = 'Split vertically, then find open buffers',
    },
    {
      '<leader>h',
      h.vsplit_then(h.lazy_required_fn('telescope.builtin', 'oldfiles')),
      description = 'Split vertically, then find recent files',
    },
    {
      '<leader>t',
      h.vsplit_then(h.lazy_required_fn('telescope.builtin', 'live_grep')),
      description = 'Split vertically, then find file via live grep',
    },
    -- @end Telescope search features
    { '<leader>d', ':TroubleToggle<CR>', description = 'Open LSP diagnostics in quickfix window' },

    {
      '<leader>w',
      [[:%s/\<<C-r>=expand("<cword>")<CR>\>/]],
      description = 'Replace all instances of word under cursor in current buffer',
    },

    { '<leader>l', ':LegendaryScratchToggle<CR>', description = 'Toggle legendary.nvim scratchpad' },

    -- h/j/k/l mappings, split movement
    { '<C-h>', require('smart-splits').move_cursor_left, description = 'Move to next split left' },
    { '<C-j>', require('smart-splits').move_cursor_down, description = 'Move to next split down' },
    { '<C-k>', require('smart-splits').move_cursor_up, description = 'Move to next split up' },
    { '<C-l>', require('smart-splits').move_cursor_right, description = 'Move to next split right' },

    -- h/l mappings to move between tabs
    {
      '<A-h>',
      ':tabp<CR>',
      description = 'Move to the next tab',
    },
    {
      '<A-l>',
      ':tabn<CR>',
      description = 'Move to the next tab',
    },
    {
      'tt',
      ':tabnew<CR>',
      description = 'Create a new tab',
    },
    -- h/j/k/l mappings, split resizing
    {
      'vv',
      ':vs | :wincmd l<CR>',
      description = 'Create vertical split and switch to it',
    },
    {
      'bb',
      ':split | :wincmd j<CR>',
      description = 'Create horizontal split and switch to it',
    },
    {
      '<A-H>',
      require('smart-splits').resize_left,
      description = 'Smart resize vertically',
    },
    {
      '<A-L>',
      require('smart-splits').resize_right,
      description = 'Smart resize vertically',
    },
    {
      '<A-J>',
      require('smart-splits').resize_down,
      description = 'Smart resize horizontally',
    },
    {
      '<A-K>',
      require('smart-splits').resize_up,
      description = 'Smart resize horizontally',
    },

    -- h/j/k/l mappings, text moving
    {
      '<S-h>',
      {
        n = { ':MoveHChar(-1)<CR>' },
        x = { ":'<,'>MoveHBlock(-1)<CR>" },
      },
      description = 'Move text left',
    },
    {
      '<A-j>', -- Alt + j
      { n = ':MoveLine(1)<CR>', x = ":'<,'>MoveBlock(1)<CR>" },
      description = 'Move line of text down',
    },
    {
      '<A-k>', -- Alt + k
      { n = ':MoveLine(-1)<CR>', x = ":'<,'>MoveBlock(-1)<CR>" },
      description = 'Move line of text up',
    },
    {
      '<S-l>',
      { n = ':MoveHChar(1)<CR>', x = ":'<,'>MoveHBlock(1)<CR>" },
      description = 'Move text right',
    },

    -- spread
    {
      '<leader>so',
      h.lazy_required_fn('spread', 'out'),
      description = 'Split arrays/lists/etc. onto multiple lines',
    },
    {
      '<leader>si',
      h.lazy_required_fn('spread', 'combine'),
      description = 'Join arrays/lists/etc. onto a single line',
    },
  }
end

function M.lsp_keymaps(bufnr)
  -- if the buffer already has LSP keymaps bound, do nothing
  if
    #vim.tbl_filter(function(keymap)
      return (keymap.desc or ''):lower() == 'rename symbol'
    end, vim.api.nvim_buf_get_keymap(bufnr, 'n')) > 0
  then
    return {}
  end

  local h = require('legendary.toolbox')
  return {
    {
      'fs',
      h.lazy_required_fn('telescope.builtin', 'lsp_document_symbols'),
      description = 'Find LSP document symbols',
    },
    {
      'gh',
      function()
        -- I have diagnostics float on CursorHold,
        -- disable that if I've manually shown the hover window
        -- see autocmds.lua, lsp_autocmds()
        vim.cmd.set('eventignore+=CursorHold')
        vim.lsp.buf.hover()
        require('legendary').autocmd({
          'CursorMoved',
          ':set eventignore-=CursorHold',
          opts = { pattern = '<buffer>', once = true },
        })
      end,
      description = 'Show hover information',
      opts = { buffer = bufnr },
    },
    { 'gs', vim.lsp.buf.signature_help, description = 'Show signature help', opts = { buffer = bufnr } },
    {
      'gr',
      h.lazy_required_fn('telescope.builtin', 'lsp_references'),
      description = 'Find references',
      opts = { buffer = bufnr },
    },
    { 'gd', vim.lsp.buf.definition, description = 'Go to definition', opts = { buffer = bufnr } },
    { 'gi', vim.lsp.buf.implementation, description = 'Go to implementation', opts = { buffer = bufnr } },
    { 'gt', vim.lsp.buf.type_definition, description = 'Go to type definition', opts = { buffer = bufnr } },
    { '<leader>rn', vim.lsp.buf.rename, description = 'Rename symbol', opts = { buffer = bufnr } },
    {
      'gpd',
      h.lazy_required_fn('peek', 'Peek', 'definition'),
      description = 'Peek definition',
      opts = { buffer = bufnr },
    },
    {
      'gpi',
      h.lazy_required_fn('peek', 'Peek', 'implementation'),
      description = 'Peek implementation',
      opts = { buffer = bufnr },
    },
    {
      '<leader>gd',
      h.vsplit_then(vim.lsp.buf.definition),
      description = 'Go to definition in split',
      opts = { buffer = bufnr },
    },
    {
      '<leader>gi',
      h.vsplit_then(vim.lsp.buf.implementation),
      description = 'Go to implementation in split',
      opts = { buffer = bufnr },
    },
    {
      '<leader>gt',
      h.vsplit_then(vim.lsp.buf.type_definition),
      description = 'Go to type definition in split',
      opts = { buffer = bufnr },
    },
    { 'F', vim.lsp.buf.code_action, description = 'Show code actions', opts = { buffer = bufnr } },
    {
      '<leader>p',
      vim.diagnostic.goto_prev,
      description = 'Go to previous diagnostic item',
      opts = { buffer = bufnr },
    },
    { '<leader>n', vim.diagnostic.goto_next, description = 'Go to next diagnostic item', opts = { buffer = bufnr } },
  }
end

function M.cmp_mappings()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  return {
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
      'c',
    }),
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {
      'i',
      's',
      'c',
    }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {
      'i',
      's',
      'c',
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      'i',
      's',
      'c',
    }),
    ['<C-d>'] = cmp.mapping({ i = cmp.mapping.scroll_docs(-4) }),
    ['<C-f>'] = cmp.mapping({ i = cmp.mapping.scroll_docs(4) }),
    ['<C-Space>'] = cmp.mapping({ c = cmp.mapping.confirm({ select = true }) }),
    ['<Right>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.confirm({ select = true })()
      else
        fallback()
      end
    end, {
      'c',
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.close()()
      else
        fallback()
      end
    end, {
      'i',
      'c',
    }),
  }
end

return M

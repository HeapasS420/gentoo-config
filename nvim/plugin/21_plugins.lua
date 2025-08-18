local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later

now_if_args(function()
  add({
    source = 'rose-pine/neovim',
    name = 'rosepine',
  })
  vim.cmd 'colorscheme rose-pine'
end)

now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'bash', 'diff', 'lua', 'python', 'vimdoc', 'zig' },
    highlight = { enable = true },
  })
end)

now_if_args(function()
  add('xiyaowong/transparent.nvim')
  require("transparent").setup({
    -- table: default groups
    groups = {
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
      'EndOfBuffer',
    },
    -- table: additional groups that should be cleared
    extra_groups = {},
    -- table: groups you don't want to clear
    exclude_groups = {},
    -- function: code to be executed after highlight groups are cleared
    -- Also the user event "TransparentClear" will be triggered
    on_clear = function() end,
  })
end)

later(function()
  add('kassio/neoterm')

  -- Enable bracketed paste
  vim.g.neoterm_bracketed_paste = 1

  -- Default python REPL
  vim.g.neoterm_repl_python = 'ipython'

  -- Default R REPL
  vim.g.neoterm_repl_r = 'radian'

  -- Don't add extra call to REPL when sending
  vim.g.neoterm_direct_open_repl = 1

  -- Open terminal to the right by default
  vim.g.neoterm_default_mod = 'vertical'

  -- Go into insert mode when terminal is opened
  vim.g.neoterm_autoinsert = 1

  -- Scroll to recent command when it is executed
  vim.g.neoterm_autoscroll = 1

  -- Don't automap keys
  pcall(vim.keymap.del, 'n', ',tt')
end)

later(function()
  vim.g.disable_rainbow_csv_autodetect = true
  add('mechatroner/rainbow_csv')
end)

later(function()
  local build = function() vim.fn['mkdp#util#install']() end
  add({
    source = 'iamcco/markdown-preview.nvim',
    hooks = {
      post_install = function() later(build) end,
      post_checkout = build,
    },
  })

  -- Do not close the preview tab when switching to other buffers
  vim.g.mkdp_auto_close = 0
end)

-- Filetype: rmarkdown ========================================================
later(function()
  -- This option should be set before loading plugin to take effect. See
  -- https://github.com/vim-pandoc/vim-pandoc/issues/342
  vim.g['pandoc#filetypes#pandoc_markdown'] = 0

  add({
    source = 'vim-pandoc/vim-rmarkdown',
    depends = { 'vim-pandoc/vim-pandoc', 'vim-pandoc/vim-pandoc-syntax' },
  })

  -- Show raw symbols
  vim.g['pandoc#syntax#conceal#use'] = 0

  -- Folding
  vim.g['pandoc#folding#fold_yaml'] = 1
  vim.g['pandoc#folding#fold_fenced_codeblocks'] = 1
  vim.g['pandoc#folding#fastfolds'] = 1
  vim.g['pandoc#folding#fdc'] = 0
end)

-- Create `<Leader>` mappings
local nmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, opts)
end

-- e is for 'explore' and 'edit'
local edit_config_file = function(filename)
  return '<Cmd>edit ' .. vim.fn.stdpath('config') .. '/plugin/' .. filename .. '<CR>'
end
nmap_leader('ed', '<Cmd>lua MiniFiles.open()<CR>',                             'Directory')
nmap_leader('ef', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', 'File directory')
nmap_leader('em', edit_config_file('20_mini.lua'),                             'Mini.nvim config')
nmap_leader('eM', edit_config_file('11_mappings.lua'),                         'Mapping config')
nmap_leader('eo', edit_config_file('10_options.lua'),                          'Options config')
nmap_leader('ep', edit_config_file('21_plugins.lua'),                          'Plugins config')
nmap_leader('es', '<Cmd>lua MiniSessions.select()<CR>',                        'Sessions')
nmap_leader('eq', '<Cmd>lua Config.toggle_quickfix()<CR>',                     'Quickfix')

-- b is for 'buffer'
nmap_leader('ba', '<Cmd>b#<CR>',                                 'Alternate')
nmap_leader('bd', '<Cmd>lua MiniBufremove.delete()<CR>',         'Delete')
nmap_leader('bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>',  'Delete!')
nmap_leader('bs', '<Cmd>lua Config.new_scratch_buffer()<CR>',    'Scratch')
nmap_leader('bw', '<Cmd>lua MiniBufremove.wipeout()<CR>',        'Wipeout')
nmap_leader('bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', 'Wipeout!')

-- d is for 'delete'
nmap_leader('dt', '<Cmd>lua MiniTrailspace.trim()<CR>',          'Trim trailspace')

-- s is for 'search'
nmap_leader('sw', '<Cmd>lua MiniPick.builtin.grep()<CR>', 'Grep search')
nmap_leader('sf', '<Cmd>lua MiniPick.builtin.files({ tool = \'rg\' })<CR>', 'Ripgrep search')

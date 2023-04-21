function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- sane regexes
nmap('/', '/\\v')
vmap('/', '/\\v')

-- keep search matches in the middle of the window
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Open a Quickfix window for the last search.
nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Easy buffer navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Reselect visual block after indent/outdent
vmap('<', '<gv')
vmap('>', '>gv')

-- home and end line in command mode
cmap('<C-a>', '<Home>')
cmap('<C-e>', '<End>')

-- Terminal
-- ESC to go to normal mode in terminal
tmap('<C-s>', '<C-\\><C-n>')
tmap('<Esc><Esc>', '<C-\\><C-n>')

-- Easy window split; C-w v -> vv, C-w - s -> ss
nmap('vv', '<C-w>v')
nmap('ss', '<C-w>s')
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane

-- PLUGINS

-- Find files using Telescope command-line sugar.
nmap("<C-p>", "<cmd>Telescope find_files<cr>")
nmap("<leader>f", "<cmd>Telescope live_grep<cr>")
nmap("<leader>bb", "<cmd>Telescope buffers<cr>")
nmap("<leader>hh", "<cmd>Telescope help_tags<cr>")

-- LSP
nmap('K', '<cmd>Lspsaga hover_doc<cr>')
imap('<C-k>', '<cmd>Lspsaga signature_help<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')
nmap('gp', '<cmd>Lspsaga preview_definition<cr>')
nmap('gr', '<cmd>Lspsaga rename<cr>')
nmap('<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>')

-- git
nmap('<C-g>', '<cmd>GitMessenger<cr>')

-- from old vimrc
nmap("YY", "\"+y<CR>")

--[[cnoreabbrev Q! q!]]
--[[cnoreabbrev Qall! qall!]]
--[[cnoreabbrev Wq wq]]
--[[cnoreabbrev Wa wa]]
--[[cnoreabbrev wQ wq]]
--[[cnoreabbrev WQ wq]]
--[[cnoreabbrev W w]]
--[[cnoreabbrev Q q]]
--[[cnoreabbrev Qall qall]]

nmap("<leader>gs", ":Git<CR>")
nmap("<leader>gb", ":Git blame<CR>")
nmap("<leader>gca", ":Git commit<CR>")
nmap("<leader>gp", ":Git push origin<space>")
nmap("<leader>gaa", ":Git add .<CR>")
-- Select all
nmap("<leader>a", "ggVG")
vmap("<C-c>", '"+yi')
vmap("<C-x>", '"+c')
vmap("<C-v>", 'c<ESC>"+p')
imap("<C-v>", '<C-r><C-o>+')

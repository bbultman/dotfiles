local map = require('utils').map

vim.g.mapleader = '\\'

map('n', '<C-p>', '<cmd>Telescope find_files<cr>')
map('n', '<Leader>F', '<cmd>Telescope live_grep<cr>')
map('n', '<C-F>w', '<cmd>Telescope grep_string<cr>')
map('n', '<Leader>fb', '<cmd>Telescope buffers<cr>')

map('n', '<Leader>gd', '<cmd>Telescope lsp_definitions<cr>')
map('n', '<Leader>gr', '<cmd>Telescope lsp_references<cr>')
map('n', '<Leader>gt', '<cmd>Telescope lsp_type_definitions<cr>')
map('n', '<Leader>gi', '<cmd>Telescope lsp_implementations<cr>')
map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
map('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<Leader>a', '<cmd>CodeActionMenu<cr>')
map('n', '<Leader>p', '<cmd>lua vim.lsp.buf.formatting()<cr>')

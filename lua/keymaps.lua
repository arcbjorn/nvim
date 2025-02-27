-- Key mappings (macOS VSCode-style)

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File explorer (CMD+E like in VSCode for macOS)
map('n', '<D-e>', ':NvimTreeToggle<CR>', opts)

-- Search (requires telescope plugin)
map('n', '<D-p>', function()
  local telescope = utils.safely_require('telescope.builtin')
  if telescope then telescope.find_files() end
end, opts)

map('n', '<D-f>', function()
  local telescope = utils.safely_require('telescope.builtin')
  if telescope then telescope.current_buffer_fuzzy_find() end
end, opts)

map('n', '<D-S-f>', function()
  local telescope = utils.safely_require('telescope.builtin')
  if telescope then telescope.live_grep() end
end, opts)

-- Split editors
map('n', '<D-\\>', ':vsplit<CR>', opts)
map('n', '<D-S-\\>', ':split<CR>', opts)

-- Navigation between splits
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- LSP keybindings
map('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
map('n', 'gd', function() vim.lsp.buf.definition() end, opts)
map('n', 'K', function() vim.lsp.buf.hover() end, opts)
map('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
map('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
map('n', '<D-.>', function() vim.lsp.buf.code_action() end, opts)
map('n', 'gr', function() vim.lsp.buf.references() end, opts)

-- Command palette
map('n', '<D-S-p>', function()
  local telescope = utils.safely_require('telescope.builtin')
  if telescope then telescope.commands() end
end, opts)

-- File operations
map('n', '<D-s>', ':w<CR>', opts)
map('n', '<D-S-s>', ':wa<CR>', opts)

-- Tabs navigation

-- Buffer navigation with Option+number
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)

-- Next/Previous buffer with Option+[ and Option+]
map('n', '<A-[>', ':BufferPrevious<CR>', opts)
map('n', '<A-]>', ':BufferNext<CR>', opts)

-- Close buffer with Option+w
map('n', '<A-w>', ':BufferClose<CR>', opts)
-- Close all buffers with Option+Shift+w
map('n', '<A-S-w>', ':BufferCloseAll<CR>', opts)

-- Move buffer position with Option+Left/Right
map('n', '<A-Left>', ':BufferMovePrevious<CR>', opts)
map('n', '<A-Right>', ':BufferMoveNext<CR>', opts)

-- Map Cmd+Z to undo (and Cmd+Shift+Z to redo) in normal and insert mode
map('n', '<D-z>', 'u', opts)
map('i', '<D-z>', '<C-O>u', opts)
map('n', '<D-S-z>', '<C-r>', opts)
map('i', '<D-S-z>', '<C-O><C-r>', opts)

-- Close nvim instance
map('n', '<A-S-q>', ':qall<CR>', opts)

-- Open Git
map('n', '<leader>gg', ':Neogit<CR>', opts)

-- Comment toggle
map('n', '<D-/>', function()
  local comment_api = utils.safely_require('Comment.api')
  if comment_api then
    comment_api.toggle.linewise.current()
  end
end, opts)

map('v', '<D-/>', function()
  local comment_api = utils.safely_require('Comment.api')
  if comment_api then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
    comment_api.toggle.linewise(vim.fn.visualmode())
  end
end, opts)

map('n', '<Esc>', ':noh<CR>', opts)  -- Clear search highlighting

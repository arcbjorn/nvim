-- Git integration configuration

local gitsigns = utils.safely_require('gitsigns')
if not gitsigns then
  return
end

-- Set up highlights for git signs
local function setup_highlights()
  vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#b8bb26' })
  vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#83a598' })
  vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#fb4934' })
  
  -- You can link these to the main highlights if you don't want different styles
  vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAdd' })
  vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChange' })
  vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDelete' })
  
  vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAdd' })
  vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChange' })
  vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDelete' })
  
  -- For top delete and change delete
  vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
  vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
  
  vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
  vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
  
  vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
  vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
end

-- Set up highlights
setup_highlights()

-- Set up automatic highlight refresh when colorscheme changes
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = setup_highlights,
})

gitsigns.setup {
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,      -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false,     -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false,  -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}
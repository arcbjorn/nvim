-- UI plugins configuration

-- Set Gruvbox colorscheme with dark hard contrast
vim.o.background = 'dark'
local gruvbox = utils.safely_require('gruvbox')
if gruvbox then
  gruvbox.setup({
    contrast = 'hard',
    italic = {
      strings = true,
      comments = true,
      operators = false,
      folds = true,
    },
  })
  vim.cmd('colorscheme gruvbox')
end

-- Setup lualine statusline
local lualine = utils.safely_require('lualine')
if lualine then
  lualine.setup({
    options = {
      theme = 'gruvbox',
    }
  })
end

-- Setup nvim-tree file explorer
local nvim_tree = utils.safely_require('nvim-tree')
if nvim_tree then
  nvim_tree.setup({
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },
    filters = {
      dotfiles = false,
    },
  })
end

-- Setup indent guides
local ibl = utils.safely_require('ibl')
if ibl then
  ibl.setup {
    indent = {
      char = "│",
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
    },
  }
end

-- Setup comment plugin
local comment = utils.safely_require('Comment')
if comment then
  comment.setup()
end
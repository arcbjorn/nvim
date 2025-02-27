-- Telescope configuration

local telescope = utils.safely_require('telescope')
if not telescope then
  return
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
    file_ignore_patterns = {
      "node_modules",
      ".git",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
}
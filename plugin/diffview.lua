local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

diffview.setup {
  enhanced_diff_hl = true,  -- Better syntax highlighting in diff views
  use_icons = true,        -- Use web-devicons
  icons = {
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    win_config = {
      position = "left",   -- "left" or "bottom"
      width = 35,          -- Width of the panel
    },
  },
}

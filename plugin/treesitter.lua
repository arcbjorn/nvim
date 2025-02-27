-- Treesitter configuration

local treesitter = utils.safely_require('nvim-treesitter.configs')
if not treesitter then
  return
end

treesitter.setup {
  ensure_installed = { 
    "lua", "vim", "python", "javascript", 
    "typescript", "bash", "go", "zig", "elixir" 
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
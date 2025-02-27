-- Tab management configuration

local bufferline = utils.safely_require('bufferline')
if not bufferline then
  return
end

bufferline.setup {
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  
  icons = {
    -- Disable filetype icons until properly working
    filetype = {
      enabled = false,
    },
    separator = {
      left = '▎',
    },
    inactive = {
      separator = {
        left = '▎',
      },
    },
    modified = {
      button = '●',
    },
    pinned = {
      button = '📌',
    },
  },
  
  maximum_length = 30,
}
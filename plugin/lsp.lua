-- LSP configuration
local lspconfig = utils.safely_require('lspconfig')
if not lspconfig then
  return
end

-- Updated server list (ts_ls instead of tsserver)
local servers = { 'pyright', 'ts_ls', 'gopls', 'zls', 'elixirls' }

-- Special configuration for Lua LSP
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Configure other servers
for _, lsp in ipairs(servers) do
  -- Special configuration for elixirls to specify cmd
  if lsp == 'elixirls' then
    lspconfig[lsp].setup {
      cmd = { vim.fn.expand("~/.local/share/elixir-ls/language_server.sh") }
    }
  else
    lspconfig[lsp].setup {}
  end
end
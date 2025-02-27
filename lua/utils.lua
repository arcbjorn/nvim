-- Helper functions

-- Make utilities globally available
_G.utils = {}

-- Safely require a module without crashing if it's not found
_G.utils.safely_require = function(module)
  local ok, result = pcall(require, module)
  if not ok then
    return nil
  end
  return result
end

return _G.utils
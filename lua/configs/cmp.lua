local options = require "nvchad.configs.cmp"

options.sources = options.sources or {}

local has_supermaven = false
for _, source in ipairs(options.sources) do
  if source.name == "supermaven" then
    has_supermaven = true
    break
  end
end

if not has_supermaven then
  table.insert(options.sources, 1, { name = "supermaven" })
end

if vim.fn.hlexists("CmpItemKindSupermaven") == 0 then
  vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { link = "CmpItemKindSuperMaven" })
end

return options

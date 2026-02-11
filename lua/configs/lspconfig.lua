local nv_configs = require("nvchad.configs.lspconfig")
local on_attach = nv_configs.on_attach
local on_init = nv_configs.on_init
local capabilities = nv_configs.capabilities

-- 1. Setup generic servers
local generic_servers = { "html", "cssls", "clangd" }
for _, lsp in ipairs(generic_servers) do
  vim.lsp.enable(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

-- python stuff
-- 2. Setup Pyright with specific settings (to avoid "noise")
vim.lsp.enable("basedpyright", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    pyright = { disableOrganizeImports = true },
    python = { analysis = { diagnosticMode = "openFilesOnly" } },
  },
})

-- Ruff for pylinting
vim.lsp.enable("ruff", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Floating diagnostic" })

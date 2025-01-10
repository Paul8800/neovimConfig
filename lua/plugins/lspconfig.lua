local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end


-- Helper function to check if an executable exists
local function is_executable(cmd)
  return vim.fn.executable(cmd) == 1
end

-- LSP servers
if is_executable("lua-language-server") then
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })
end

if is_executable("pyright") then
  lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

if is_executable("rust-analyzer") then
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

if is_executable("clangd") then
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

if is_executable("haskell-language-server") then
  lspconfig.hls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end


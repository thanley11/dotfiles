-- local util = require 'lspconfig/util'
-- local function setup_servers()
  -- require'lspinstall'.setup()
  -- local servers = require'lspinstall'.installed_servers()
  -- for _, server in pairs(servers) do
    -- if server == 'typescript' then
      -- print(util.root_pattern("package.json", "tsconfig.json", ".git")())
      -- require'lspconfig'[server].setup {
        -- on_attach = custom_attach,
        -- root_dir = function (pattern) return util.root_pattern("package.json", "tsconfig.json", ".git")(pattern) or vim.loop.cwd() end ,
        -- filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        -- cmd = { "typescript-language-server", "--stdio" }
      -- }
    -- else
      -- require'lspconfig'[server].setup{}
    -- end
  -- end
-- end

-- setup_servers()

-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require'lspinstall'.post_install_hook = function ()
  -- setup_servers() -- reload installed servers
  -- vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end


--mappings.
--see `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings.
  -- see `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'k', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>d', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
end

-- use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'html' }
-- from nvim-cmp.lua in order to add capabilities to each attached servers
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- this will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

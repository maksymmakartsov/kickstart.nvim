require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls", "lua_ls" }
-- vim.lsp.enable(servers)
local servers = {
  html = {},
  cssls = {},
  bashls = {},
  jsonls = {},
  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  angularls = {
    -- Ensure that for HTML files,
    -- this server is only activated if an `angular.json` file is found
    -- in the project's root. This prevents it from taking over
    -- regular HTML files in non-Angular projects.
    root_dir = require("lspconfig.util").root_pattern "angular.json",
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end
-- read :h vim.lsp.config for changing options of lsp servers

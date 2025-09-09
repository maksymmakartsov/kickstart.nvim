return { -- Autoformat
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      -- local disable_filetypes = { c = true, cpp = true }

      -- if disable_filetypes[vim.bo[bufnr].filetype] then
      -- return nil
      -- end

      -- local prettier_config = vim.fs.find({ ".prettierrc", ".prettierrc.json", ".prettierrc.js" }, {
      -- upward = true,
      -- stop = vim.loop.os_homedir(),
      -- path = vim.api.nvim_buf_get_name(bufnr),
      -- })[1]

      -- if prettier_config then
      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
      -- end
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
      -- Add these lines for frontend formatting
      javascript = { "eslint_d", "prettierd" },
      typescript = { "eslint_d", "prettierd" },
      javascriptreact = { "eslint_d", "prettierd" },
      typescriptreact = { "eslint_d", "prettierd" },
      vue = { "eslint_d", "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
    },
  },
}

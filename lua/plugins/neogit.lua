return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    vim.keymap.set("n", "<leader>gs", "<cmd> Neogit<cr>", { desc = "Neogit status" })
    vim.keymap.set("n", "<leader>gc", "<cmd> Neogit commit<cr>", { desc = "Neogit commit" })
    vim.keymap.set("n", "<leader>gp", "<cmd> Neogit pull<cr>", { desc = "Neogit pull" })
    vim.keymap.set("n", "<leader>gP", "<cmd> Neogit push<cr>", { desc = "Neogit push" })
  end,
}

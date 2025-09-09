return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    pcall(require("telescope").load_extension, "fzf")

    local builtin = require "telescope.builtin"
    -- Files
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recent files" })
    -- Git
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope branches" })
    -- Search
    vim.keymap.set("n", "<leader>sh", builtin.search_history, { desc = "Telescope search history" })
    vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Telescope man pages" })
    vim.keymap.set("n", '<leader>s"', builtin.registers, { desc = "Telescope registers" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Telescope word/selection" })
    -- Lsp
    vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope LSP References" })
    vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "Telescope LSP Implementations" })
    vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "Telescope LSP Definitions" })
    vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Telescope LSP Type Definitions" })
  end,
}

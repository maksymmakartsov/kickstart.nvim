return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { "\\", ":Neotree reveal<CR>", desc = "File Explorer reveal", silent = true },
    {
      "-",
      function()
        local reveal_file = vim.fn.expand "%:p"
        if reveal_file == "" then
          reveal_file = vim.fn.getcwd()
        else
          local f = io.open(reveal_file, "r")
          if f then
            f.close(f)
          else
            reveal_file = vim.fn.getcwd()
          end
        end
        require("neo-tree.command").execute {
          action = "focus", -- OPTIONAL, this is the default value
          source = "filesystem", -- OPTIONAL, this is the default value
          position = "left", -- OPTIONAL, this is the default value
          reveal_file = reveal_file, -- path to file or folder to reveal
          reveal_force_cwd = true, -- change cwd without asking if needed
        }
      end,
      { desc = "Open File Explorer at current file or working directory" },
    },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}

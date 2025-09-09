require "options"
require "config.lazy"
require "autocmds"
vim.schedule(function()
  require "keymaps"
end)

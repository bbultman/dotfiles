-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del({ "n", "v" }, "<leader>cf")
vim.keymap.set({ "n", "v" }, "<leader>p", function()
  LazyVim.format.format({ force = true })
end, { desc = "Format buffer" })

vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>fn")

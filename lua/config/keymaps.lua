-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
--

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

-- Remove ** after ##
-- vim.keymap.set("v", "<leader>ra", ":s/## \\*\\*\\(.*\\)\\*\\*/## \\1/<CR>", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "w", "b", { noremap = true, silent = true })

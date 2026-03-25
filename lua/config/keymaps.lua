-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
--

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

-- Running C++ Code using the leader plus rr keymaps
vim.keymap.set("n", "<leader>rr", ":!g++ -o %:r % && ./%:r<CR>", { desc = "Compile & Run C++" })

-- Remove ** after ##
-- vim.keymap.set("v", "<leader>ra", ":s/## \\*\\*\\(.*\\)\\*\\*/## \\1/<CR>", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "w", "b", { noremap = true, silent = true })

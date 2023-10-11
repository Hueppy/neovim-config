local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-f>', builtin.find_files, {})
vim.keymap.set('n', '<c-d>', builtin.buffers, {})

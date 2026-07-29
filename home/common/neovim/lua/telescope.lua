local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep in files" })

vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })

vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help" })

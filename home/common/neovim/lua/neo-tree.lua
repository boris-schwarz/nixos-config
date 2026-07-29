require("neo-tree").setup({
  close_if_last_window = true,
  filesystem = {
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  window = {
    position = "left",
    width = 30,
  },
})

vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })

vim.keymap.set("n", "<leader>tf", "<cmd>Neotree position=current<cr>", { desc = "File tree (full window)" })

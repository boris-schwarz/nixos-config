local accent = "#94e2d5" -- catppuccin mocha teal

require("bufferline").setup({
  options = {
    -- show one "tab" per open buffer
    mode = "buffers",
    diagnostics = "nvim_lsp",
    -- leave room for the neo-tree sidebar
    offsets = {
      { filetype = "neo-tree", text = "Explorer", separator = true },
    },
    show_buffer_close_icons = false,
    show_close_icon = false,
    -- thick coloured bar under the active tab
    indicator = { style = "underline" },
    separator_style = "thick",
  },
  highlights = {
    -- active tab: bright, bold, accent underline
    buffer_selected = { fg = accent, bold = true, italic = false, sp = accent, underline = true },
    numbers_selected = { fg = accent, bold = true },
    diagnostic_selected = { bold = true },
    indicator_selected = { fg = accent },
    -- inactive tabs: dimmed so the active one stands out
    buffer = { fg = "#6c7086" },
    background = { fg = "#6c7086" },
  },
})

-- cycle through buffers
vim.keymap.set("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- move the current buffer left/right in the bar
vim.keymap.set("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
vim.keymap.set("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })

-- jump straight to a buffer by position (<leader>1 .. <leader>9)
for i = 1, 9 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    function() require("bufferline").go_to(i, true) end,
    { desc = "Go to buffer " .. i }
  )
end

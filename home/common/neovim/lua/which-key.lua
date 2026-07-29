local wk = require("which-key")
wk.setup({})

-- Label your prefix groups so the popup reads nicely
wk.add({
  { "<leader>t", group = "tree" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>b", group = "buffer" },
})

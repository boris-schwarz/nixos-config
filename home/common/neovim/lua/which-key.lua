local wk = require("which-key")
wk.setup({})

-- Label your prefix groups so the popup reads nicely
wk.add({
  { "<leader>t", group = "tree" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>b", group = "buffer" },
})

-- hide the <leader>1..9 "go to buffer N" maps from the popup
for i = 1, 9 do
  wk.add({ { "<leader>" .. i, hidden = true } })
end

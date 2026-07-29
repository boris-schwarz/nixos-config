require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local function map(l, r, desc)
      vim.keymap.set("n", l, r, { buffer = bufnr, desc = desc })
    end

    -- jump between changed hunks
    map("]h", function() gs.nav_hunk("next") end, "Next hunk")
    map("[h", function() gs.nav_hunk("prev") end, "Previous hunk")

    -- hunk actions, grouped under <leader>g
    map("<leader>gs", gs.stage_hunk, "Stage hunk")
    map("<leader>gr", gs.reset_hunk, "Reset hunk")
    map("<leader>gp", gs.preview_hunk, "Preview hunk")
    map("<leader>gd", gs.diffthis, "Diff this file")
    map("<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
  end,
})

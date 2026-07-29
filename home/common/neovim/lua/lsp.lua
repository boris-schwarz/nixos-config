vim.lsp.enable({ "rust_analyzer", "nixd", "lua_ls" })

-- Show diagnostic messages inline at the end of the line
vim.diagnostic.config({ virtual_text = true })

-- Keymaps, set only once a server actually attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)              -- go to definition
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)              -- find references
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                    -- hover docs
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)          -- rename symbol
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)     -- code actions
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
  end,
})

-- LSP completion
vim.o.completeopt = "menuone,noselect,popup,fuzzy"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- Manually open the menu with Ctrl-Space
vim.keymap.set("i", "<C-Space>", function()
  vim.lsp.completion.get()
end)

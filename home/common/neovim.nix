{
  pkgs,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Make the nixfmt binary available to neovim.
    extraPackages = [
      pkgs.nixfmt
      pkgs.ripgrep
      pkgs.fd
      pkgs.nixd
      pkgs.lua-language-server
    ];

    # Lua config
    initLua = ''
      -- Leader key
      vim.g.mapleader = " "

      -- Use the system clipboard
      vim.opt.clipboard = "unnamedplus"

      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      -- Line numbers: absolute on the current line, relative on the others
      vim.opt.number = true
      vim.opt.relativenumber = true

      -- Show whitespace characters
      vim.opt.list = true
      vim.opt.listchars = { tab = "» ", space = "·", trail = "·", nbsp = "␣" }

      -- Enable 24 bit color
      vim.opt.termguicolors = true

      -- Indentation: two spaces
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2

      -- Hide built-in mode, replaced by lua line
      vim.opt.showmode = false
    '';

    # Plugins
    plugins = [
      pkgs.vimPlugins.plenary-nvim
      pkgs.vimPlugins.nui-nvim
      pkgs.vimPlugins.nvim-web-devicons
      # file tree
      {
        plugin = pkgs.vimPlugins.neo-tree-nvim;
        type = "lua";
        config = ''
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
        '';
      }
      # Telescope
      {
        plugin = pkgs.vimPlugins.telescope-nvim;
        type = "lua";
        config = ''
          local builtin = require("telescope.builtin")
          vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
          vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Grep in files" })
          vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Open buffers" })
          vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Search help" })
        '';
      }
      # status line
      {
        plugin = pkgs.vimPlugins.lualine-nvim;
        type = "lua";
        config = ''
          require("lualine").setup({
            options = {
              theme = "auto",
              globalstatus = true,
            },
          })
        '';
      }
      # which-key
      {
        plugin = pkgs.vimPlugins.which-key-nvim;
        type = "lua";
        config = ''
          local wk = require("which-key")
          wk.setup({})

          -- Label your prefix groups so the popup reads nicely
          wk.add({
            { "<leader>t", group = "tree" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
          })
        '';
      }
      # nixfmt
      {
        plugin = pkgs.vimPlugins.conform-nvim;
        type = "lua";
        config = ''
          require("conform").setup({
            formatters_by_ft = {
              nix = { "nixfmt" },
            },
            format_on_save = {
              timeout_ms = 2000,
              lsp_format = "fallback",
            },
          })
        '';
      }
      # Treesitter
      {
        plugin = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
          p.nix
          p.lua
          p.rust
          p.bash
          # data
          p.json
          p.toml
          p.yaml
          p.markdown
          p.markdown_inline
          # web
          p.html
          p.css
          p.javascript
          p.typescript
          p.tsx
        ]);
        type = "lua";
        config = ''
          vim.api.nvim_create_autocmd("FileType", {
            callback = function()
              pcall(vim.treesitter.start)
            end,
          })
        '';
      }
      # LSP
      {
        plugin = pkgs.vimPlugins.nvim-lspconfig;
        type = "lua";
        config = ''
          vim.lsp.enable({ "rust_analyzer", "nixd", "lua_ls" })

          -- Show diagnostic messages inline at the end of the line
          vim.diagnostic.config({ virtual_text = true })

          -- Keymaps, set only once a server actually attaches to a buffer
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local opts = { buffer = args.buf }
              vim.keymap.set("n", "gd", vim.lsp.buf.definition,  opts)  -- go to definition
              vim.keymap.set("n", "gr", vim.lsp.buf.references,  opts)  -- find references
              vim.keymap.set("n", "K",  vim.lsp.buf.hover,       opts)  -- hover docs
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,      opts)  -- rename symbol
              vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- code actions
              vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
              vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count =  1, float = true }) end, opts)
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
        '';
      }

      # git signs
      {
        plugin = pkgs.vimPlugins.gitsigns-nvim;
        type = "lua";
        config = ''
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
              map("<leader>gs", gs.stage_hunk,   "Stage hunk")
              map("<leader>gr", gs.reset_hunk,   "Reset hunk")
              map("<leader>gp", gs.preview_hunk, "Preview hunk")
              map("<leader>gd", gs.diffthis,     "Diff this file")
              map("<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
            end,
          })
        '';
      }

      # autopairs (closes brackes, quotes, parens)
      {
        plugin = pkgs.vimPlugins.nvim-autopairs;
        type = "lua";
        config = ''
          require("nvim-autopairs").setup({})
        '';
      }

      # surround (surround words with characters, e.g. parenthesis)
      {
        plugin = pkgs.vimPlugins.nvim-surround;
        type = "lua";
        config = ''
          require("nvim-surround").setup({})
        '';
      }

    ];
  };
}

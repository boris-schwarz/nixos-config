{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Make the nixfmt binary available to neovim.
    extraPackages = [ pkgs.nixfmt ];

    # Lua config
    extraLuaConfig = ''
      -- Leader key
      vim.g.mapleader = " "

      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      -- Line numbers: absolute on the current line, relative on the others
      vim.opt.number = true
      vim.opt.relativenumber = true

      -- Show whitespace characters
      vim.opt.list = true
      vim.opt.listchars = { tab = "» ", space = "·", trail = "·", nbsp = "␣" }

      -- Indentation: two spaces
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
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
    ];
  };
}

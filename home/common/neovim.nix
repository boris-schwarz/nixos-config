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

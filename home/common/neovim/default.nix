{
  pkgs,
  ...
}:
{
  imports = [
    ./autopairs.nix
    ./conform.nix
    ./gitsigns.nix
    ./lsp.nix
    ./lualine.nix
    ./neo-tree.nix
    ./surround.nix
    ./telescope.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    initLua = builtins.readFile ./lua/init.lua;
    plugins = [
      # shared plugins only
      pkgs.vimPlugins.plenary-nvim
      pkgs.vimPlugins.nui-nvim
      pkgs.vimPlugins.nvim-web-devicons
    ];
  };
}

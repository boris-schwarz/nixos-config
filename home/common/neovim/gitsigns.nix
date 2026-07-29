{
  pkgs,
  ...
}:

{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.gitsigns-nvim;
      type = "lua";
      config = builtins.readFile ./lua/gitsigns.lua;
    }
  ];
}

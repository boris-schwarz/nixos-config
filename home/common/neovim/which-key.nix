{
  pkgs,
  ...
}:

{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.which-key-nvim;
      type = "lua";
      config = builtins.readFile ./lua/which-key.lua;
    }
  ];
}

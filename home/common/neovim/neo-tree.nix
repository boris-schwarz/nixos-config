{
  pkgs,
  ...
}:

{

  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.neo-tree-nvim;
      type = "lua";
      config = builtins.readFile ./lua/neo-tree.lua;
    }
  ];
}

{
  pkgs,
  ...
}:

{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.nvim-surround;
      type = "lua";
      config = builtins.readFile ./lua/surround.lua;
    }
  ];
}

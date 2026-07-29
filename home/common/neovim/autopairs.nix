{
  pkgs,
  ...
}:

{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.nvim-autopairs;
      type = "lua";
      config = builtins.readFile ./lua/autopairs.lua;
    }
  ];
}

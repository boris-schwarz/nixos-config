{
  pkgs,
  ...
}:

{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.lualine-nvim;
      type = "lua";
      config = builtins.readFile ./lua/lualine.lua;
    }
  ];
}

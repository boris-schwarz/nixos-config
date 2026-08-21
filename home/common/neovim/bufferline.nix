{
  pkgs,
  ...
}:

{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.bufferline-nvim;
      type = "lua";
      config = builtins.readFile ./lua/bufferline.lua;
    }
  ];
}

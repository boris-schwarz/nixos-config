# used for nixfmt
{
  pkgs,
  ...
}:

{
  programs.neovim.extraPackages = [
    pkgs.nixfmt
  ];

  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.conform-nvim;
      type = "lua";
      config = builtins.readFile ./lua/conform.lua;
    }
  ];
}

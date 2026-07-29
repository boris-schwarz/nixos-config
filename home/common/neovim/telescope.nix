{
  pkgs,
  ...
}:

{
  programs.neovim.extraPackages = [
    pkgs.ripgrep
    pkgs.fd
  ];

  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.telescope-nvim;
      type = "lua";
      config = builtins.readFile ./lua/telescope.lua;
    }
  ];
}

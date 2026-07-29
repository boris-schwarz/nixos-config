{
  pkgs,
  ...
}:

{
  programs.neovim.extraPackages = [
    pkgs.nixd
    pkgs.lua-language-server
  ];

  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ./lua/lsp.lua;
    }
  ];
}

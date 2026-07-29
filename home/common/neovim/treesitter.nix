{
  pkgs,
  ...
}:

{
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.nix
        p.lua
        p.rust
        p.bash
        # data
        p.json
        p.toml
        p.yaml
        p.markdown
        p.markdown_inline
        # web
        p.html
        p.css
        p.javascript
        p.typescript
        p.tsx
      ]);
      type = "lua";
      config = builtins.readFile ./lua/treesitter.lua;
    }
  ];
}

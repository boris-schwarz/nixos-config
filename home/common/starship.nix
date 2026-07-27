{ ... }:

{
  programs.starship = {
    enable = true;
    settings = fromTOML (builtins.readFile ./starship-catppuccin.toml);
  };
}

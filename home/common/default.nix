{ ... }:

{
  imports = [
    ./bash.nix
    ./kitty.nix
    ./starship.nix
    ./fonts.nix
  ];

  home.stateVersion = "26.05";
}

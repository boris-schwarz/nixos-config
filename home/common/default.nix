{ ... }:

{
  imports = [
    ./bash.nix
    ./kitty.nix
    ./starship.nix
    ./fonts.nix
    ./neovim.nix
    ./rust.nix
  ];

  home.stateVersion = "26.05";
}

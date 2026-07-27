{ ... }:

{
  imports = [
    ./bash.nix
    ./kitty.nix
    ./starship.nix
    ./fonts.nix
    ./plasma.nix
    ./neovim.nix
    ./zed.nix
    ./rust.nix
  ];

  home.stateVersion = "26.05";
}

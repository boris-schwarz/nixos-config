{ ... }:

{
  imports = [
    ./nix.nix
    ./networking.nix
    ./locale.nix
    ./desktop.nix
    ./users.nix
    ./packages.nix
    ./docker.nix
  ];
}

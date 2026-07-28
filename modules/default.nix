{ ... }:

{
  imports = [
    ./nix.nix
    ./networking.nix
    ./locale.nix
    ./desktop.nix
    ./users.nix
    ./ssh.nix
    ./packages.nix
    ./docker.nix
  ];
}

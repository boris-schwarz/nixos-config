{ ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # enable flakes and the new nix-command
  nixpkgs.config.allowUnfree = true; # allow unfree package installation
}

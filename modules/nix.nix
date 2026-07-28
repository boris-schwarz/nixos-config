{
  ...
}:

{
  # enable flakes and the new nix-command
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # allow unfree package installation
  nixpkgs.config.allowUnfree = true;

  # automated garbage-collection of old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # dedupe identical files in the store (hardlinks)
  nix.settings.auto-optimise-store = true;
}

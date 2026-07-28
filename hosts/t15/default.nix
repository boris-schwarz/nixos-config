{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../modules
  ];

  networking.hostName = "t15";
  system.stateVersion = "26.05";

  # use systemd-boot efi bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # keyboard layout
  services.xserver.xkb = {
    layout = "ch";
    variant = "de_nodeadkeys";
  };

  # inherit keyboard layout for cli before GUI starts
  console.useXkbConfig = true;
}

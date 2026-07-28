{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "t15";
  system.stateVersion = "26.05";

  # keyboard layout
  services.xserver.xkb = {
    layout = "ch";
    variant = "de_nodeadkeys";
  };

  # inherit keyboard layout for cli before GUI starts
  console.useXkbConfig = true;
}

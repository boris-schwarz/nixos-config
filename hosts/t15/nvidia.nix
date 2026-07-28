{
  ...
}:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # kernel modesetting
    modesetting.enable = true;

    # fixes graphical corruption after suspend/resume on laptops
    powerManagement.enable = true;

    # closed-source module - "open" one is only mature for Ampere+ (RTX 3000+);
    open = false;

    # install nvidia-settings GUI
    nvidiaSettings = true;

    # PRIME render offload: Intel drives the display, NVIDIA runs on demand
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # provides the `nvidia-offload` wrapper command
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}

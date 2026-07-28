{
  ...
}:
{
  # enable X11 windowing system
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    settings.General.Numlock = "on";
  };

  # plasma 6 desktop
  services.desktopManager.plasma6.enable = true;

  # cups printing support
  services.printing.enable = true;

  # audio via pipewire (replaces pulseaudio)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

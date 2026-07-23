{...}:{
	services.xserver.enable = true; # enable X11 windowing system
	services.displayManager.sddm.enable = true; # sddm login screen
	services.desktopManager.plasma6.enable = true; # plasma 6 desktop
	services.xserver.xkb = {
		layout = "ch";
		variant = "de_nodeadkeys";
	}; # keyboard layout
	services.printing.enable = true; # cups printing support 

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

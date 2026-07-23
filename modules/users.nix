{pkgs, ...}:{
	users.users.boris = {
		isNormalUser = true;
		description = "Boris";
		extraGroups = ["networkmanager" "wheel"];
		packages = with pkgs; [
			kdePackages.kate
		];
	};
}

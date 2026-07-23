{...}:{
	home.username = "boris";
	home.homeDirectory = "/home/boris";
	home.stateVersion = "26.05";
	programs.git = {
		enable = true;
		userName = "Boris Schwarz";
		userEmail = "13311628+boris-schwarz@users.noreply.github.com";
	};
	programs.bash = {
		enable = true;
		shellAliases = {
			nix-rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#t15";
			nix-test = "sudo nixos-rebuild test --flake ~/nixos-config#t15";
		};
	};
}

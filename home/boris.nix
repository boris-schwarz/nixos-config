{
	pkgs,
	...
}:{
	home.username = "boris";
	home.homeDirectory = "/home/boris";
	home.stateVersion = "26.05";

	home.packages = [
		pkgs.nerd-fonts.jetbrains-mono
	];
	fonts.fontconfig.enable = true;

	programs.git = {
		enable = true;
		userName = "Boris Schwarz";
		userEmail = "schwarz_boris@hotmail.com";
	};
	programs.bash = {
		enable = true;
		shellAliases = {
			nix-rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#t15";
			nix-test = "sudo nixos-rebuild test --flake ~/nixos-config#t15";
		};
	};
	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
		};
	};
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono Nerd Font";
			size = 14;
		};
		settings = {
			tab_bar_edge = "top";
			tab_bar_style = "powerline";
			scrollback_lines = 10000;
			enable_audio_bell = "no";
			enabled_layouts = "splits,stack";
		};
		keybindings = {
			"ctrl+shift+right" = "launch --location=vsplit --cwd=current";
			"ctrl+shift+down"  = "launch --location=hsplit --cwd=current";
			"ctrl+shift+h" = "neighboring_window left";
			"ctrl+shift+l" = "neighboring_window right";
    			"ctrl+shift+k" = "neighboring_window up";
			"ctrl+shift+j" = "neighboring_window down";
		};
	};
}

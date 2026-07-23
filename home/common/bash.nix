{ ... }:

{
	programs.bash = {
		enable = true;
		shellAliases = {
			nix-edit = "nvim ~/nixos-config";
			nix-rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#t15";
			nix-test = "sudo nixos-rebuild test --flake ~/nixos-config#t15";
		};
	};
}

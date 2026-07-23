{ ... }:

{
	imports = [
		./hardware-configuration.nix
		../../modules
	];

	networking.hostName = "t15";
	system.stateVersion = "26.05";
}

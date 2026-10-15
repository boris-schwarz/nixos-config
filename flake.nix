{
  description = "Boris NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # Pinned nixpkgs-master commit carrying claude-code 2.1.292.
    # The nixos-26.05 release channel only has 2.1.187, but Claude Code mods
    # need >= 2.1.287, so claude-code is pulled from here (see home/boris.nix).
    # To roll forward later: bump this to a newer master commit, or switch the
    # ref to "nixos-unstable" for rolling updates, then `nix flake update`.
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/7017219973bcbe11c1aebaf48f1ec80212e09428";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    ergonotify.url = "github:boris-schwarz/ergonotify";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

      nixosConfigurations.t15 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/t15/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.sharedModules = [
              inputs.plasma-manager.homeModules.plasma-manager
            ];
            home-manager.users.boris = import ./home/boris.nix;
          }
        ];
      };

      templates.rust = {
        path = ./templates/rust;
        description = "Rust project with a Nix dev shell + direnv";
      };
    };
}

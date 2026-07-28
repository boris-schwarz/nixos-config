graph TD
    subgraph INPUTS["flake inputs — pinned in flake.lock"]
        nixpkgs["nixpkgs (nixos-26.05)"]
        hm["home-manager (release-26.05)"]
        pm["plasma-manager"]
    end

    nixpkgs --> flake
    hm --> flake
    pm --> flake

    flake["flake.nix<br/>outputs.nixosConfigurations.t15"]
    flake --> t15["nixpkgs.lib.nixosSystem<br/>system = x86_64-linux"]

    t15 --> host["hosts/t15/default.nix<br/>MACHINE-specific"]
    t15 --> hmmod["home-manager NixOS module<br/>+ inline config"]

    host --> hw["hardware-configuration.nix<br/>filesystems · kernel modules · CPU"]
    host --> hset["hostName · stateVersion<br/>bootloader · keyboard"]
    host --> modagg["modules/default.nix"]

    subgraph SYSTEM["modules/ — SHARED system config"]
        modagg --> m1["nix.nix"]
        modagg --> m2["networking.nix"]
        modagg --> m3["locale.nix"]
        modagg --> m4["desktop.nix"]
        modagg --> m5["users.nix"]
        modagg --> m6["packages.nix"]
        modagg --> m7["docker.nix"]
    end

    hmmod --> boris["home/boris.nix<br/>git identity · boris-only kitty"]
    boris --> commonagg["home/common/default.nix"]

    subgraph HOME["home/common/ — SHARED user config"]
        commonagg --> h1["bash.nix"]
        commonagg --> h2["kitty.nix"]
        commonagg --> h3["starship.nix<br/>+ starship-catppuccin.toml"]
        commonagg --> h4["fonts.nix"]
        commonagg --> h5["neovim.nix"]
        commonagg --> h6["zed.nix"]
        commonagg --> h7["rust.nix"]
        commonagg --> h8["plasma.nix"]
    end

    hmmod -.->|"sharedModules: plasma-manager"| h8

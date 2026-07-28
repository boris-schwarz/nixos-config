# nixos-config

## Usage

### First ever run on a new system
```bash
# temporarily install git
nix-shell -p git

# clone this repo
git clone https://github.com/<you>/nixos-config ~/nixos-config

# create new host
cd ~/nixos-config
mkdir -p hosts/<host>
cp /etc/nixos/hardware-configuration.nix hosts/<host>/
nano hosts/<host>/default.nix # copy from hosts/t15/default.nix and adjust
nano flake.nix # add a nixosConfigurations.<host> output, copy from the t15 block
git add hosts/<host> flake.nix

# build
sudo nixos-rebuild switch --flake ~/nixos-config#<host> --option experimental-features "nix-command flakes"
```

### Regular usage
This config comes with some quality of life commands
```bash
nix-rebuild # rebuilds the system from the configuration
nix-test    # tests the configuration
nix-edit    # opens the configuration in neovim
```

## Maintenance

### Routine update

Run these commands in order to update all inputs
```bash
nix flake update    # bumps flake.lock input versions
nix-rebuild         # rebuild with newer versions
git add flake.lock  # add flake.lock to version control
git commit -m "flake update"    # commit the changes
```

Or update a single input
```bash
nix flake update nixpkgs
```

### OS update

Edit `flake.nix` and add the new version, e.g. 26.11
```nix
nixpkgs.url      = "github:NixOS/nixpkgs/nixos-26.11";
home-manager.url = "github:nix-community/home-manager/release-26.11";
```

Then run
```bash
nix flake update
nix-rebuild
```

> Do not change `system.stateVersion` in your host file, it's the original install version

### Reverting
```bash
sudo nixos-rebuild switch --rollback
git revert <commit>
nix-rebuild
```

### Cleanup
> Automated cleanup is declared, this section explains manual cleanup

Delete generations older than 2 weeks
```bash
sudo nix-collect-garbage --delete-older-than 14d
sudo nixos-rebuild boot
```

Delete home-manager generations older than 2 weeks
```bash
nix-collect-garbage --delete-older-than 14d
```

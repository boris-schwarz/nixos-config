{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      nix-edit = "nvim ~/nixos-config";
      zed = "zeditor"; # nixpkgs zed is the ZFS Event Daemon, probably not gonna use it ever, so reclaiming the zed command
    };
    initExtra = builtins.readFile ./bash/init.bash;
  };
}

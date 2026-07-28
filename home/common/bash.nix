{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      nix-edit = "nvim ~/nixos-config";
    };
    initExtra = ''
      nix-rebuild() {
        echo "+ sudo nixos-rebuild switch --flake ~/nixos-config#t15 $*"
        sudo nixos-rebuild switch --flake ~/nixos-config#t15 "$@"
      }
      nix-test() {
        echo "+ sudo nixos-rebuild test --flake ~/nixos-config#t15 $*"
        sudo nixos-rebuild test --flake ~/nixos-config#t15 "$@"
      }
    '';
  };
}

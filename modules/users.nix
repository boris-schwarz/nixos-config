{ pkgs, ... }: {
  users.users.boris = {
    isNormalUser = true;
    description = "Boris";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}

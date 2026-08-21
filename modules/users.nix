{
  pkgs,
  ...
}:

{
  # these are applications the "systems manager" would install on a pc
  # on the other hand, home manager applications are those that the "user" would
  users.users.boris = {
    isNormalUser = true;
    description = "Boris";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}

{ pkgs, ... }:

{
  home.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.roboto
  ];
  fonts.fontconfig.enable = true;
}

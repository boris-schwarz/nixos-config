{ pkgs, ... }: {
  # system-wide packages
  environment.systemPackages = with pkgs; [
    claude-code
    git
    zed-editor
  ];

  # programs with their own nixos module
  programs.firefox.enable = true;
}

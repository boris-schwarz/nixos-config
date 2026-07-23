{ pkgs, ... }: {
  # system-wide packages
  environment.systemPackages = with pkgs; [
    claude-code
    git
  ];

  # programs with their own NixOS module
  programs.firefox.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}

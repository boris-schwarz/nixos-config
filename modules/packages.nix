{ pkgs, ... }: {
  # system-wide packages
  environment.systemPackages = with pkgs; [
    claude-code
    git
    obsidian
    wl-clipboard
    prismlauncher
  ];

  # programs with their own nixos module
  programs.firefox = {
    enable = true;
    preferences = {
      "extensions.allowPrivateBrowsingByDefault" = true;
    };
    policies.ExtensionSettings = {
      # Bitwarden Password Manager
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        default_area = "navbar";
        private_browsing = false;
      };
      # uBlock Origin
      "uBlock0@raymondhill.net" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        default_area = "navbar";
        private_browsing = true;
      };
    };
  };
}

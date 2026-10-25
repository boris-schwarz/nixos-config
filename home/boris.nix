{
  pkgs,
  inputs,
  ...
}:

let
  # claude-code from pinned nixpkgs-master (mods need >= 2.1.287; the
  # nixos-26.05 channel only has 2.1.187). Imported with allowUnfree because
  # Claude Code is proprietary.
  pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in
{
  imports = [ ./common ];

  home.username = "boris";
  home.homeDirectory = "/home/boris";

  # only log real starship errors, not the slow-command timeout warnings
  home.sessionVariables = {
    STARSHIP_LOG = "error";
  };

  # user specific packages with no specific setup
  home.packages = with pkgs; [
    obsidian
    prismlauncher
    pkgsUnstable.claude-code # mods-capable build; see let-binding above
    thunderbird
    libreoffice
  ];

  # git config
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Boris Schwarz";
        email = "13311628+boris-schwarz@users.noreply.github.com";
      };
    };
  };

  # ergonotify
  systemd.user.services.ergonotify = {
    Unit = {
      Description = "ergonotify periodic desktop reminders";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${inputs.ergonotify.packages.${pkgs.system}.default}/bin/ergonotify";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # overrides of ./common
  programs.kitty.settings.startup_session = "/home/boris/.config/kitty/boris.session";
  xdg.configFile."kitty/boris.session".text = ''
    cd /home/boris/dev
    launch
  '';
}

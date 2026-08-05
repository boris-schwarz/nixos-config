{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ ./common ];

  home.username = "boris";
  home.homeDirectory = "/home/boris";

  # user specific packages
  home.packages = with pkgs; [
    obsidian
    prismlauncher
  ];

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

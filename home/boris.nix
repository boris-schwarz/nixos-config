{ ... }:

{
  imports = [ ./common ];

  home.username = "boris";
  home.homeDirectory = "/home/boris";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Boris Schwarz";
        email = "13311628+boris-schwarz@users.noreply.github.com";
      };
    };
  };

  # overrides of ./common
  programs.kitty.settings.startup_session = "/home/boris/.config/kitty/boris.session";
  xdg.configFile."kitty/boris.session".text = ''
    cd /home/boris/dev
    launch
  '';
}

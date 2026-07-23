{ ... }:

{
  imports = [ ./common ];

  home.username = "boris";
  home.homeDirectory = "/home/boris";

  programs.git = {
    enable = true;
    userName = "Boris Schwarz";
    userEmail = "schwarz_boris@hotmail.com";
  };

  # overrides of ./common
  programs.kitty.settings.startup_session = "/home/boris/.config/kitty/boris.session";
  xdg.configFile."kitty/boris.session".text = ''
    cd /home/boris/dev
    launch
  '';
}

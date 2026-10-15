{
  ...
}:
{
  programs.plasma = {
    enable = true;

    configFile.kwinrc."Effect-overview".BorderActivate = "";

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    input.keyboard = {
      numlockOnStartup = "on";
    };
  };
}

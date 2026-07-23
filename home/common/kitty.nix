{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    settings = {
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      scrollback_lines = 10000;
      enable_audio_bell = "no";
      enabled_layouts = "splits,stack";
    };
    keybindings = {
      "ctrl+shift+right" = "launch --location=vsplit --cwd=current";
      "ctrl+shift+down" = "launch --location=hsplit --cwd=current";
      "ctrl+shift+h" = "neighboring_window left";
      "ctrl+shift+l" = "neighboring_window right";
      "ctrl+shift+k" = "neighboring_window up";
      "ctrl+shift+j" = "neighboring_window down";
    };
  };
}

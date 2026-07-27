{ ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      scrollback_lines = 10000;
      enable_audio_bell = "no";
      enabled_layouts = "splits,stack";
      window_padding_width = "0 20";
      draw_minimal_borders = "no";
      active_border_color = "#ff5500";
      inactive_border_color = "#313244";
      inactive_text_alpha = "1.0";
      window_border_width = "1pt";
      background = "#11111b";
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

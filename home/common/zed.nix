{
  ...
}:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "catppuccin"
      "nix"
    ];

    userSettings = {
      theme = "Catppuccin Mocha";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 16;
      ui_font_size = 18;
      vim_mode = true;
      project_panel = {
        dock = "left";
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };

    userKeymaps = [
      {
        bindings = {
          "ctrl-!" = "terminal_panel::ToggleFocus";
        };
      }
    ];
  };
}

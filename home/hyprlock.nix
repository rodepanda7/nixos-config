{ host, ... }:

{
  programs.hyprlock = {
    enable = true;
    catppuccin.enable = false;

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        fractional_scaling = 0;
      };

      background = [
        {
          path = "${../wallpapers/nixos.png}";
        }
      ];

      # INPUT FIELD
      input-field = [
        {
          size = "500, 100";
          dots_size = 0.3;
          dots_center = true;
          placeholder_text = "Enter password";
          hide_input = false;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Time
        {
          text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';

          font_size = 130;
          font_family = "Maple Mono Bold";

          shadow_passes = 3;
          color = "$text";

          position = "0, -200";
          halign = "center";
          valign = "top";
        }
        # Date
        {
          text = ''cmd[update:1000] echo "- $(date +'%A, %B %d') -" '';

          font_size = 40;
          font_family = "Maple Mono";

          shadow_passes = 3;
          color = "$text";

          position = "0, -450";
          halign = "center";
          valign = "top";
        }
      ];
    };
  };
}

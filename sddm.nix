# sddm.nix - SDDM Display Manager Configuration with Catppuccin Theme
{
  config,
  pkgs,
  lib,
  ...
}:
let
  # Custom Hyprland session that uses home-manager's start-hyprland wrapper
  hyprland-session = pkgs.writeTextDir "share/wayland-sessions/hyprland.desktop" ''
    [Desktop Entry]
    Name=Hyprland
    Comment=An intelligent dynamic tiling Wayland compositor
    Exec=start-hyprland
    Type=Application
    DesktopNames=Hyprland
    Keywords=tiling;wayland;compositor;
  '';

  # Custom override of sddm-astronaut-theme
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "japanese_aesthetic"; # or any other theme
      themeConfig = {
        # Customize colors and settings
        HeaderTextColor = "#d5c4a1";
        Background = "Backgrounds/nixos.png";
        # ... other theme configuration options
      };
    }).overrideAttrs
      (oldAttrs: {
        # Optional: Inject custom background image
        installPhase = oldAttrs.installPhase + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${./wallpapers/nixos.png} \
            $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/nixos.png
        '';
      });
in
{
  # SDDM Display Manager Configuration
  services.displayManager.sddm = {
    enable = true;

    # Make SDDM use QT6
    package = pkgs.kdePackages.sddm;

    # Enable Wayland support
    wayland = {
      enable = true;
    };

    theme = "sddm-astronaut-theme";
    extraPackages = [ pkgs.sddm-astronaut ];

    settings.Wayland.SessionDir = "${hyprland-session}/share/wayland-sessions";
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
  ];
}

{ pkgs, ... }:

{
  programs.hyprpaper = {
    enable = true;

    wallpaper = {
      monitor = "";
      path = "/home/floris/nixos-config/wallpapers/nixos.png";
      fit_mode = "cover";
    };
  }
}

{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/floris/nixos-config/wallpapers/nixos.png" ];
      wallpaper = [ ",/home/floris/nixos-config/wallpapers/nixos.png" ];
    };
  };
  # services.hyprpaper = {
  #   enable = true;
  #
  #   settings = {
  #     preload = [
  #       "/home/floris/nixos-config/wallpapers/nixos.png"
  #     ];
  #
  #     wallpaper = [
  #       {
  #         monitor = "";
  #         path = "/home/floris/nixos-config/wallpapers/nixos.png";
  #       }
  #     ];
  #   };
  # };
}

# home.nix
{ config, pkgs, ... }:

{
  # Make sure you have the xremap Home Manager module imported if your setup requires it,
  # or use the system-level module if you prefer. Here is the home.nix configuration:
  services.xremap = {
    enable = true;
    
    # Swapping Caps and Escape
    config = {
      modmap = [
        {
          name = "Swap Caps and Escape";
          remap = {
            "CapsLock" = "Esc";
            "Esc" = "CapsLock";
          };
        }
      ];
    };
  };
}

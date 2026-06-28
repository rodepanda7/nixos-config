# home.nix
{
  config,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

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
        {
          name = "Swap Alt and Windows";
          remap = {
            "Leftmeta" = "Leftalt";
            "Leftalt" = "Leftmeta";
          };
        }
      ];
    };
  };
}

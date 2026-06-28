{
  description = "Floris' NixOS Configuration";

  # Binary cache configuration for CUDA packages
  nixConfig = {
    extra-substituters = [
      "https://cuda-maintainers.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix/d75e3fe67f49728cb5035bc791f4b9065ff3a2c9";
    xremap-flake.url = "github:xremap/nix-flake";
    lazyvim.url = "github:pfassina/lazyvim-nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs"; # Use same nixpkgs version for consistency
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      catppuccin,
      lazyvim,
      ...
    }@inputs:
    let
      theme = import ./theme/theme.nix;
      system = "x86_64-linux";

      # Import unstable packages with unfree software enabled
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true; # Allow proprietary software like Steam, Discord, etc.
      };
    in
    {
      nixosConfigurations = {
        "nixos" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              inputs
              pkgs-unstable
              theme
              catppuccin
              lazyvim
              ;
          }; # Pass variables to all modules
          modules = [
            ./configuration.nix # System-level configuration
            home-manager.nixosModules.home-manager # User environment management
            catppuccin.nixosModules.catppuccin # Catppuccin theming support
          ];
        };
      };
    };
}

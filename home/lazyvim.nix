# home/neovim.nix
{ pkgs-unstable, lazyvim, ... }:

{
  imports = [
    lazyvim.homeManagerModules.default
  ];

  programs.lazyvim = {
    enable = true;
    extras = {
      lang.nix.enable = true;
      lang.python = {
        enable = true;
        installDependencies = true; # Install ruff
        installRuntimeDependencies = true; # Install python3
      };
      lang.go = {
        enable = true;
        installDependencies = true; # Install gopls, gofumpt, etc.
        installRuntimeDependencies = true; # Install go compiler
      };
      lang.rust = {
        enable = true;
        installDependencies = true; # rust-analyzer
        installRuntimeDependencies = true; # rust toolchain
      };
      lang.dart.enable = true;
      lang.typst.enable = true;
      lang.markdown.enable = true;
    };

    # Additional packages (optional)
    extraPackages = with pkgs-unstable; [
      nixd # Nix LSP
      alejandra # Nix formatter
      fish
      shfmt
      stylua
      ast-grep
      luajitPackages.luarocks_bootstrap
      nixfmt
      imagemagick
      ghostscript
      texliveTeTeX
      mermaid-cli
      trash-cli
      typst
      rust-analyzer
      ghc
      haskell-language-server
      cabal-install
      stack
      dart
      flutter
      vimPlugins.nvim-lspconfig
      coqPackages.coq-lsp
      markdownlint-cli2
    ];

    # Only needed for languages not covered by LazyVim extras
    treesitterParsers = with pkgs-unstable.vimPlugins.nvim-treesitter-parsers; [
      wgsl # WebGPU Shading Language
      templ # Go templ files
      rust
      typst
      haskell
      dart
      ocaml
    ];

    plugins = {
      rocq = ''
        return {
          "whonore/Coqtail",
          ft = { "coq" },
        }
      '';
    };
  };
}

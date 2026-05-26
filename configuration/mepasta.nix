{
  inputs,
  config,
  pkgs,
  ...
}: {
  users.users.mepasta = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      # Shell utilities
      tree
      git
      unzip
      ripgrep
      lazygit
      valgrind-light
      tmux

      # GUI utilities
      btop

      # Hyprland/ui
      kitty
      hyprpaper
      cliphist
      rofi
      wl-clipboard
      wtype
      nautilus
      swaybg
      awww
      gnome-themes-extra
      brightnessctl
      fzf
      kdePackages.qtdeclarative

      # Editors & LSP
      vis
      neovim
      tree-sitter
      lua
      lua-language-server
      stylua

      # Rust toolchain
      rustup
      rustfmt
      clippy

      # C/C++ dev & make
      gcc
      libgcc
      clang
      libclang
      gnumake
      tinycc
      unixodbc

      # Nix/NixOS
      nixd
      alejandra
      nil
      direnv
    ];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    brotli
    unixodbc
    glib
    libc
  ];

  programs.firefox.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}

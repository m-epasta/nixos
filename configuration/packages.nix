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
      gh
      jq

      # GUI utilities
      btop
      libreoffice
      gdbgui

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

      # Editors & LSP
      vis
      neovim
      tree-sitter
      lua
      lua-language-server
      stylua

      # Just (make alternative)
      just
      just-lsp
      just-formatter

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
      gdb
      argparse

      # QML
      qmplay2-qt6
      kdePackages.qtdeclarative

      # Nix/NixOS
      nixd
      alejandra
      nil
      direnv
      statix

      # ASM
      fasm

      # V
      vlang

      # Zig
      zig
      zig-shell-completions
      zig-zlint
      zls

      # Odin
      odin
      ols

      # Python
      python3

      # Font
      fontforge
    ];
  };

  programs = {
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      brotli
      unixodbc
      glib
      libc
      tinycc
    ];

    firefox.enable = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
  };
}

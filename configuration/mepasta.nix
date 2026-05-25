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
      tree
      git
      unzip
      ripgrep

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
      unixodbc

      vis
      neovim
      tree-sitter
      lua
      lua-language-server
      stylua

      rustup
      rustfmt
      clippy

      gcc
      libgcc
      clang
      libclang
      gnumake
      tinycc

      nixd
      alejandra
      nil
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

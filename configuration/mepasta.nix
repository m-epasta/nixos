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

      quickshell
      kitty
      cliphist
      rofi
      wl-clipboard
      wtype
      nautilus
      swaybg

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

      nixd
      alejandra
      nil
    ];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
  ];

  programs.firefox.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}

# TODO: Look deeply into commented sections
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./configuration/mepasta.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mushBoy";

  networking.networkmanager.enable = true;

  services.displayManager.ly.enable = true;

  time.timeZone = "Europe/Paris";

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
    # xkb.variant = "latin9";
  };

  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.options = "eurosign:e";
	
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # users.users.mepasta = {
  #   isNormalUser = true;
  #   extraGroups = ["wheel"];
  #   packages = with pkgs; [
  #     tree
  #     git
  #     unzip
  #     ripgrep
  #
  #     quickshell
  #     kitty
  #     cliphist
  #     rofi
  #     wl-clipboard
  #     wtype
  #     nautilus
  #     swaybg
  #
  #     vis
  #     neovim
  #     tree-sitter
  #     lua
  #     lua-language-server
  #     stylua
  #
  #
  #     rustup
  #     rustfmt
  #     clippy
  #
  #     gcc
  #     libgcc
  #     clang
  #     libclang
  #
  #     nixd
  #     alejandra
  #     nil
  #   ];
  # };
  #
  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #   stdenv.cc.cc.lib
  #   zlib
  # ];
  #
  # programs.firefox.enable = true;
  #
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  #   package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  #   portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  # };

  environment.systemPackages = with pkgs; [
    vim
    wget
    phinger-cursors
    pavucontrol
    lua-language-server
  ];

  programs.dconf.enable = true;
  environment.sessionVariables = {
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "24";
  };

  #services.openssh = {
  #  enable = true;
  #  settings = {
  #    PasswordAuthentification = true;
  #    PermitRootLogin = "no";
  #  };
  #  openFirewall = true;
  #};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11";
}

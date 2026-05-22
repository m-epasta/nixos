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
    ./configuration/net.nix
    ./configuration/mepasta.nix
    ./configuration/input.nix
    ./configuration/audio.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Authentification program (first GUI to load)
  services.displayManager.ly.enable = true;

  time.timeZone = "Europe/Paris";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    vim
    wget
    phinger-cursors
    pavucontrol
    lua-language-server
  ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11";
}

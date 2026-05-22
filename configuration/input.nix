{
  config,
  pkgs,
  ...
}: {
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
    # xkb.variant = "latin9";
  };

  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.options = "eurosign:e";

  fonts.packages = with pkgs; [nerd-fonts.jetbrains-mono];

  fonts.fontconfig.defaultFonts = {
    monospace = ["JetBrainsMono Nerd Font"];
  };

  programs.dconf.enable = true;
  environment.sessionVariables = {
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "24";
  };
}

{ config, pkgs, inputs, ... }:
{
  imports = [inputs.walker.homeManagerModules.default];

  programs.walker.enable = true;

  home.stateVersion = "26.05";
}

{ config, pkgs, ... }:

{
  imports = [ ./configs/main.nix ./packages/main.nix ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "22.05";

  home.keyboard.options = [ "ctrl:swapcaps" ];

  programs.home-manager.enable = true;
}

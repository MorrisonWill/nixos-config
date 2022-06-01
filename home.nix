{ config, pkgs, ... }:

{
  imports = [ ./configs/main.nix ./packages/main.nix ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "22.05";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    size = 32;
    x11.enable = true;
  };

  programs.home-manager.enable = true;
}

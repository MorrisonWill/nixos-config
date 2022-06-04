{ config, pkgs, lib, ... }:

{

  imports = [
    ./zsh.nix
    ./i3.nix
    ./i3status-rs.nix
    ./alacritty.nix
    ./picom.nix
    ./redshift.nix
    ./screen-locker.nix
    ./rofi.nix
    ./zoxide.nix
    ./github.nix
    ./neovim
    ./languages.nix
    ./firefox.nix
    ./nnn.nix
    ./xcape.nix
  ];

  xsession.enable = true;
  home.pointerCursor = {
    package = pkgs.gnome.adwaita-icon-theme;
    gtk.enable = true;
    x11.enable = true;
    name = "Adwaita";
    size = 45;
  };

}

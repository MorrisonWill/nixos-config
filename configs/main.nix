{ config, pkgs, lib, ... }:

{

  imports = [
    ./zsh.nix
    ./i3.nix
    ./i3status-rs.nix
    ./alacritty.nix
    ./picom.nix
  ];

  xsession.enable = true;

}

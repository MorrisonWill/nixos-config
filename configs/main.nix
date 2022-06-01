{ config, pkgs, lib, ... }:

{

  imports = [
    ./zsh.nix
    ./i3.nix
    ./i3status-rs.nix
    ./alacritty.nix
    ./picom.nix
    ./redshift.nix
  ];

  xsession.enable = true;
}

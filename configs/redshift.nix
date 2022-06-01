{ config, pkgs, lib, ... }:

{
  services.redshift = {
    enable = true;
    latitude = "40.34872";
    longitude = "-74.65905";
  };
}

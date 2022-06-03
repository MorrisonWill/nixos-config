{ config, pkgs, lib, ... }:

{
  # LANGUAGES
  programs.go.enable = true;

  # TOOLING
  programs.opam = {
    enable = true;
    enableZshIntegration = true;
  };
}

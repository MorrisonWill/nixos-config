{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages:
    with python-packages; [
      pip
      black
      setuptools
      wheel
      flake8
      virtualenv
    ]);
in {
  home.packages = with pkgs; [
    # MISC
    tmate
    pavucontrol
    vlc
    brightnessctl

    # TERMINAL
    neofetch
    zip
    unzip
    zoxide

    # BROWSER
    firefox

    # DEVELOPMENT
    gcc
    nixfmt
    default-python
    git
  ];
}

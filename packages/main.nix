{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages:
    with python-packages; [
      pip
      setuptools
      wheel
      flake8
      nix-prefetch-github
    ]);
in {
  home.packages = with pkgs; [
    # MISC
    pavucontrol
    vlc
    brightnessctl
    sysfsutils
    ripgrep
    bleachbit

    # TERMINAL
    neofetch
    zip
    unzip
    exa
    powertop
    lm_sensors
    rmtrash
    trash-cli
    upterm
    tldr
    croc

    # DEVELOPMENT
    gcc
    nixfmt
    default-python
    git
    nixfmt
    rnix-lsp
    nodejs
    flyctl
    distrobox


    # I3
    xsecurelock
    rofi
    xss-lock

    xclip

    # SCREENSHOTS
    maim

    # PRODUCTIVITY
    bitwarden
    libreoffice-fresh
    transmission

    # SECURITY
    mullvad-vpn

    # CRYPTO
    bitcoin
    monero

    # CHAT
    discord # unfree
    tdesktop
    teams

    openconnect_openssl

    google-chrome
  ];
}

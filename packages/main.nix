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

    # Animate library dependencies
    gnumake
    pkg-config
    ocamlPackages.lablgtk
    gnome2.libgnomecanvas
    gnome2.libgnomecanvas.dev

    cairo
    cairo.dev
    ocaml
    opam

    # MISC
    pavucontrol
    vlc
    brightnessctl
    sysfsutils
    ripgrep
    bleachbit
    spotify
    mnemosyne

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
    bat

    # DEVELOPMENT
    gcc
    nixfmt
    default-python
    git
    nixfmt
    rnix-lsp
    nodejs-16_x
    distrobox
    burpsuite
    bore-cli
    gh
    clang-tools

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
    trezor-suite
    trezor-udev-rules
    trezord

    # CHAT
    discord # unfree
    tdesktop
    teams
    hexchat
    element-desktop

    openconnect_openssl

    google-chrome

    steam

    simplescreenrecorder

    remmina

    sqlitebrowser

    polymc

  ];
}

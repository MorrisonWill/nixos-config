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
      jedi-language-server
      nix-prefetch-github
    ]);
in {
  home.packages = with pkgs; [
    # MISC
    tmate
    pavucontrol
    vlc
    brightnessctl
    sysfsutils
    ripgrep

    # TERMINAL
    neofetch
    zip
    unzip
    exa

    # DEVELOPMENT
    gcc
    nixfmt
    default-python
    git
    dune_2
    rust-analyzer
    gopls
    cargo
    rustc
    nixfmt
    rnix-lsp
    nodejs
    nodePackages.npm
    nodePackages.prettier
    rustfmt
    stylua

    # I3
    xsecurelock
    rofi
    xss-lock

    bitwarden

    xclip
    maim
    hacksaw
  ];
}

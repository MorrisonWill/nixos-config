{ config, pkgs, ... }:

{

  # CORE CONFIGURATION
  imports = [ ./hardware-configuration.nix ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # FONTS
  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };

  # PACKAGES
  environment = {
    systemPackages = with pkgs; [ neovim virt-manager ];
    variables.EDITOR = "nvim";
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "compose:lwin";

      libinput = {
        enable = true;

        touchpad = {
          accelSpeed = "0.3";
          naturalScrolling = true;
          clickMethod = "clickfinger";
          tapping = true;
        };
      };

      displayManager = {
        autoLogin.user = "user";
        autoLogin.enable = true;

        lightdm = { enable = true; };
      };

      desktopManager.xterm.enable = true;

    };
  };

  services.fprintd.enable = true;

  services.fstrim.enable = true;

  services.mullvad-vpn.enable = true;

  services.thermald.enable = true;
  services.tlp.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # USERS

  users.users.user = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" ];
    initialPassword = "password";
  };

  # NIX
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  # DOCKER
  virtualisation.docker.enable = true;

  # SYSTEM
  system = { stateVersion = "22.05"; };

  # ALLOW UNFREE
  nixpkgs.config.allowUnfree = true;

  hardware.opengl.driSupport32Bit = true;

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
}


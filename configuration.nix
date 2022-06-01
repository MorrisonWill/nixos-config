{ config, pkgs, ... }:

{

  # CORE CONFIGURATION
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
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
      (nerdfonts.override {
        fonts = [
          "FiraCode"
	];
      })
    ];
  };

  # PACKAGES
  environment = {
    systemPackages = with pkgs; [
      neovim
      xcape
    ];
    variables.EDITOR = "nvim";
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
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

	lightdm = {
	  enable = true;
	};
      };

      desktopManager.xterm.enable = true;

      xkbOptions = "ctrl:swapcaps";

    };
    tlp.enable = true;
  };

  services.fprintd.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # USERS

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
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

  # SYSTEMD
  systemd.user.services."xcape" = {
    enable = true;
    description = "xcape to map caps to CTRL and ESC";
    wantedBy = [ "default.target" ];
    serviceConfig.Type = "forking";
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.xcape}/bin/xcape";
  };

  # SYSTEM

  system = {
    stateVersion = "22.05";
  };
}

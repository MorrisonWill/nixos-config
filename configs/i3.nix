{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod1";

      window.border = 2;

      bars = [
        {
          position = "top";
          statusCommand = 
	    "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
        }
      ];

      keybindings = lib.mkOptionDefault {
        "XF86AudioMute" = "exec amixer set Master toggle";
	"XF86AudioLowerVolume" = "exec amixer set Master 4%-";
	"XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
	"XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
	"XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
	"${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
	"${modifier}+space" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
	"${modifier}+Shift+space" = "exec ${pkgs.firefox}/bin/firefox";
      };
    };

    extraConfig = ''
      new_window 1pixel
      exec xrandr --dpi 200.84
      exec i3-msg workspace 1
    '';
  };
}

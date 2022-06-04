{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod1";

      window.border = 2;

      bars = [{
        position = "top";
        statusCommand =
          "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
      }];

      keybindings = lib.mkOptionDefault {
        "XF86AudioMute" = "exec amixer set Master toggle";
        "XF86AudioLowerVolume" = "exec amixer set Master 4%-";
        "XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+space" =
          "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "${modifier}+Shift+Return" = "exec ${pkgs.firefox}/bin/firefox";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";

        "${modifier}+Shift+f" = "floating toggle";

        "${modifier}+Shift+n" = "exec ${pkgs.alacritty}/bin/alacritty -e nnn";

        "Print" = "exec maim --select ~/screenshot-$(date +%s).jpg";
      };

      modes = lib.mkOptionDefault {
        resize = {
          "h" = "resize grow width 10 px or 10 ppt";
          "j" = "resize grow height 10 px or 10 ppt";
          "k" = "resize shrink height 10 px or 10 ppt";
          "l" = "resize shrink width 10 px or 10 ppt";
          "${modifier}+r" = "mode default";
        };

      };
    };

    extraConfig = ''
      new_window 1pixel
      exec xrandr --dpi 200.84
      exec i3-msg workspace 1
    '';
  };
}

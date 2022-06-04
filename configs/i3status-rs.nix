{ pkgs, ... }:

{
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "net";
            format = "{ssid}";
            format_alt =
              "{signal_strength} {ip} {speed_up} {speed_down} {graph_down:8;M*_b#50}";
          }
          {
            block = "memory";
            display_type = "memory";
            format_mem = "{mem_used_percents}";
            format_swap = "{swap_used_percents}";
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "temperature";
            collapsed = true;
            interval = 10;
            format = "{min} min, {max} max, {average} avg";

          }
          { block = "sound"; }
          {
            block = "battery";
            interval = 10;
            format = "{percentage} {time}";
          }
          {
            block = "time";
            interval = 60;
            format = "%a %m/%d %R";
          }
        ];
      };
    };
  };
}

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
          }
          { block = "sound"; }
          {
            block = "battery";
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

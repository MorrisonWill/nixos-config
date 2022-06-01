{ pkgs, ... }:

{
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
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

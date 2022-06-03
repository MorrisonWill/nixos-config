{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      colors = {
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };

        normal = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#e5c07b";
          blue = "0x61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };

        bright = {
          black = "#4b5263";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#e5c07b";
          blue = "0x61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };
      };



      font = {
        normal.family = "FiraCode Nerd Font Mono";
	size = 13.0;
      };

      shell = { program = "${pkgs.zsh}/bin/zsh"; };

    };
  };
}

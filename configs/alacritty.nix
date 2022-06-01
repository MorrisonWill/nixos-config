{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal.family = "FiraCode Nerd Font Mono";
	size = 13.0;
      };

      shell = { program = "${pkgs.zsh}/bin/zsh"; };
      
    };
  };
}

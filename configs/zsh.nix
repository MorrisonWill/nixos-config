{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";

    plugins = [
      {
        name = "powerlevel10k-config";
	src = lib.cleanSource ./p10k-config;
	file = "p10k.zsh";
      }
    ];

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
	{ name = "desyncr/autols"; }
      ];

    };

    shellAliases = {
      cd = "z";
    };
  };
}

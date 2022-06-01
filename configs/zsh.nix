{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";

    initExtra = ''
      eval "$(zoxide init zsh)"
    '';

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
      ];

    };

    shellAliases = {
      cd = "z";
    };
  };
}

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


    shellAliases = {
      cd = "z";
    };
  };
}

{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    # enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";

    plugins = [
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "nixify";
        src = lib.cleanSource ./nixify;
        file = "nixify.zsh";
      }
      {
        name = "auto-ls";
        src = lib.cleanSource ./auto-ls;
        file = "auto-ls.zsh";
      }
    ];

    zplug = {
      enable = true;
      plugins = [
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        }
        { name = "unixorn/fzf-zsh-plugin"; }
      ];

    };

    shellAliases = {
      cd = "z";
      rm = "rmtrash";
      rmdir = "rmdirtrash";
      cat = "bat";
      pn = "pnpm";
      emacs = "emacsclient -c -a 'emacs'";
      doom = "~/.emacs.d/bin/doom";
    };
  };
}

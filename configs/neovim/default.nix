{ config, lib, pkgs, ... }:

let
  copilot-vim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "copilot-vim";
    version = "1.3.4";
    src = pkgs.fetchgit {
      url = "https://github.com/github/copilot.vim";
      rev = "585e1a9f6a6e39d405e46066233993ccad8bbd25";
      hash = "sha256-xHfS1LsCVSIvmhHYbqjfGHaUIPJHFpD11by55saxA98=";
    };
  };
  vim-wiki = pkgs.vimUtils.buildVimPlugin rec {
    pname = "wiki.vim";
    version = "0.4";
    src = pkgs.fetchgit {
      url = "https://github.com/lervag/wiki.vim";
      rev = "a6da7c0f7bb27f5477f0195302534018bb75b84e";
      hash = "sha256-7K8W5cL6MGVs7ywzR3w9EoeZJA05IqODgdRjUTggtyg=";
    };
  };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./plugins.lua}
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./commands.lua}
      EOF
    '';

    plugins = with pkgs.vimPlugins; [
      onedark-vim

      nvim-treesitter

      # adaptive tabbing
      vim-sleuth

      neoscroll-nvim

      vim-surround

      comment-nvim

      nvim-autopairs

      nvim-tree-lua

      nvim-web-devicons

      lualine-nvim

      nvim-lspconfig

      nvim-cmp
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      lspkind-nvim

      copilot-vim

      vim-wiki

      trouble-nvim

      ale

      bufferline-nvim

      toggleterm-nvim

      lightspeed-nvim
    ];

  };
}

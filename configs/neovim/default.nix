{ config, lib, pkgs, ... }:

let
  copilot-vim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "copilot-vim";
    version = "1.4.2";
    src = pkgs.fetchgit {
      url = "https://github.com/github/copilot.vim";
      rev = "c2e75a3a7519c126c6fdb35984976df9ae13f564";
      hash = "sha256-V13La54aIb3hQNDE7BmOIIZWy7In5cG6kE0fti/wxVQ=";
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
      diffview-nvim

      onedark-vim

      # adaptive tabbing
      vim-sleuth

      nvim-treesitter

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

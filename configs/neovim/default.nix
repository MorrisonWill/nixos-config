{ config, lib, pkgs, ... }:

{
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

      # no copilot

      ale

      bufferline-nvim

      toggleterm-nvim

      lightspeed-nvim
    ];

  };
}

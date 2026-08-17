{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        lsp.enable = true;
        utility.vim-wakatime.enable = true;
        options = {
          tabstop = 2;
          softtabstop = 2;
          shiftwidth = 2;
        };
        filetree.neo-tree.enable = true;
        tabline.nvimBufferline.enable = true;
        statusline.lualine.enable = true;
        binds.whichKey.enable = true;
        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
          setupOpts = {
            direction = "horizontal";
          };
        };
        dashboard.alpha.enable = true;
        autocomplete.blink-cmp.enable = true;
      };
    };
  };
}


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
      };
    };
  };
}


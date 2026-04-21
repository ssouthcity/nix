{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.lsp.enable = true;

    programs.nixvim.lsp = {
      servers = {
        gopls.enable = true;
        hls.enable = true;
        jsonls.enable = true;
        nixd.enable = true;
        ruff.enable = true;
        rust_analyzer.enable = true;
        templ.enable = true;
        terraformls.enable = true;
        ty.enable = true;
        yamlls.enable = true;
      };
      keymaps = [
        {
          key = "K";
          lspBufAction = "hover";
        }
        {
          key = "gD";
          lspBufAction = "references";
        }
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gi";
          lspBufAction = "implementation";
        }
        {
          key = "gt";
          lspBufAction = "type_definition";
        }
        {
          key = "<leader>rn";
          lspBufAction = "rename";
        }
        {
          key = "<leader>ca";
          lspBufAction = "code_action";
        }
      ];
    };
  };
}

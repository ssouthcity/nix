{
  flake.homeModules.ai = {
    programs.opencode = {
      enable = true;
      settings = {
        permission = {
          "*" = "ask";
          "read" = "allow";
          "write" = "allow";
          "edit" = "allow";
          "grep" = "allow";
          "glob" = "allow";
          "list" = "allow";
          "lsp" = "allow";
          "skill" = "allow";
          "todowrite" = "allow";
          "todoread" = "allow";
          "question" = "allow";
        };
        provider = {
          ollama = {
            npm = "@ai-sdk/openai-compatible";
            name = "Ollama (local)";
            options = {
              baseURL = "http://127.0.0.1:11434/v1";
            };
            models = {
              "inkling-2-mini" = {
                name = "inkling-2-mini";
              };
            };
          };
        };
      };
    };
  };
}

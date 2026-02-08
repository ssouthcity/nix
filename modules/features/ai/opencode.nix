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
              baseURL = "https://ollama.southcity.dev/v1";
            };
            models = {
              "deepseek-r1" = {
                name = "deepseek-r1";
              };
              "qwen3" = {
                name = "qwen3";
              };
            };
          };
        };
      };
    };
  };
}

{
  flake.nixosModules.ai = { pkgs, ... }: {
    allowedUnfreePackages = [
      "cccl"
      "cuda_crt"
      "cuda_cudart"
      "cuda_nvcc"
      "cuda_nvrtc"
      "libcublas"
      "libnvvm"
    ];

    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;

      syncModels = true;
      loadModels = [
        "qwen3.8"
      ];
    };
  };
}

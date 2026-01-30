{
  flake.nixosModules.nvidia =
    { pkgs, ... }:
    {
      allowedUnfreePackages = [
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"
      ];

      hardware.graphics = {
        enable = true;
        extraPackages = [ pkgs.nvidia-vaapi-driver ];
      };

      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {
        open = true;
        nvidiaSettings = true;
      };
    };
}

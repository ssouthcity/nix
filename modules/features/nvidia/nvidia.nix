{
  flake.nixosModules.nvidia =
    { config, pkgs, ... }:
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
        modesetting.enable = true;
        powerManagement.enable = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };

      boot.kernelParams = [
        "nvidia_drm.modeset=1"
        "nvidia_drm.fbdev=1"
      ];

      boot.initrd.systemd.enable = true;
      boot.initrd.kernelModules = [ 
        "nvidia" 
        "nvidia_modeset" 
        "nvidia_drm" 
      ];
    };
}

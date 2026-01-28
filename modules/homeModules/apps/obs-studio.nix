{
  flake.homeModules.obs-studio =
    { pkgs, ... }:
    {
      programs.obs-studio = {
        enable = true;
        plugins = [
          pkgs.obs-studio-plugins.wlrobs
          pkgs.obs-studio-plugins.obs-backgroundremoval
        ];
      };
    };
}

{
  flake.homeModules.cli =
    { pkgs, ... }:
    let
      toml = pkgs.formats.toml { };
    in
    {
      home.packages = [ pkgs.tmux-sessionizer ];

      xdg.configFile."tms/config.toml".source = toml.generate "config.toml" {
        search_dirs = [
          {
            path = "~/src";
            depth = 1;
          }
        ];
      };
    };
}

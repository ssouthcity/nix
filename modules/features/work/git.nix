{
  flake.homeModules.work =
    { lib, ... }:
    {
      programs.git.settings = {
        user.name = lib.mkForce "Stian Sørby";
        user.email = lib.mkForce "stian.sorby@norges-bank.no";
        credential = {
          helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
          useHttpPath = true;
        };
      };
    };
}

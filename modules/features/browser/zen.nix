{ inputs, ... }:
{
  flake-file.inputs = {
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  flake.homeModules.browser = {
    imports = [
      inputs.zen-browser.homeModules.default
    ];

    programs.zen-browser = {
      enable = true;

      setAsDefaultBrowser = true;

      profiles.default = {
        search = {
          force = true;
          default = "ddg";
          engines = {
            nixos = {
              name = "NixOS Packages";
              urls = [
                {
                  template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
                }
              ];
              definedAliases = [
                "@pkgs"
                "@nixpkgs"
              ];
            };
            mynixos = {
              name = "MyNixOS";
              urls = [
                {
                  template = "https://mynixos.com/search?q={searchTerms}";
                }
              ];
              definedAliases = [
                "@nix"
                "@mynixos"
              ];
            };
            github = {
              name = "GitHub Search";
              urls = [
                {
                  template = "https://github.com/search?q={searchTerms}";
                }
              ];
              definedAliases = [
                "@gh"
                "@github"
              ];
            };
            youtube = {
              name = "YouTube";
              urls = [
                {
                  template = "https://www.youtube.com/results?search_query={searchTerms}";
                }
              ];
              definedAliases = [
                "@yt"
                "@youtube"
              ];
            };
            reddit = {
              name = "Reddit";
              urls = [
                {
                  template = "https://www.reddit.com/search/?q={searchTerms}";
                }
              ];
              definedAliases = [ "@reddit" ];
            };
          };
        };
      };

      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };

    stylix.targets.zen-browser.profileNames = [ "default" ];
  };
}

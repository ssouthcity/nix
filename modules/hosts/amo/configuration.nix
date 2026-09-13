{ inputs, self, ... }:
{
  flake.nixosConfigurations.amo = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with self.nixosModules; [
      inputs.nixos-hardware.nixosModules.lenovo-legion-15ach6h

      amoConfiguration
      amoHardware
      amoDisks

      base
      browser
      desktop
      gaming
      nvidia
    ];
  };

  flake.nixosModules.amoConfiguration =
    { pkgs, ... }:
    {
      # Bootloader
      boot.loader = {
        timeout = 0;
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
      };

      # Network
      networking = {
        hostName = "amo";
        networkmanager.enable = true;
      };

      # Enable the X11 windowing system.
      services.xserver.enable = true;

      # Enable the GNOME Desktop Environment.
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us,no";
        variant = "altgr-intl,nodeadkeys";
        options = "grp:caps_toggle,grp_led:scroll";
      };

      # Configure console keymap
      # console.keyMap = "us-acentos";

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound with pipewire.
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.southcity = {
        isNormalUser = true;
        description = "Stian Sørby";
        initialPassword = "ChangeMe!";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

      # Install firefox.
      programs.firefox.enable = true;

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = [
        pkgs.vim
        pkgs.home-manager
      ];

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "26.05"; # Did you read the comment?
    };
}

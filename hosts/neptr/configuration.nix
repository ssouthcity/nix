{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ../common
  ];

  config = {
    # nixpkgs
    nixpkgs.config.allowUnfreePredicate =
      pkg: builtins.elem (lib.getName pkg) [
        # nvidia
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"

        # steam
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ];

    # Bootloader
    boot.loader = {
      timeout = null; # wait indefinitely
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    # Network
    networking = {
      hostName = "neptr";
      networkmanager.enable = true;
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
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
      pkgs.xwayland-satellite
    ];

    # Enable support for Logitech peripherals
    hardware.logitech = {
      wireless.enable = true;
      wireless.enableGraphical = true;
    };

    # Enable nvidia GPU drivers
    hardware.graphics = {
      enable = true;
      extraPackages = [ pkgs.nvidia-vaapi-driver ];
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      open = true;
      nvidiaSettings = true;
    };

    # Hyprland
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    # Niri
    programs.niri = {
      enable = true;
    };

    # Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?
  };
}

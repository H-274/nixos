{ self, inputs, ... }: {
  flake.nixosModules.laptopConfig = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.base

      # Hardware config
      self.nixosModules.laptopHardware

      # Desktop config
      self.nixosModules.desktop
      self.nixosModules.plasma
      self.nixosModules.hyprland

      # Users
      self.nixosModules.coloursUser

      # Other
      # self.nixosModules.kitty
      self.nixosModules.fish
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Networking
    networking.hostName = "laptop";
    networking.networkmanager.enable = true;
    networking.wireless.enable = true;

    # Time zone
    time.timeZone = "America/Toronto";

    # I18N
    i18n.defaultLocale = "en_CA.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_CA.UTF-8";
      LC_IDENTIFICATION = "en_CA.UTF-8";
      LC_MEASUREMENT = "en_CA.UTF-8";
      LC_MONETARY = "en_CA.UTF-8";
      LC_NAME = "en_CA.UTF-8";
      LC_NUMERIC = "en_CA.UTF-8";
      LC_PAPER = "en_CA.UTF-8";
      LC_TELEPHONE = "en_CA.UTF-8";
      LC_TIME = "en_CA.UTF-8";
    };

    services.libinput.enable = true;

    # Console keymap
    console.keyMap = "cf";

    # Enable CUPS printing
    services.printing.enable = true;

    # Enable sound with pipewire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # System packages
    environment.systemPackages = with pkgs; [
      git
      github-cli
    ];

    system.stateVersion = "26.05";

  };

}

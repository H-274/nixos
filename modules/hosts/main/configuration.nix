{ self, inputs, ... }: {
  flake.nixosModules.mainConfig = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.base

      # Hardware config
      self.nixosModules.mainHardware

      # Users
      self.nixosModules.coloursUser

      # Desktop
      self.nixosModules.catppuccin
      self.nixosModules.hyprland
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
    # Bootloader
    boot.loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };

    # Networking
    networking.networkmanager.enable = true;

    # Time zone
    time.timeZone = "America/Toronto";

    # I18N
    i18n.defaultLocale = "en_GB.UTF-8";

    # Window system
    services.xserver.enable = true;
    services.xserver.xkb = {
      layout = "ca";
      variant = "";
    };

    # Enable display manager
    services.displayManager.sddm.enable = true;

    # Console keymap
    console.keyMap = "cf";

    # CUPS document printing
    services.printing.enable = true;

    # Enabling sound
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
      vim
      wget
      git
    ];

    system.stateVersion = "26.05";

  };

}
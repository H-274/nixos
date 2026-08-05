{ self, inputs, ... }: {
  flake.nixosModules.laptopConfig = { pkgs, lib, ... }: {
    imports = [
      # Hardware config
      self.nixosModules.laptopHardware

      # Users
      self.nixosModules.coloursUser

      # Theming
      self.nixosModules.catppuccin
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

    # X11 window system
    services.xserver.enable = true;
    services.xserver.xkb = {
      layout = "ca";
      variant = "";
    };

    # Console keymap
    console.keyMap = "cf";

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
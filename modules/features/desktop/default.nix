{
  flake.nixosModules.desktop = { lib, config, ... }:  {
    include = [
      ./plasma.nix
      ./hyprland.nix
    ];

    boot.loader.systemd-boot.enable = true;
    config.services.displayManager.sddm.enable = true;

    # X11 window system
    config.services.xserver.enable = true;
    config.services.xserver.xkb = {
      layout = "ca";
      variant = "";
    };
  };
}
{
  flake.nixosModules.desktop = {
    imports = [
      ./plasma.nix
      ./hyprland.nix
    ];

    boot.loader.systemd-boot.enable = true;
    services.displayManager.sddm.enable = true;

    # X11 window system
    services.xserver.enable = true;
    services.xserver.xkb = {
      layout = "ca";
      variant = "";
    };
  };
}
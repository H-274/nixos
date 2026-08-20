{
  flake.nixosModules.desktop = {
    boot.loader.systemd-boot.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # X11 window system
    services.xserver.enable = true;
    services.xserver.xkb = {
      layout = "ca";
      variant = "";
    };
  };
}
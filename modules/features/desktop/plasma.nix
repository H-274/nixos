{ self, ... }: {
  flake.nixosModules.plasma = {
    imports = [
      self.nixosModules.desktop
    ];

    services.desktopManager.plasma6.enable = true;
  };
}
{ self, ... }: {
  flake.nixosModules.hyprland = {
    imports = [
      self.nixosModules.home-manager
    ];
    
  };
}
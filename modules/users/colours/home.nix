{ self, ... }: {
  flake.nixosModules.coloursHome = {
    imports = [
      self.nixosModules.home-manager
    ];
    
  };
}
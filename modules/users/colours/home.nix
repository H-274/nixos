{ self, ... }: {
  flake.nixosModules.coloursHome = {
    imports = [
      self.nixosModules.home-manager
      self.nixosModules.coloursUser
    ];
    
    home-manager.users.colours = {
      imports = [
        self.nixosModules.hyprland
      ];
    };
  };
}
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

      home = {
        stateVersion = "26.05";
        
        programs.home-manager.enable = true;
      };
    };
  };
}
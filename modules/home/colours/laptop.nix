{ self, inputs, ... }: {
  flake.nixosModules.coloursLaptop = { pkgs, ... }: {
    imports = [
      self.nixosModules.coloursUser
    ];

    home-manager.users.colours = {
      imports = [
        self.homeManagerModules.hyprland
      ];
      
      programs.home-manager.enable =  true;

      home.stateVersion = "26.05";
    };
  };
}

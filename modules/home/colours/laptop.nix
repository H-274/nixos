{ self, inputs, ... }: {
  flake.nixosModules.coloursLaptop = { pkgs, ... }: {
    imports = [
      self.nixosModules.coloursUser
    ];

    home-manager.users.colours = {
      imports = [

      ];
      
      home.stateVersion = "26.05";
    };
  };
}
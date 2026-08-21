{ self, inputs, ... }: {
  flake.nixosModules.coloursLaptop = { pkgs, ... }: {
    imports = [
      self.nixosModules.coloursUser
    ];

    home-manager.users.colours = {
      
      programs.home-manager.enable =  true;

      home.stateVersion = "26.05";
    };
  };
}
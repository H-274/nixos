{ self, inputs, ... }: {
  flake.nixosModules.coloursMain = { pkgs, ... }: {
    imports = [
      self.nixosModules.coloursUser
    ];

    home-manager.users.colours = {

      programs.home-manager.enable =  true;
      
      home.stateVersion = "26.05";
    };
  };
}
{ self, inputs, ... }: {
  flake.nixosModules.coloursLaptop = { pkgs, ... }: {
    imports = [
      self.nixosModules.coloursUser
    ];

    home-manager.users.colours = {
      home.stateVersion = "26.05";
    }
  };
}
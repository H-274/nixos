{ self, inputs, ... }: {
  flake.nixosModules.coloursLaptop = { pkgs, ... }: {
    imports = [
      self.nixosModules.coloursUser
    ];

    home-manager.users.colours = {
      imports = [
        self.homeManagerModules.home-wayland
      ];
      
      programs.home-manager.enable =  true;

      home.stateVersion = "26.05";
    };
  };
}

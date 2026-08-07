{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { self, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    self.home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
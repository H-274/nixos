{ inputs, ... }: {
  flake.nixosModules.home-manager = {
    imports = [
      home-manager.nixosModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
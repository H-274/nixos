{ inputs, ... }: {
  flake.nixosModules.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };

      programs.home-manager.enable = true;
    };
  };
}
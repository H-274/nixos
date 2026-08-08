{
  flake.nixosModules.home-manager = { inputs, ... }: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPkgs = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
  };
}
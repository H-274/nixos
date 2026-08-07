{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, ... }: {
    import = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
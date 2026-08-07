{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, self', ... }: {
    import = [
      inputs.home-manager.nixosModules.home-manager
    ];

    self'.home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
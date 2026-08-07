{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, self', ... }: {
    import = [
      home-manager.nixosModules.home-manager
    ];

    self'.home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
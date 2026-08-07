{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, self', ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    pkgs.home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
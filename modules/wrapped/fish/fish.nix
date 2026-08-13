{ self, inputs, ... }: {
  flake.nixosModules.fish = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.fish
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.fish = inputs.wrapper-modules.wrappers.fish.wrap {
      inherit pkgs;

      configFile.path = ./config.fish;
    };
  };
}
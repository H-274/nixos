{ self, inputs, ... }: {
  flake.nixosModules.oh-my-posh = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.oh-my-posh
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.oh-my-posh = inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
      inherit pkgs;

      configFile = ./zen.toml;
    };
  };
}
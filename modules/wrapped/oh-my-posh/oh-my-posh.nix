{ self, inputs, ... }: {
  flake.nixosModules.oh-my-posh = { pkgs, lib, ... }: {
    programs.oh-my-posh = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.oh-my-posh;
    };
  };

  perSystem = { pkgs, ... }: {
    packages.oh-my-posh = inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
      inherit pkgs;

      configFile = ./zen.toml;
    };
  };
}
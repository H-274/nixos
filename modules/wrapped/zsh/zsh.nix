{ self, inputs, ... }: {
  flake.nixosModules.zsh = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.zsh
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.zsh = inputs.wrapper-modules.wrappers.zsh.wrap {
      inherit pkgs;

      zshrc = {
        "config" = ./config.zshrc;
      };
    };
  };
}
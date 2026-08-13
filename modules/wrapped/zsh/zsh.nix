{ self, inputs, ... }: {
  flake.nixosModules.zsh = { pkgs, lib, ... }: {
    programs.zsh = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.zsh;
    };
  };

  perSystem = { pkgs, ... }: {
    packages.kitty = inputs.wrapper-modules.wrappers.zsh.wrap {
      inherit pkgs;

      zshrc = {
        "config" = ./config.zshrc;
      };
    };
  };
}
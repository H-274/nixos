{ self, inputs, ... }: {
  flake.nixosModules.fish = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.fish
      self.packages.${pkgs.stdenv.hostPlatform.system}.oh-my-posh
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.fish = inputs.wrapper-modules.wrappers.fish.wrap {
      inherit pkgs;

      # TODO find out why broken configFile.path = config.fish;
      configFile.content = ''oh-my-posh init fish | source'';
    };
  };
}
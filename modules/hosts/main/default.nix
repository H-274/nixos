{ self, inputs, ... }: {
  flake.nixosConfigurations.main = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mainConfig
      self.nixosModules.catppuccin
    ];
  };
}
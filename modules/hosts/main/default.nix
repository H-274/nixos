{ self, inputs, catppuccin, ... }: {
  flake.nixosConfigurations.main = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mainConfig
      catppuccin.nixosModules.catppuccin
    ];
  };
}
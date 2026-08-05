{
  flake.nixosModules.catppuccin = { inputs, ... }: {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];

    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
  };
}
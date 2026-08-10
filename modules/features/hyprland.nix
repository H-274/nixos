{ inputs, ... }: {
  flake.nixosModules.hyprland = {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    programs.hyprland = { 
      enable = true;
    };
  };
}
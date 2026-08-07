{ inputs, ... }: {
  flake.nixosModules.hyprland = {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    programs.kitty.enable = true;

    programs.hyprland = { 
      enable = true;
    };
  };
}
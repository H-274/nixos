{ self, inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    environment.systemPackages = [
      pkgs.kitty # required for the default Hyprland config
    ];

    programs.hyprland = {
      enable = true;
    };
  };
}
{ self, inputs, ... }: {
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  flake.nixosModules.hyprland = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.kitty # required for the default Hyprland config
    ];

    programs.hyprland = {
      enable = true;
    };
  };
}
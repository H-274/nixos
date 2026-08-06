{ self, inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    environment.systemPackages = [
      pkgs.kitty # required for the default Hyprland config
      pkgs.kdePackages.dolphin
      pkgs.hyprlauncher
    ];

    programs.hyprland = {
      enable = true;
    };
  };
}
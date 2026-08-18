{ self, ... }: {
  flake.nixosModules.hyprland = {
    imports = [
      self.nixosModules.home-manager
    ];
    
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";

      extraConfig = readFile ./hyprland.lua;
    };
  };
}
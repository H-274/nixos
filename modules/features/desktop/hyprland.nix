{ self, ... }: {
  flake.nixosModules.hyprland = {
    imports = [
      self.nixosModules.home-manager
    ];
    
    home-manager.wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";

      extraConfig = builtins.readFile ./hyprland.lua;
    };
  };
}
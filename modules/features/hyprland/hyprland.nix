{ self, ... }: {
  flake.nixosModules.hyprland = {  
    home.wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";

      extraConfig = builtins.readFile ./hyprland.lua;
    };
  };
}
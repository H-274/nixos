{ inputs, ... }: {
  flake.nixosModules.hyprland = { lib, pkgs, ... }: {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    environment.systemPackages = with pkgs; [
      (hyprland.override { # or inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
        enableXWayland = true;  # whether to enable XWayland
        withSystemd = true;     # whether to build with systemd support
      })
      qt5.qtwayland
      qt6.qtwayland
      qt6Packages.qt6ct
      wayland-utils
      wayland-protocols
      glib
    
      kitty
    ];

    programs.hyprland = { 
      enable = true;

      plugins = [ ];

      # settings = { };

      extraConfig = builtins.readFile ./hyprland.lua;
    };
  };
}
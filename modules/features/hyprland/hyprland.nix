{ inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    pkgs.hyprland.override = { # or inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
      enableXWayland = true;  # whether to enable XWayland
      withSystemd = false;     # whether to build with systemd support
    };

    environment.systemPackages = with pkgs; [
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

      settings = { };
    };
  };
}
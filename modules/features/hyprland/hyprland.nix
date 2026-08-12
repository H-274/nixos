{ inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    environment.systemPackages = with pkgs; [
      qt5.qtwayland
      qt6.qtwayland
      qt6ct
      wayland-utils
      wayland-protocols
      glib
    
      kitty
    ];

    programs.hyprland = { 
      enable = true;
      withUWSM = true;

      plugins = [ ];

      settings = { };
    };
  };
}
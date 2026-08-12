{ inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    imports = [
      inputs.hyprland.nixosModules.default
    ];

    environment.systemPackages = with pkgs; [
      qt5.hprland
      qt6.hprland
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
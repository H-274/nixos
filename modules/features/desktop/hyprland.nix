{ self, ... }: {
  flake.nixosModules.hyprland = {
    imports = [
      self.nixosModules.kitty
    ];

    environment.systemPackages = [
      pkgs.waybar
      (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))

      pkgs.dunst
      libnotify

      swww
      kitty

      rofi-wayland
    ];

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };
}
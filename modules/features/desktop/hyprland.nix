{ self, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    modules = [
      self.nixosModules.kitty
    ];

    environment.systemPackages = with pkgs; [
      waybar
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))

      dunst
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
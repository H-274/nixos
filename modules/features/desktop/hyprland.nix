{ lib, config, ... }: {
  options.desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland desktop";

  # TODO = lib.mkIf config.desktop.hyprland.enable true;
}
# Taken from https://github.com/fufexan/dotfiles/blob/main/home/programs/wayland/default.nix
{
  flake.nixosModules.home-wayland = {
    pkgs,
    self,
    lib,
    ...
  }:
  # Wayland config
  {
    imports = [

    ];

    home.packages = with pkgs; [
      # screenshot
      grim
      slurp

      # utils
      wl-clipboard
      # wl-screenrec
    ];

    # make stuff work on wayland
    home.sessionVariables = {
      QT_QPA_PLATFORM = "wayland;x11";
      SDL_VIDEODRIVER = "wayland;x11";
      XDG_SESSION_TYPE = "wayland";
    };

    systemd.user.targets.tray.Unit.Requires = lib.mkForce [ "graphical-session.target" ];
  };
}
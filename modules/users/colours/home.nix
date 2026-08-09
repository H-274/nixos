{
  flake.nixosModules.coloursHome = { self, lib, pkgs, ... }: {

    home-manager.users.colours = {
      home.packages = [
        pkgs.cowsay
      ];
      wayland.windowManager.hyprlan = {
        enable = true; # enable Hyprland
        settings = {
          exec-once = "${lib.getExe self.${pkgs.stdenv.hostPlatform.system}.packages.noctalia}";
        };
      };

      programs = {
        home-manager.enable = true;
        git.enable = true;
        gh.enable = true;
        firefox.enable = true;
        kitty.enable = true; # required for the default Hyprland config
      };

      home.stateVersion = "25.05";
    };
  };
}
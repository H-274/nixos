{ self, ... }: {
  flake.nixosModules.coloursHome = { lib, pkgs, ... }: {

    home-manager.users.colours = {
      home.packages = [
        pkgs.cowsay
      ];
      wayland.windowManager.hyprland = {
        enable = true; # enable Hyprland

        settings = {
          on = {
            _args = [
              "hyprland.start"
              (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia}\")\nend")
            ];
          };
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
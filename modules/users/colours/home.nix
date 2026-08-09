{
  flake.nixosModules.coloursHome = { self, pkgs, ... }: {

    home-manager.users.colours = {
      home.packages = [
        pkgs.cowsay
      ];
      wayland.windowManager.hyprlan = {
        enable = true; # enable Hyprland
        
        on = {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline "function()\n hl.exec_cmd(\"${lib.getExe self.${pkgs.stdenv.hostPlatform.system}.packages.noctalia}\")\nend")
          ]
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
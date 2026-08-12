{ self, ... }: {
  flake.nixosModules.coloursHome = { lib, pkgs, ... }: {

    home-manager.users.colours = {
      home.packages = [
        pkgs.cowsay
      ];
      wayland.windowManager.hyprland = {
        enable = true; # enable Hyprland
        package = null;

        settings = {
          on = [
            {
              _args = [
                "hyprland.start"
                (lib.generators.mkLuaInline "function()\n hl.exec_cmd(\"${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia}\")\nend")
              ];
            }
          ];
        };
      };

      programs = {
        home-manager.enable = true;
        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;

          shellAliases = {
            ll = "ls -l";
            edit = "sudo -e";
            update = "sudo nixos-rebuild switch";
          };

          history.size = 10000;
          history.ignoreAllDups = true;
          history.path = "$HOME/.zsh_history";
          history.ignorePatterns = ["rm *" "pkill *" "cp *"];
        };
        git.enable = true;
        gh.enable = true;
        firefox.enable = true;
        kitty.enable = true; # required for the default Hyprland config
      };

      home.stateVersion = "26.05";
    };
  };
}
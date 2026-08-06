{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
  };

  perSystem = { pkgs, lib, self' ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {

      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];
        input.keyboard = {
          xkb.layout = "ca";
        };
        
        layout.gaps = 5;

        binds = {
          "Alt+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Alt+Q".close-window = { };
          "Alt+S".spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";
        };
      };
    };
  };
}
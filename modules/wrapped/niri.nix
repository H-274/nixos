{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {

      inherit pkgs;
      settings = {
        input.keyboard = {
          xkb.layout = "ca"
        };
        
        layout.gaps = 5;

        binds = {
          "Alt+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Alt+Q".close-window = "";
        }
      };
    };
  };
}
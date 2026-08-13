{ self, inputs, ... }: {
  flake.nixosModules.kitty = { pkgs, lib, ... }: {
    #programs.kitty = {
      # enable = true;
      self.packages.${pkgs.stdenv.hostPlatform.system}.kitty;
    #};
  };

  perSystem = { pkgs, ... }: {
    packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;

      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        update_check_interval = 0;
      };

      themeFile = "Catppuccin-Mocha";
    };
  };
}
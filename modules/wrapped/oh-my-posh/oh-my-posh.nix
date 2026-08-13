{ self, inputs, ... }: {
  flake.nixosModules.oh-my-posh = { pkgs, lib, ... }: {
    programs.oh-my-posh = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.oh-my-posh;
    };
  };

  perSystem = { pkgs, ... }: {
    packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;

      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        update_check_interval = 0;
      };

      configFile = ./zen.toml;
      themeFile = "Catppuccin-Mocha";
    };
  };
}
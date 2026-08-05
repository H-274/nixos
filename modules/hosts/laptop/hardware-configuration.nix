{ self, inputs, ... }: {
  flake.nixosModules.laptopHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    # Copy from setup
    
  };
}
{ self, inputs, ... }: {
  flake.nixosModules.mainHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];`

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/53bd6388-324a-4418-b30f-e5e868b20ab1";
      fsType = "ext4";
    };

    swapDevices = [
      {
        device = "d7a0b13e-e635-42f7-b375-d69cd8f9034f";
      }
    ]
  };

}
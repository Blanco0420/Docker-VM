{ config, lib, pkgs, modulesPath, ... }:
let
  mountops =
    "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
in {
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  boot.initrd.availableKernelModules =
    [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  fileSystems."/mnt/external" = {
    device = "//u421299-sub4.your-storagebox.de/u421299-sub4";
    fsType = "cifs";
    options =
      [ "${mountops},credentials=${config.age.secrets.external-smb.path}" ];
  };
  fileSystems."/mnt/local" = {
    device = "//10.1.2.120/storage";
    fsType = "cifs";
    options =
      [ "${mountops},credentials=${config.age.secrets.local-smb.path}" ];
  };
  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

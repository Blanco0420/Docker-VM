{ config, lib, pkgs, modulesPath, ... }:

{
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
  fileSystems."/mnt/local" = {
    device = "//10.1.2.120/storage";
    fsType = "cifs";
    options = let
      secretPath = config.age.secrets.local-smb.path;
      automount_opts =
        "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "${automount_opts},credentials=${config.age.secrets.local-smb.path},uid=${config.users.users.docker.uid}"
    ];
  };
  fileSystems."/mnt/external" = {
    device = "//u421299-sub4.your-storagebox.de/u421299-sub4";
    fsType = "cifs";
    options = let
      secretPath = config.age.secrets.external-smb.path;
      automount_opts =
        "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "${automount_opts},credentials=${config.age.secrets.external-smb.path},uid=${config.users.users.docker.uid}"
    ];
  };
  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

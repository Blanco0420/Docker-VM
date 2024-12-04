{ config, lib, pkgs, modulesPath, ... }: {
  fileSystems."/mnt/external" = {
    device = "u421299-sub4.your-storagebox.de/u421299-sub4";
    fsType = "fuse.sshfs";
    options = [
      "identityfile=${config.age.secrets.docker-ssh-key.path}"
      "idmap=user"
      "x-systemd.automount"
      "allow_other"
      "user"
      "_netdev"
    ];
  };
}

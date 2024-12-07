{ config, ... }: {
  fileSystems."/mnt/external-docker" = {
    device = "u421299-sub4@u421299.your-storagebox.de:docker-mount";
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
  boot.supportedFilesystems."fuse.sshfs" = true;
}

{ config, ... }: {
  fileSystems."/mnt/external-docker" = {
    device = "//u421299-sub4.your-storagebox.de/u421299-sub4";
    fsType = "cifs";
    options = [ "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users,credentials=${config.age.secrets.external-smb.path},uid=${toString config.users.users.docker.uid},gid=${toString config.users.groups.docker.gid}" ];
  };
}
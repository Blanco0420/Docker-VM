let 
  cifsmountops = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";
in 
{ config, ... }: {

  fileSystems = {
    external = {
      device = "//u421299-sub4.your-storagebox.de/u421299-sub4";
      mountPoint = "/mnt/external";
      fsType = "cifs";
      options = [ "forceuid,forcegid,${cifsmountops},uid=${toString config.users.users.docker.uid},gid=${toString config.users.groups.docker.gid},credentials=${config.age.secrets.external-smb.path}" ];
    };
    gluster = {
      device = "localhost:/data/glustervol";
      mountPoint = "/mnt/gluster";
      fsType = "glusterfs";
    };
  };
}

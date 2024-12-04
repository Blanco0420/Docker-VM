{ config, ... }: {

  services = {
    qemuGuest.enable = true;
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
    glusterfs = {
      enable = true;
      tlsSettings = {
        tlsPem = "${config.age.secrets.glusterpem.path}";
        tlsKeyPath = "${config.age.secrets.glusterkey.path}";
        caCert = "${config.age.secrets.glusterca.path}";
      };
    };
  };

  virtualisation.docker = {
    enable = true;
    daemon.settings.live-restore = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

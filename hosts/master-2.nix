{ lib, ... }: {
  imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.3";
    hostname = "docker-master-2";
  };

      age.secrets = {
    local-smb.file = ../secrets/local-smb.age;
    external-smb.file = ../secrets/external-smb.age;
    docker-ssh-key.file = ../secrets/docker-ssh-key.age;
    glusterca.file = ../secrets/glusterca.age;
    glusterpem.file = ../secrets/glusterpem-docker-master-2.age;
    glusterkey.file = ../secrets/glusterkey-docker-master-2.age;
      };
}

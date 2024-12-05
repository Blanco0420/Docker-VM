{ lib, ... }: {
imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.104";
    hostname = "docker-worker-4";
  };

    age.secrets = {
    local-smb.file = ../secrets/local-smb.age;
    external-smb.file = ../secrets/external-smb.age;
    docker-ssh-key.file = ../secrets/docker-ssh-key.age;
    glusterca.file = ../secrets/glusterca.age;
    glusterpem.file = ../secrets/glusterpem-docker-worker-4.age;
    glusterkey.file = ../secrets/glusterkey-docker-worker-4.age;
      };
}

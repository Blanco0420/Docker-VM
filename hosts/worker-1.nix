{ lib, ... }: {
imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.101";
    hostname = "docker-worker-1";
  };

    age.secrets = {
    glusterpem.file = ../secrets/glusterpem-docker-worker-1.age;
    glusterkey.file = ../secrets/glusterkey-docker-worker-1.age;
      };
}

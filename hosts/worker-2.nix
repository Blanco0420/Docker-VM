{ lib, ... }: {
imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.102";
    hostname = "docker-worker-2";
  };

    age.secrets = {
    glusterpem.file = ../secrets/glusterpem-docker-worker-2.age;
    glusterkey.file = ../secrets/glusterkey-docker-worker-2.age;
      };
}

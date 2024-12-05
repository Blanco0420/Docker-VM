{ lib, ... }: {
imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.104";
    hostname = "docker-worker-4";
  };

    age.secrets = {
    glusterpem.file = ../secrets/glusterpem-docker-worker-4.age;
    glusterkey.file = ../secrets/glusterkey-docker-worker-4.age;
      };
}

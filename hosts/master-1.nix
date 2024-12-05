{ lib, ... }: {
  imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.11";
    hostname = "docker-master-1";
  };
  age.secrets = {
    glusterpem.file = ../secrets/glusterpem-docker-master-1.age;
    glusterkey.file = ../secrets/glusterkey-docker-master-1.age;
      };
}

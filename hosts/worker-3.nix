{ ... }: {
imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.103";
    hostname = "docker-worker-3";
  };

    age.secrets = {
    glusterpem.file = ../secrets/glusterpem-docker-worker-3.age;
    glusterkey.file = ../secrets/glusterkey-docker-worker-3.age;
      };
}

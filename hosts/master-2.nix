{ ... }: {
  imports = [ ../nixos/configuration.nix ../config/networking.nix];
  networkConf = {
    ipAddress = "10.1.2.12";
    hostname = "docker-master-2";
  };

      age.secrets = {
    glusterpem.file = ../secrets/glusterpem-docker-master-2.age;
    glusterkey.file = ../secrets/glusterkey-docker-master-2.age;
      };
}

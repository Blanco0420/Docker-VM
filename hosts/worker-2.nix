{ lib, ... }: {
  imports = [ ../nixos/configuration.nix ];

  networking = {
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "10.1.2.102";
        prefixLength = 24;
      }];
    };
  };
    age.secrets = {
    local-smb.file = ../secrets/local-smb.age;
    external-smb.file = ../secrets/external-smb.age;
    docker-ssh-key.file = ../secrets/docker-ssh-key.age;
    glusterca.file = ../secrets/glusterca.age;
    glusterpem.file = ../secrets/glusterpem-docker-worker-2.age;
    glusterkey.file = ../secrets/glusterkey-docker-worker-2.age;
      };
  networking.hostName = lib.mkForce "docker-worker-2";
}

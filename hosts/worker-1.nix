{ lib, ... }: {
  imports = [ ../nixos/configuration.nix ];

  networking = {
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "10.1.2.101";
        prefixLength = 24;
      }];
    };
  };
  networking.hostName = lib.mkForce "docker-worker-1";
}

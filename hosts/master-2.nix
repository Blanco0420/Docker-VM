{ lib, ... }: {
  imports = [ ../nixos/configuration.nix ];

  networking = {
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "10.1.2.12";
        prefixLength = 24;
      }];
    };
  };

  networking.hostName = lib.mkForce "docker-master-2";
}
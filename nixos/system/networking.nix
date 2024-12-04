{ inputs, lib, config, pkgs, ... }: {
  networking = {
    networkmanager.enable = true;
    defaultGateway = "10.1.2.1";
    nameservers = [ "10.1.2.1" "1.1.1.1" "1.0.0.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts =
        [ 22 2376 2377 7946 4789 ]; # Allow SSH and Docker Swarm ports
      allowedUDPPorts = [ 7946 4789 ]; # Allow Docker Swarm UDP ports
    };
  };
}

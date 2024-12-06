{ ... }: {
  networking = {
    networkmanager.enable = true;
    defaultGateway = "10.1.2.1";
    nameservers = [ "10.1.2.1" "1.1.1.1" "1.0.0.1" ];
    firewall.enable = false;
    extraHosts =
    ''
      10.1.2.11 docker-master-1
      10.1.2.12 docker-master-2
      10.1.2.101 docker-worker-1
      10.1.2.102 docker-worker-2
      10.1.2.103 docker-worker-3
      10.1.2.104 docker-worker-4
    '';
  };
}

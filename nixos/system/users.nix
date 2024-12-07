{ ... }: {
  users = {
    users = {
      docker = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICvuFtf+mfqywoE4+BNNJ6yhI20i99guVc0fkfslShO7 blanco@blancorog"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIEII8saSYun/OtVtCJrPJFjoTaN8XFTMNy9R1giZPcvlAAAAGHNzaDpNeWxlc0JvbHRvbl9NYWluX1NTSA=="
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIAlij2lxj8OoCoDNurBmYuRucZ7eGZ65vy0/goCY9mmDAAAAGnNzaDpNeWxlc0JvbHRvbl9CYWNrdXBfU1NI"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIN8dNdBOC+PSZRM2JlGgCrm+aBF/cZtuWsJ4jOmqPgkyAAAAHHNzaDpQaGlvblNlY3VyaXR5X0JhY2t1cF9TU0g="
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIL4juA+knvCJmmL8BKmtCHxdwQewdNUXY25UK5jyH1l3AAAAGnNzaDpQaGlvblNlY3VyaXR5X01haW5fU1NI"
        ];
        extraGroups = [ "wheel" "docker" ];
        uid = 1000;
      };
    };
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}

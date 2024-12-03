let
  workstation =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0idNvgGiucWgup/mP78zyC23uFjYq0evcWdjGQUaBH";
  blanco =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOC0ZVHQd0YmATfslSTtmXB7jcOGKmYdOBrwaY5TY1Nm blanco@blancorog";
  users = [ workstation blanco ];
  docker-master1 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOYk1kuyRky/c8zK/NvsXJ7JSfqm89yxa0G+O0UG163j";
  docker-worker1 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICVbERun5w854/R/XuLSb0l3mr0hM1VI+6MyqOQ4ADRx";
  docker-worker2 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO+6BwyvkJ+Ao9qFBlswYvMd2HwpQMj6q1PVjJ5hUril";
  docker-worker3 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICZYEGNYCm78oN1bBlWiPoUzbos5N7paU6M+r+x+3FfY";
  servers = [ docker-master1 docker-worker1 docker-worker2 docker-worker3 ];
in {
  "local-smb.age".publicKeys = users ++ servers;
  "external-smb.age".publicKeys = users ++ servers;
}

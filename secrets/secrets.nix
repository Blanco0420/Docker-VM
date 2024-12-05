let
  workstation =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOxQd8uI865VoHU6xa7hU1EOsmNSxlhRYG5Hh26+3i0a user@desktop";
  blanco =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOC0ZVHQd0YmATfslSTtmXB7jcOGKmYdOBrwaY5TY1Nm blanco@blancorog";
  users = [ workstation blanco ];
  docker-master-1 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOYk1kuyRky/c8zK/NvsXJ7JSfqm89yxa0G+O0UG163j";
  docker-master-2 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOYk1kuyRky/c8zK/NvsXJ7JSfqm89yxa0G+O0UG163j";
  docker-worker-1 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICVbERun5w854/R/XuLSb0l3mr0hM1VI+6MyqOQ4ADRx";
  docker-worker-2 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO+6BwyvkJ+Ao9qFBlswYvMd2HwpQMj6q1PVjJ5hUril";
  docker-worker-3 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICZYEGNYCm78oN1bBlWiPoUzbos5N7paU6M+r+x+3FfY";
  docker-worker-4 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICZYEGNYCm78oN1bBlWiPoUzbos5N7paU6M+r+x+3FfY";
  servers = [ docker-master-1 docker-master-2 docker-worker-1 docker-worker-2 docker-worker-3 docker-worker-4 ];
in {
  "local-smb.age".publicKeys = users ++ servers;
  "external-smb.age".publicKeys = users ++ servers;
  "docker-ssh-key.age".publicKeys = users ++ servers;
  "comin-auth-token.age".publicKeys = users ++ servers;
  "glusterca.age".publicKeys = users ++ servers;
  "glusterkey-docker-master-1.age".publicKeys = users ++ [docker-master-1];
  "glusterpem-docker-master-1.age".publicKeys = users ++ [docker-master-1];
  "glusterkey-docker-master-2.age".publicKeys = users ++ [docker-master-2];
  "glusterpem-docker-master-2.age".publicKeys = users ++ [docker-master-2];
  "glusterkey-docker-worker-1.age".publicKeys = users ++ [docker-worker-1];
  "glusterpem-docker-worker-1.age".publicKeys = users ++ [docker-worker-1];
  "glusterkey-docker-worker-2.age".publicKeys = users ++ [docker-worker-2];
  "glusterpem-docker-worker-2.age".publicKeys = users ++ [docker-worker-2];
  "glusterkey-docker-worker-3.age".publicKeys = users ++ [docker-worker-3];
  "glusterpem-docker-worker-3.age".publicKeys = users ++ [docker-worker-4];
  "glusterkey-docker-worker-4.age".publicKeys = users ++ [docker-worker-4];
  "glusterpem-docker-worker-4.age".publicKeys = users ++ [docker-worker-4];
}

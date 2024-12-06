let
  workstation =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOxQd8uI865VoHU6xa7hU1EOsmNSxlhRYG5Hh26+3i0a user@desktop";
  blanco =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOC0ZVHQd0YmATfslSTtmXB7jcOGKmYdOBrwaY5TY1Nm blanco@blancorog";
  shared = 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICvuFtf+mfqywoE4+BNNJ6yhI20i99guVc0fkfslShO7 blanco@blancorog";
  users = [ workstation blanco shared ];
  docker-master-1 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJqgh0O6WhT8sW/8TIAQ+dGCjjBD4/nGDPiBGIhBCW2G";
  docker-master-2 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDkXWl601W/y+weEkBRUFz6mK7mz0mLJ/gncqh2qtk70";
  docker-worker-1 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMIOqm0uHvm14QnptY7GXrcfREICKS9vc3QaZSPeuyK";
  docker-worker-2 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMAA1FtsuQF0E5wBXFtmSR1KQdVX0nAyRoIB8xHaB6dT";
  docker-worker-3 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKjCrk2o0KRZ/gdDE4uOEPs93tb+RVYMWWH/YqWoF1jp";
  docker-worker-4 =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOUMaViAS3MSH30GbL3quq657MsQicJEgl8IYKFD36PI";
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
  "glusterpem-docker-worker-3.age".publicKeys = users ++ [docker-worker-3];
  "glusterkey-docker-worker-4.age".publicKeys = users ++ [docker-worker-4];
  "glusterpem-docker-worker-4.age".publicKeys = users ++ [docker-worker-4];
}

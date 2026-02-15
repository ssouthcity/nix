{ inputs, ... }:
{
  flake.nixosModules.neptrDisks = {
    imports = [inputs.disko.nixosModules.disko];

    disko.devices = {
      disk = {
        main = {
          device = "/dev/nvme1n1";
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                type = "EF00";
                size = "1GB";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
    };
  };
}

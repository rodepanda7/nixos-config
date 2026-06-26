# mounts.nix - Filesystem mount configuration
{ ... }:

let
  # Common NFS mount options for rabnas
  nfsOptions = [
    "x-systemd.automount" # Auto-mount on access
    "noauto" # Don't mount at boot
    "x-systemd.idle-timeout=60" # Unmount after 60 seconds of inactivity
    "x-systemd.device-timeout=5s" # Timeout for device availability
    "x-systemd.mount-timeout=5s" # Timeout for mount operation
  ];
in
{
  # fileSystems."/mnt/toshiba" = {
  #   device = "UUID=AC6E922D6E91EFF6";
  #   fsType = "ntfs";
  #   options = nfsOptions; # [ "defaults" "uid=1000" "gid=1000" "umask=022" ];
  # };
}


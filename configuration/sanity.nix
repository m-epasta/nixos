{
  config,
  pkgs,
  inputs,
  ...
}: {
  systemd.services.nixos-upgrade = {
    serviceConfig.Type = "oneshot";
    startAt = "daily";
    script = "${pkgs.nix}/bin/nixos-rebuild switch --upgrade";
  };

  services.borgbackups.jobs = {
    file-backup = {
      paths = ["/home" "/etc"];
      repo = "/mnt/backup";
      encryption.mode = "repokey-blake2";
      compression = "lz4";
      startAt = "daily";
    };
  };

  services.journald.extraConfig = ''
    SystemMaxUse=500M
    SystemMaxFileSize=100M
  '';

  services.logrotate.enable = true;

  programs.bash.interactiveShellInit = "umask 027";
}

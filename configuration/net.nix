{
  config,
  pkgs,
  inputs,
  ...
}
: {
  imports = [(inputs.nixpkgs + "/nixos/modules/profiles/hardened.nix")];

  networking.hostName = "mushBoy";

  networking.networkmanager.enable = true;

  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [80 443];
  #   allowedUDPPorts = [51820];
  #
  #   logRefusedConnections = true;
  #   logRefusedUnicastsOnly = false;
  # };
  #
  # networking.nftables.enable = true;
  # networking.nftables.ruleset = ''
  #   table inet filter {
  #     chain input {
  #       type filter hook input priority 0; policy drop;
  #       # Accept already established connections
  #       ct state established,related accept
  #       # Accept loopback
  #       iif lo accept
  #       # Accept ICMP echo requests with rate limit
  #       ip protocol icmp icmp type echo-request limit rate 6/second accept
  #       ip6 nexthdr icmpv6 icmpv6 type echo-request limit rate 6/second accept
  #       # (Add your allowed TCP/UDP ports here, e.g.:)
  #       tcp dport { 80, 443 } accept
  #       udp dport 51820 accept
  #     }
  #   }
  # '';
  #
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     PasswordAuthentication = false;
  #     PermitRootLogin = "no";
  #     AllowUsers = ["guest"];
  #   };
  # };
  #
  # services.fail2ban.enable = true;
  #
  # security.lockKernelModules = true;
  #
  # boot.kernel.sysctl = {
  #   "kernel.kptr_restrict" = 2;
  #   "kernel.dmesg_restrict" = 1;
  #   "net.core.bpf_jit_harden" = 1;
  # };
  #
  # security.apparmor.enable = true;
  #
  # services.dnscrypt-proxy2 = {
  #   enable = true;
  #   settings = {
  #     require_dnssec = true;
  #     localPort = 43;
  #     cache = true;
  #     sources = {
  #       public-resolvers = {
  #         urls = [
  #           "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
  #         ];
  #         cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
  #         minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
  #       };
  #     };
  #   };
  # };
  #
  # services.dnsmasq = {
  #   enable = true;
  #
  #   servers = ["127.0.0.1"];
  # };
  #
  # networking.networkmanager.dns = "none";
  # networking.nameservers = ["127.0.0.1" "::1"];

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # services.openssh.enable = true;
}

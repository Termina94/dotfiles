{ config, pkgs, ... }:

let
  ProxyConfig = {
    extraConfig = ''
      proxy_pass http://127.0.0.1:8080;
    	proxy_set_header Host $host;
    	proxy_set_header X-Real-IP $remote_addr;
    	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    	proxy_set_header X-Forwarded-Proto $scheme;

  		proxy_http_version 1.1;
  		proxy_set_header Upgrade $http_upgrade;
  		proxy_set_header Connection "upgrade";
    '';
  };

  Proxy = {
    locations."/" = ProxyConfig;
  };

  ProxyLocked = {
    basicAuth = { dean = "test"; };
    locations."/" = ProxyConfig;
  };

in {
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [80 443];

  networking.extraHosts =
  ''
    192.168.0.10 term.co.uk
    192.168.0.10 lizard.term.co.uk
    192.168.0.10 chat.term.co.uk
    192.168.0.10 cv.term.co.uk

    192.168.0.10 pron.term.co.uk
    192.168.0.10 anti-clockwise.term.co.uk
    192.168.0.10 level-10.term.co.uk
    192.168.0.10 level-11.term.co.uk
    192.168.0.10 john.term.co.uk
    192.168.0.10 john.bacon.term.co.uk
    192.168.0.10 f-start-1.term.co.uk
    192.168.0.10 clockwise.term.co.uk
    192.168.0.10 f-2-1.term.co.uk
    192.168.0.10 level-3.term.co.uk
  '';

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;

    virtualHosts."lizard.term.co.uk" = ProxyLocked;
    virtualHosts."term.co.uk" = Proxy;
    virtualHosts."*.term.co.uk" = Proxy;
  };
}

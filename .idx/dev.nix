{pkgs}: {
  channel = "stable-24.05";
  packages = [
    pkgs.nodejs_20
    pkgs.nodePackages.pnpm
    pkgs.openssl
    pkgs.bun
  ];
  services.postgres={
    enable= true;
    enableTcp = true;
    package = pkgs.postgresql_15;
    extensions = [ "pgvector" "postgis" ];
  };
  idx.extensions = [
    
  ];
  idx.previews = {
    previews = {
      web = {
        command = [
          "npm"
          "run"
          "dev"
          "--"
          "--port"
          "$PORT"
          "--hostname"
          "0.0.0.0"
        ];
        manager = "web";
      };
    };
  };
}
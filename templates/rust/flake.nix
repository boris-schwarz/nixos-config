{
  description = "Rust dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          rustc
          cargo
          rustfmt
          clippy
          rust-analyzer
          gcc

          # add project-specifics here, e.g.:
          # pkg-config  # locates C libraries at build time
          # openssl     # for native-tls db connections
          # sqlx-cli    # sqlx cli for migrations
        ];

        RUST_BACKTRACE = 1;
      };
    };
}

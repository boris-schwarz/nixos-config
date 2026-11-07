{
  description = "Spring Boot dev environment";

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
          jdk21
          gradle

          # add project-specifics here, e.g.:
          # spring-boot-cli  # the `spring` command inside the project
          # postgresql       # local db server
          # flyway           # db migrations
        ];

        # make gradle (and the IDE picking up this shell) use JDK 21
        JAVA_HOME = "${pkgs.jdk21}";
      };
    };
}

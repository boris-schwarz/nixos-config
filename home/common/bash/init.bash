nix-rebuild() {
  echo "+ sudo nixos-rebuild switch --flake ~/nixos-config#t15 $*"
  sudo nixos-rebuild switch --flake ~/nixos-config#t15 "$@"
}

nix-test() {
  echo "+ sudo nixos-rebuild test --flake ~/nixos-config#t15 $*"
  sudo nixos-rebuild test --flake ~/nixos-config#t15 "$@"
}

cargo-new() {
  [ -z "$1" ] && { echo "usage: cargo-new <name>"; return 1; }
  local dir="$HOME/dev/$1"
  [ -e "$dir" ] && { echo "error: $dir already exists"; return 1; }
  mkdir -p "$dir" && cd "$dir" || return 1
  nix flake init -t ~/nixos-config#rust
  cargo init
  git add -A
  nix flake lock
  git add flake.lock
  direnv allow
}

spring-new() {
  [ -z "$1" ] && { echo "usage: spring-new <name>"; return 1; }
  local dir="$HOME/dev/$1"
  [ -e "$dir" ] && { echo "error: $dir already exists"; return 1; }
  mkdir -p "$dir" && cd "$dir" || return 1

  # common starters for a typical web/api service
  local deps="web,data-jpa,validation,actuator,lombok,devtools"
  # less common — append to the list above, e.g. deps="$deps,security,postgresql":
  #   security        # Spring Security (authn/authz)
  #   postgresql      # PostgreSQL JDBC driver
  #   mysql           # MySQL JDBC driver
  #   h2              # in-memory db for quick tests
  #   data-redis      # Redis
  #   data-mongodb    # MongoDB
  #   thymeleaf       # server-side HTML templating
  #   webflux         # reactive (non-blocking) web stack
  #   batch           # Spring Batch (bulk jobs)
  #   quartz          # scheduled jobs
  #   mail            # JavaMail sending
  #   cache           # caching abstraction
  #   oauth2-client   # OAuth2 / OIDC login
  #   graphql         # Spring for GraphQL
  #   kafka           # Apache Kafka
  #   amqp            # RabbitMQ
  #   testcontainers  # throwaway docker deps in tests

  # scaffold the Spring project (no global JDK needed for this one-time step)
  nix run nixpkgs#spring-boot-cli -- init \
    --type=gradle-project-kotlin \
    --java-version=21 \
    --dependencies="$deps" \
    --artifact-id="$1" \
    --name="$1" \
    --extract .
  nix flake init -t ~/nixos-config#java-spring  # adds flake.nix + .envrc
  echo ".direnv/" >> .gitignore
  git init -q
  git add -A
  nix flake lock
  git add flake.lock
  direnv allow
}

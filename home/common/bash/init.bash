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

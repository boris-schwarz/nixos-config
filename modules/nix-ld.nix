{ ... }:

{
  # let generic dynamically-linked binaries run (e.g. language servers
  # that editors like zed auto-download). see https://nix.dev/permalink/stub-ld
  programs.nix-ld.enable = true;
}

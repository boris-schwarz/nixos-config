{ ... }:

{
  # 32-bit graphics libraries for Wine / Battle.net / WoW
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # bumps the CPU to the performance governor while a game runs
  programs.gamemode.enable = true;
}

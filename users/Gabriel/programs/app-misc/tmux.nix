{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = false;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    prefix = "C-Space";
    terminal = "xterm-256color";
  };
}

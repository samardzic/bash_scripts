#exit if not under tmux
if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
  echo -e Please run under tmux. 
  echo -e Exiting now...
  exit 
fi

~/script/update.sh

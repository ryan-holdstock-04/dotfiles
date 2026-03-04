#!/usr/bin/env bash
multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

termcmd="${TERMCMD:-/usr/bin/kitty}"

if [ "$directory" = "1" ]; then
  # Yazi doesn't have a directory-only chooser, just let them pick normally
  "$termcmd" --title "FilePicker" -- yazi --chooser-file "$out"
elif [ "$multiple" = "1" ]; then
  "$termcmd" --title "FilePicker" -- yazi --chooser-file "$out"
else
  "$termcmd" --title "FilePicker" -- yazi --chooser-file "$out"
fi

# If saving and nothing was selected, clean up
if [ "$save" = "1" ] && [ ! -s "$out" ]; then
  rm -f "$path"
fi

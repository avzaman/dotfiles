# Global Agent Environment Rules

## Shell Behaviour Note

`~/.bash_profile` previously called `start-hyprland` unconditionally.
Claude Code spawns login shells (`bash -l`), which sources `~/.bash_profile`,
which triggered a new Hyprland compositor attempt on every Bash tool call.

**Fix applied:** added `[[ -z $WAYLAND_DISPLAY ]]` guard in `~/.bash_profile`.
Hyprland now only starts when no Wayland session is already running.

If Bash tool calls start misbehaving again, check `~/.bash_profile` for
unguarded compositor or display-server startup calls.

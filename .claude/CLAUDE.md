# Global Working Rules

## Documentation Output Formats

There are two distinct audiences for documentation. Choose format by audience,
not by habit:

**Human-facing documentation** (reports, guides, README-style overviews meant
to be read by people): write as standalone **HTML** files with embedded CSS.
- Single self-contained .html file — all styling in a <style> block, no
  external stylesheets or CDNs required to render.
- Include real styling: a readable max-width (~70ch), a clean font stack,
  styled headings, code blocks with background + monospace, and styled tables.
  It should look intentional when opened directly in a browser.
- Expose the styling as CSS custom properties (--accent, --font-body,
  --max-width, etc.) at the top of the <style> block so theming is a
  one-place edit.

**Claude-facing documentation** (context files, task notes, architecture
notes, TODO/handoff files — anything whose primary reader is a future Claude
session): write as plain **Markdown** (.md). No HTML, no styling. Optimize
for parseability and low token count: short sections, explicit headings,
lists over prose where it aids scanning.

If a document genuinely serves both audiences, the Markdown version is the
source of truth and the HTML version is generated from it.

## Git Upstream Hygiene

At the start of any session working in a repository:
1. Run `git fetch` to check the upstream.
2. If the local branch is behind upstream and a merge/rebase would be
   clean (no conflicts, no uncommitted local changes at risk), pull the
   updates before starting work.
3. If pulling would conflict with local changes or uncommitted work, do
   NOT pull. Leave the tree as-is, note the divergence, and mention it in
   your first response or run summary so a human can resolve it.
4. Never force-pull, hard-reset, stash-drop, or discard local work to make
   a pull succeed.

## Shell Behaviour Note

`~/.bash_profile` previously called `start-hyprland` unconditionally.
Claude Code spawns login shells (`bash -l`), which sources `~/.bash_profile`,
which triggered a new Hyprland compositor attempt on every Bash tool call.

**Fix applied:** added `[[ -z $WAYLAND_DISPLAY ]]` guard in `~/.bash_profile`.
Hyprland now only starts when no Wayland session is already running.

If Bash tool calls start misbehaving again, check `~/.bash_profile` for
unguarded compositor or display-server startup calls.

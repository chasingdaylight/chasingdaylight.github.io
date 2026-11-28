# Notes for coding agents

What a coding agent working on this site needs to know besides the [readme](readme.md).

- On GitHub, agents act as the GitHub App Chasing Daylight Agent, never as emanspeaks: `GH_TOKEN="$(bash /c/scratch/github-apps/app-token.sh chasingdaylight)"` for `gh`, and `bash /c/scratch/github-apps/app-git.sh chasingdaylight <git arguments>` for commits, fetches and pushes, with the harness's AI attribution trailer. Never print, copy or commit anything in `/c/scratch/github-apps/chasingdaylight/`.
- The site is built with Zine from `content/` (SuperMD) and `layouts/` (SuperHTML), with Zig 0.17.1: `zig build` writes it to `zig-out/public`. Build it before handing a change over; Zine reports a broken layout or link as an error.
- `assets/vendor/` is other projects' code as they published it: never edit it, replace it with a later release. The site's own rules go in `assets/style.css`.
- `.editorconfig` is authoritative. Zig: four spaces, as `zig fmt` writes them; everything else two.
- A project is listed only if it is a large, active one; the site is not a list of every repository.

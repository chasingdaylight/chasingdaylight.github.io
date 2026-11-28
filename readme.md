# chasingdaylight.github.io

The site at <https://chasingdaylight.dev>: a showcase of the Chasing Daylight projects, with a page for each.

It is built with [Zine](https://zine-ssg.io), a static site generator written in Zig, and styled with [98.css](https://jdan.github.io/98.css/). GitHub Pages serves what the workflow `.github/workflows/pages.yml` builds from `main`; `CNAME` holds the domain.

## Repository layout

| Path | What |
| --- | --- |
| `content/` | The pages, as SuperMD: `index.smd` is the home page, and each file in `projects/` is a project |
| `layouts/` | The SuperHTML layouts; `templates/base.shtml` is the desktop and taskbar every page has, `templates/listing.shtml` the window that lists the projects |
| `assets/style.css` | The site's own rules, on top of 98.css |
| `assets/vendor/98.css/` | 98.css and its fonts, as published (see its `readme.md`) |
| `assets/projects/` | The projects' logos and screenshots, copied from their repositories (see its `readme.md`) |
| `assets/brand/` | The wordmark and the avatar, served at `/brand/` |
| `zine.ziggy` | Zine's configuration |
| `build.zig` | Builds the site |

## Building

The site needs Zig 0.17.1, the version CI installs (`ZIG_VERSION` in `.github/workflows/pages.yml`). The first build compiles Zine and takes some minutes; later builds are quick.

```bash
zig build            # the site, in zig-out/public
zig build serve      # the dev server, at http://localhost:1990
```

## Adding a project

Add a file to `content/projects/`. Its front matter is all the home page needs:

```ziggy
---
.title = "Skein",
.description = "Requirements, specifications and traceability as plain text in git.",
.date = .date("2026-11-24T00:00:00"),
.layout = "project.shtml",
.custom = .{
    .logo = "projects/skein/logo.svg",
    .language = "Zig",
    .website = "https://skein.chasingdaylight.dev/",
    .source = "https://github.com/chasingdaylight/skein",
},
---
```

`date` is the day of the project's first commit: the projects are listed newest first, and the year is shown. `website` and `logo` (a file in `assets/`) are optional; `logo_style = "logo wide dark"` is for a logo that is wide, drawn for a dark ground, or both. The text below the front matter is the project's own page. A screenshot is an image in that text: `[its caption](<$image.siteAsset('projects/skein/graph.png').alt('what it shows')>)`.

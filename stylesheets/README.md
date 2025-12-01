# Stylesheets Directory

This directory contains shared LilyPond stylesheets and include files for the Sheet Music repository.

## Available Include Files

### common-header.ily

A standardized header file that sets `tagline = ""` for all scores.

**Usage:**

Include this file AFTER your `\header` block:

```lilypond
\version "2.24.0"
\language "english"

\header {
  title = "Your Title"
  composer = "Composer Name"
  country = "Country"
  style = "genre/style"
}

\include "../../stylesheets/common-header.ily"
```

**Benefits:**
- Ensures consistent tagline across all scores
- Single place to update if tagline format changes
- Cleaner individual score files

### Other Stylesheets

- **stylesheet_fiddle.ly** - Fiddle-specific formatting
- **stylesheet_lighter.ly** - Lighter weight styling
- **bars-per-line-engraver.ly** - Custom bar-per-line engraver
- **fingering-slide-engraver.ly** - Custom fingering slide engraver
- **LilyJAZZ.ily** - Jazz notation style
- **lv-goldenage.ily** - Golden age music font
- And more...

Refer to individual files for specific usage instructions.

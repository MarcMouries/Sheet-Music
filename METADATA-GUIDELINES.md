# Sheet Music Metadata Guidelines

## Overview
This document provides guidelines for maintaining consistent, high-quality metadata in LilyPond files.

## Required Metadata Fields

Every LilyPond file should include these fields in the `\header` section:

```lilypond
\header {
  title = "The Tune Name"
  composer = "Composer Name or 'Traditional'"
  style = "jig|reel|waltz|gypsy jazz|baroque|etc"
  tagline = ""
}
```

**Note**: We use `style` (not `meter`) to indicate the genre/type/style of music. In music theory, "meter" refers to time signature (3/4, 4/4, etc.), which is specified in the `\time` directive.

### Key Signature
Include in the music section:
```lilypond
\key c \major    % or \minor, \dorian, \mixolydian, etc.
```

## Field Guidelines

### 1. Title
- **Use proper capitalization**: "The Butterfly" not "the butterfly"
- **Be specific**: "Auld Lang Syne (in D)" not just "Auld Lang Syne"
- **Avoid generic names**: Never use "Untitled", "test", "new", etc.

### 2. Composer
- **Classical pieces**: Use full name: "Johann Sebastian Bach"
- **Traditional tunes**: Use "Traditional" or "Traditional Irish/Scottish/etc"
- **Known composers**: Use full name: "Stéphane Grappelli"
- **Unknown but attributed**: "Ireland, ca. 1870"
- **Arrangements**: Add arranger in subtitle

### 3. Meter/Type
Common values:
- **Irish/Celtic**: jig, reel, slip jig, hornpipe, polka, slide
- **Waltz**: waltz, mazurka, valse
- **March**: march, strathspey
- **Other**: air, lament, song, ballad

### 4. Key Signature
Always include the key in the music:
```lilypond
\key g \major
\key d \minor
\key a \dorian
\key e \mixolydian
```

### 5. Optional but Recommended
```lilypond
\header {
  subtitle = "aka Alternative Name"
  copyright = "Public Domain" or "©2024 Composer Name"
  source = "Book Name" or "https://thesession.org/tunes/1234"
  arranger = "Arranged by..."
  instrument = "Violin" or "Flute", etc.
}
```

## File Naming Conventions

### Single Version
```
TuneName.ly
TuneName.pdf
TuneName.midi
```

### Multiple Versions
Use descriptive suffixes:

**By key:**
```
Auld-Lang-Syne-D.ly    (in D major)
Auld-Lang-Syne-G.ly    (in G major)
```

**By arrangement:**
```
Molly-Ban-solo.ly
Molly-Ban-duet.ly
Molly-Ban-simplified.ly
```

**By iteration (if needed):**
```
Tune-v1.ly
Tune-v2.ly
Tune-final.ly
```

**Avoid:**
- Random numbers: ~~Tune-1.ly~~, ~~Tune-2.ly~~
- Dates: ~~Tune-20241125.ly~~
- Generic: ~~Tune-copy.ly~~, ~~Tune-new.ly~~

## Folder Structure

Each tune should be in its own folder:
```
Folk_Ireland/
  ├── The-Butterfly/
  │   ├── TheButterfly.ly
  │   ├── TheButterfly.pdf
  │   ├── TheButterfly.midi
  │   └── reference.pdf (if applicable)
  ├── Molly-Ban/
  │   ├── Molly-Ban.ly
  │   ├── Molly-Ban.pdf
  │   └── mollyban.abc
```

## Examples

### Good Example - Traditional Tune
```lilypond
\version "2.24.4"
\language "english"

\header {
  title = "The Butterfly"
  subtitle = "Slip Jig"
  composer = "Traditional Irish"
  meter = "slip jig"
  source = "https://thesession.org/tunes/120"
  tagline = ""
}

melody = \relative c' {
  \time 9/8
  \key e \minor
  % music here
}
```

### Good Example - Classical Piece
```lilypond
\version "2.24.4"

\header {
  title = "Gymnopédie No. 1"
  composer = "Erik Satie"
  opus = ""
  copyright = "Public Domain"
  meter = "slow waltz"
  tagline = ""
}

\score {
  \new Staff {
    \time 3/4
    \key c \major
    \tempo "Lent et douloureux"
    % music here
  }
}
```

### Good Example - With Multiple Versions
```lilypond
\header {
  title = "Auld Lang Syne"
  subtitle = "in D major"
  composer = "Traditional Scottish"
  arranger = "Arr. Marc Mouries"
  meter = "air"
  instrument = "Violin"
  tagline = ""
}
```

## Common Mistakes to Avoid

❌ **Don't:**
```lilypond
\header {
  title = "tune1"              % Generic name
  composer = "trad"            % Too abbreviated
  % No meter field
}

melody = {
  % No key signature
  a b c d
}
```

✅ **Do:**
```lilypond
\header {
  title = "The Butterfly"
  composer = "Traditional Irish"
  meter = "slip jig"
  tagline = ""
}

melody = {
  \key e \minor
  \time 9/8
  a b c d
}
```

## Metadata Maintenance

### Adding Missing Metadata
1. Research the tune on:
   - [The Session](https://thesession.org) (Irish/Celtic)
   - [IMSLP](https://imslp.org) (Classical)
   - Wikipedia
   - Original sheet music sources

2. Add to LilyPond header:
```lilypond
\header {
  % Add all discovered information
  title = "Full Title"
  composer = "Full Composer Name"
  meter = "tune type"
  source = "Where you found the information"
}
```

3. Regenerate PDF:
```bash
lilypond filename.ly
```

### Version Control
When creating a new version:
1. Copy the file with descriptive suffix
2. Update the header to reflect changes:
```lilypond
\header {
  title = "The Butterfly"
  subtitle = "Simplified for beginners"
  arranger = "Simplified by Marc Mouries"
}
```

## Tool Usage

After adding metadata, regenerate the index:
```bash
python3 generate-index-enhanced.py
```

Check metadata quality:
```bash
python3 analyze-metadata.py
```

## Questions?

If you're unsure about metadata:
1. Check similar files in the same category
2. Search online databases
3. Use "Traditional" if composer is unknown
4. Leave a comment in the file for future research:
```lilypond
% TODO: Find original composer
% TODO: Verify key signature
```

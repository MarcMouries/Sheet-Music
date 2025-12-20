# Multi-Key Sheet Music Setup Guide

This guide explains how to split a single LilyPond file with multiple keys (using `\transpose`) into separate key-specific files for better web integration.

## Overview

The multi-key pattern separates tunes into three types of files:
1. **Master content file** (`TuneName_music.ily`) - Contains the melody, chords, and musical definitions
2. **Preview wrapper** (`TuneName.ly`) - For editing with visual preview in your IDE
3. **Key-specific files** (`TuneName_(Key).ly`) - For the website, one per key

## When to Use This Pattern

Use this pattern when a tune file contains multiple `\transpose` commands to show the same tune in different keys, such as:

```lilypond
\score { \transpose c d \melody }
\score { \transpose c e \melody }
\score { \transpose c g \melody }
```

**Do NOT use** for tunes that only use `\transpose` internally (e.g., for 8va parts or single octave shifts).

## Step-by-Step Process

### 1. Identify Keys

First, examine the original file to identify all keys:

```bash
grep "\\transpose" TuneName.ly
```

Note down the target keys. For example:
- Original key: G minor
- Transposed keys: A minor, D minor, E minor

### 2. Create the Master Music File

Extract the musical content (melody, chords, global settings) into a `TuneName_music.ily` file:

**Example: `Gary-Owen_music.ily`**
```lilypond
\version "2.24.0"
\language "english"

global = {
  \time 6/8
}

chordNames = \chordmode {
  \global
  \partial 8 r8
  g
}

melody = \relative c''' {
  \global
  % ... melody content ...
}
```

**Important:**
- Remove all `\header`, `\score`, and `\layout` sections
- Keep only the musical definitions: `global`, `melody`, `chordNames`, etc.
- Keep the `\version` and `\language` (or `\include "english.ly"`) declarations

### 3. Create Key-Specific Files

For each key, create a separate file named `TuneName_(Key).ly`:

**Example: `Gary-Owen_(A).ly`**
```lilypond
\version "2.24.0"
\include "../../common/stylesheet_fiddle.ly"
\language "english"

\include "Gary-Owen_music.ily"

\header {
  title = "Gary Owen"
  subtitle = "Key: A major"
  instrument = "Violin"
  composer = "Traditional Irish"
  country = "Ireland"
  style = "jig"
}

\include "../../common/common-header.ily"

\paper {
  #(set-paper-size "letter")
}

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } {
    <<
      \new ChordNames { \transpose g a \chordNames }
      \new Voice = "mel" { \transpose g a \melody }
    >>
  }
  \layout { }
  \midi { }
}
```

**Key points:**
- Include the master music file: `\include "TuneName_music.ily"`
- Add `subtitle = "Key: X major/minor"` to the header
- Use `\transpose` as needed for non-original keys
- Include both `\layout { }` and `\midi { }` blocks

### 4. Create the Preview Wrapper

Update the original file to be a preview wrapper:

**Example: `Gary-Owen.ly`**
```lilypond
\version "2.24.0"
\include "../../common/stylesheet_fiddle.ly"
\language "english"

% This file is the PREVIEW WRAPPER for editing
% MASTER FILE for music content: Gary-Owen_music.ily
% Edit the .ily file to change the melody/chords

\include "Gary-Owen_music.ily"

\header {
  title = "Gary Owen"
  composer = "Traditional Irish"
  country = "Ireland"
  style = "jig"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames \chordNames
    \new Staff \melody
  >>
  \layout { }
}

\score {
  <<
    \new ChordNames { \transpose g a \chordNames }
    \new Staff { \transpose g a \melody }
  >>
  \layout { }
}

\score {
  <<
    \new ChordNames { \transpose g bf \chordNames }
    \new Staff { \transpose g bf \melody }
  >>
  \layout { }
}

\score {
  <<
    \new ChordNames { \transpose g d \chordNames }
    \new Staff { \transpose g d \melody }
  >>
  \layout { }
}
```

**Critical:** The comment `% This file is the PREVIEW WRAPPER for editing` is essential - the index generation script looks for "PREVIEW WRAPPER" to exclude this file.

### 5. Generate Output Files

Generate PDFs, MIDI files, and preview images:

```bash
cd /path/to/tune/directory

# Generate PDFs and MIDI for all keys
for key in G A Bb D; do
  lilypond "TuneName_(${key}).ly"
done

# Generate preview images (high quality, 2480px)
for key in G A Bb D; do
  qlmanage -t -s 2480 -o . "TuneName_(${key}).pdf"
  mv "TuneName_(${key}).pdf.png" "TuneName_(${key})-preview.png"
done
```

### 6. Regenerate Index

Run the index generation script:

```bash
cd /Users/marc.mouries/projects/Sheet-Music
python3 generate-index-page.py
```

The script will:
- Skip `_music.ily` files (include files)
- Skip preview wrapper files (identified by "PREVIEW WRAPPER" comment)
- Include only the key-specific `TuneName_(Key).ly` files
- Group them together in the index with a key selector

## File Naming Conventions

### Keys with Sharps/Flats
- **C# minor** → `TuneName_(C#m).ly`
- **Bb major** → `TuneName_(Bb).ly`
- **F# minor** → `TuneName_(F#m).ly`

### Major vs Minor
- **D major** → `TuneName_(D).ly`
- **D minor** → `TuneName_(Dm).ly`

The key selector will sort keys chromatically: C, C#, D, D#, E, F, F#, G, G#, A, A#, B

## Alternative: Header-Based Keys

For simpler setups where you don't want separate files per key, you can specify the key in the header:

```lilypond
\header {
  title = "My Tune"
  composer = "Traditional"
  key = "C"
}
```

This is useful for:
- **Single-key tunes**: Tunes that exist in only one key
- **Mixed multi-key setups**: Where some keys have filename suffixes and others use header keys

### Example: Mixed Setup (Kreutzer Etude)

```
Kreutzer_Étude-No.-2.ly       # key = "C" in header (original/default key)
Kreutzer_Étude-No.-2_(A).ly   # key = "A" in header (transposed version)
```

The index generator will:
1. First check for key suffix in filename `_(Key)`
2. If no filename key, use the `key` field from the header
3. Group all variants together with both keys available
4. **The base file's key (no filename suffix) is always the default** - it appears first in the key selector

**Priority order for key detection:**
1. Filename suffix `_(Key)` - highest priority
2. Header `key = "X"` field - used when no filename key
3. Music notation `\key` - fallback if neither above exists

**Default key ordering:**
- The base file (without `_(Key)` suffix) provides the default key
- This key appears first in the available keys list
- When opening the detail view, this key is selected by default
- Example: `Kreutzer_Étude-No.-2.ly` with `key = "C"` → C is the default, even if `_(A)` version exists

## Workflow for Editing

When you need to edit the tune:

1. **Edit the master content**: Open `TuneName_music.ily` and modify the melody/chords
2. **Preview while editing**: Open `TuneName.ly` (the wrapper) in your IDE to see all keys rendered
3. **Regenerate outputs**: Run lilypond on all key-specific files to update PDFs/MIDI
4. **Regenerate previews**: Run qlmanage on all PDFs to update preview images
5. **Update index**: Run `python3 generate-index-page.py`

## File Structure Example

```
Folk_Ireland/
└── Gary Owen/
    ├── Gary-Owen_music.ily          # Master content (edit this)
    ├── Gary-Owen.ly                 # Preview wrapper (for IDE preview)
    ├── Gary-Owen_(G).ly             # Key-specific file for website
    ├── Gary-Owen_(G).pdf
    ├── Gary-Owen_(G).midi
    ├── Gary-Owen_(G)-preview.png
    ├── Gary-Owen_(A).ly             # Key-specific file for website
    ├── Gary-Owen_(A).pdf
    ├── Gary-Owen_(A).midi
    ├── Gary-Owen_(A)-preview.png
    ├── Gary-Owen_(Bb).ly
    ├── Gary-Owen_(Bb).pdf
    ├── Gary-Owen_(Bb).midi
    ├── Gary-Owen_(Bb)-preview.png
    ├── Gary-Owen_(D).ly
    ├── Gary-Owen_(D).pdf
    ├── Gary-Owen_(D).midi
    └── Gary-Owen_(D)-preview.png
```

## Tunes Already Using This Pattern

As of 2025-12-04, the following tunes have been converted:

### Jewish Folk
- **Erev-shel-Shoshanim** (8 keys: Am, Bm, Cm, Dm, Em, Fm, F#m, Gm)
- **Papirosen** (3 keys: Cm, Dm, Gm)
- **Chosen-Kalle-Mazel-Tov** (4 keys: Gm, Am, Dm, Em)
- **Hevenu Shalom Aleichem** (3 keys: Cm, C#m, Dm)
- **Numi-numi Hebrew Lullaby** (3 keys: Dm, Cm, Bm)

### Ireland
- **Gary Owen** (4 keys: G, A, Bb, D)

### Finland
- **Emma's Waltz** (2 keys: Dm, Em)

### Russia
- **Korobeiniki (Tetris Theme)** (5 keys: Am, Dm, Em, Fm, Gm)

## Benefits of This Pattern

1. **Single source of truth**: All keys share the same musical content from `_music.ily`
2. **Easy editing**: Change the melody once, all keys update
3. **IDE preview**: The wrapper file shows all keys for visual verification
4. **Web-friendly**: Each key gets its own URL, PDF, MIDI, and preview image
5. **Key selector**: Users can easily switch between keys on the website
6. **Clean index**: Only key-specific files appear in the index, no duplicates

## Troubleshooting

### Preview wrapper showing up in index
- Ensure the file has the comment: `% This file is the PREVIEW WRAPPER for editing`
- Regenerate index: `python3 generate-index-page.py`

### Keys not grouped together
- Check that all key files use the same base name before `_(Key)`
- Ensure files are in the same directory
- Regenerate index

### Preview images low quality
- Use `qlmanage -t -s 2480` (not smaller values)
- Original quality previews should be ~200-230KB at 1753x2480

### Italian note names
For files using Italian note names (do=C, re=D, mi=E, etc.):
- Use `\include "italiano.ly"` in all files
- Transpose commands: `\transpose do re` (C to D), `\transpose do mi` (C to E), etc.

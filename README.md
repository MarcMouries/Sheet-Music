# Violin Sheet Music Repository

A curated collection of sheet music for violin created by Marc Mouries, compiled using LilyPond and published at https://marcmouries.github.io/Sheet-Music

## Repository Overview

This repository contains violin sheet music from various genres and regions:

- **Christmas/** - Christmas carols, hymns, and songs
- **Classical/** - Classical compositions (Bach, Beethoven, Mozart, etc.)
- **Folk_*** - Traditional music from various countries
- **Jewish/** - Jewish traditional music
- **Pop/** - Popular music arrangements
- **Rock/** - Rock music arrangements

Each tune is written in LilyPond format (`.ly` files) and compiled to PDF and MIDI files. The repository automatically generates an [interactive HTML index](https://marcmouries.github.io/Sheet-Music) with preview images.

## File Format Standards

All sheet music files must follow this standard format:

```lilypond
\version "2.24.0"
\language "english"

\header {
  title = "Tune Name"
  composer = "Composer Name (YYYY–YYYY)"  % Include dates for historical composers
  poet = "Lyricist Name"                  % Optional, if applicable
  country = "Country"                     % Country of origin
  style = "genre/style"                   % e.g., "christmas carol", "folk tune", "classical"
  arranger = "Arranger Name"              % Optional, if applicable
}

\include "../../common/common-header.ily"  % REQUIRED - sets repository-wide defaults

% Music content follows...
```

### Important Header Rules

1. **Always include** `\include "../../common/common-header.ily"` - this sets repository-wide defaults like `tagline = ##f`
2. **Never add** `tagline = ##f` to individual files - it's already in common-header.ily
3. **Use proper composer format**:
   - Historical composers: "Franz Gruber (1787–1863)"
   - Traditional: "Traditional [Country]" (e.g., "Traditional English", "Traditional Russian")
5. **Required fields**: title, composer, country, style

### Style Field Examples

- `"christmas carol"` - Traditional Christmas songs
- `"christmas hymn"` - Religious Christmas hymns
- `"christmas song"` - Modern Christmas songs
- `"folk tune"` - Traditional folk music
- `"classical"` - Classical compositions
- `"jewish traditional"` - Jewish traditional music

## Multi-Key Tune Pattern

For tunes available in multiple keys (especially important for violin), use this pattern:

### Structure
```
TuneName/
  ├── tunename_music.ily      % Shared music content (Original key)
  ├── tunename_(Am).ly        % Transposed version
  ├── tunename_(Dm).ly        % Transposed version
  ├── tunename_(Em).ly        % Transposed version
  └── ...
```

### Example: tunename_music.ily
```lilypond
\version "2.24.0"
\language "english"

melody = \relative c'' {
  \key a \minor
  \time 4/4
  % Music content...
}

chordNames = \chordmode {
  % Chords...
}
```

### Example: tunename_(Dm).ly
```lilypond
\version "2.24.0"
\language "english"

\include "tunename_music.ily"

\header {
  title = "Tune Name"
  subtitle = "Key: D minor"
  composer = "Traditional"
  country = "Country"
  style = "folk tune"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames { \transpose la re \chordNames }  % A to D
    \new Staff { \transpose la re \melody }
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}
```

### Transposition Best Practices

1. **Transpose from the original key**, not from C
2. Use Italian note names: `la` (A), `re` (D), `mi` (E), `fa` (F), `sol` (G), `si` (B)
3. Example: If original is Am, transpose to Dm using `\transpose la re` (A to D)
4. Common violin-friendly keys: Am, Dm, Em, Gm (use open strings)

See [Let-It-Snow](Christmas/Let-It-Snow/) and [Korobeiniki](Folk_Russia/Korobeiniki_Tetris/) for good examples.

## Adding New Sheet Music

### Step 1: Create the LilyPond File

1. Create a directory for the tune under the appropriate genre folder
2. Create the `.ly` file following the standard format above
3. If creating multiple keys, use the multi-key pattern with a shared `_music.ily` file

### Step 2: Compile the Files

```bash
# Compile to PDF and MIDI
lilypond filename.ly

# Generate preview image using the repository script
# This creates filename-preview.png (NOT filename.pdf.png)
cd scripts
./make-score-preview.sh ../path/to/filename.ly

# Or with custom crop percentage (default is 40%)
./make-score-preview.sh --percent 45 ../path/to/filename.ly
```

**Important**: Preview files must be named `filename-preview.png` (not `filename.pdf.png`). The `make-score-preview.sh` script handles this automatically.

### Step 3: Regenerate the Index

```bash
cd scripts
python3 generate-index-page.py
```

This scans the entire repository and generates `index.html` with:
- Preview images for all tunes
- Metadata (title, composer, style, country)
- Links to PDF and MIDI files
- Multi-key selector for transposed versions

## Repository Scripts

### scripts/generate-index-page.py
Generates the interactive HTML index page by scanning all `.ly` files and extracting metadata.

### scripts/verify-all-files.py
Verifies that all `.ly` files have corresponding PDF, MIDI, and preview files. Useful for finding missing generated files.

```bash
python3 scripts/verify-all-files.py
```

## Best Practices and Guidelines

### Transposition in Multi-Key Tunes
Always transpose from the original key, not from an arbitrary key like C. Use `\transpose [original] [target]` with note names matching your language declaration.

**With English note names** (`\language "english"`):
- Use: `c`, `d`, `e`, `f`, `g`, `a`, `b`
- Alterations: `s` for sharp, `f` for flat (e.g., `cs` = C♯, `bf` = B♭)
- Example: Transpose from F to G: `\transpose f g`

**With Italian note names** (`\include "italiano.ly"`):
- Use: `do`, `re`, `mi`, `fa`, `sol`, `la`, `si`
- Example: Transpose from Am to Dm: `\transpose la re` (not `\transpose do re`)

### Use the Common Header
The common settings are set in `common/common-header.ily`. Check what's in the common header before duplicating settings. 

### Managing Preview Files
- Preview files must be named `filename-preview.png` (not `filename.pdf.png`)
- Use `scripts/make-score-preview.sh` to generate previews - it creates the correct naming automatically
- When updating multi-key tunes, delete old preview files without key suffixes before regenerating
- Never use `qlmanage` directly - it creates wrong filenames (`filename.pdf.png`)

### Complete Metadata
Ensure all files include: title, composer (with dates for historical works), country, and style fields. This enables proper indexing and categorization

## Pending Tasks

See [TODO.md](TODO.md) for the current list of pending tasks and improvements needed in the repository.

## Contributing

When adding or modifying files:

1. ✅ Follow the standard file format
2. ✅ Include complete metadata in headers
3. ✅ Use `common-header.ily` - never duplicate its settings
4. ✅ For multi-key tunes, use the shared `_music.ily` pattern
5. ✅ Transpose from the original key, not from C
6. ✅ Test compilation before committing
7. ✅ Regenerate preview images and index
8. ✅ Check [TODO.md](TODO.md) for related tasks

## Examples of Well-Formatted Files

- [Christmas/Let-It-Snow/](Christmas/Let-It-Snow/) - Good multi-key pattern (F and G major)
- [Folk_Russia/Korobeiniki_Tetris/](Folk_Russia/Korobeiniki_Tetris/) - Good multi-key pattern (Am, Dm, Em, Fm, Gm)
- [Christmas/Silent-Night/silent_night.ly](Christmas/Silent-Night/silent_night.ly) - Good single-file format
- [Christmas/Carol-of-the-bells/Carol-of-the-bells_Violin_(key).ly](Christmas/Carol-of-the-bells/Carol-of-the-bells_Violin_(key).ly) - Good metadata with international title

## Technical Details

- **LilyPond Version**: 2.24.0 or higher recommended
- **Language**: English note names (c, d, e, f, g, a, b with sharps/flats)
- **Paper Size**: Letter (8.5" × 11")
- **MIDI Tempo**: Specified in each score's `\midi` block
- **Preview Size**: 2480px width for high-quality previews

## Questions or Issues?

Check the [TODO.md](TODO.md) file for known issues and planned improvements. For questions about LilyPond syntax, see the [LilyPond documentation](http://lilypond.org/doc/).

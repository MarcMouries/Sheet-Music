# Sheet Music Scripts

This directory contains automation scripts for managing the sheet music library.

## Preview Generation Scripts

### make-score-preview.sh

Generates a preview image (cropped top portion) from a LilyPond file.

**Usage:**
```bash
# Generate preview with default 40% crop
./scripts/make-score-preview.sh my-tune.ly

# Generate preview with 50% crop (shows more of the page)
./scripts/make-score-preview.sh --percent 50 my-tune.ly

# Generate preview with specific pixel height
./scripts/make-score-preview.sh --height 650 my-tune.ly

# Use higher resolution for better quality
./scripts/make-score-preview.sh --resolution 400 my-tune.ly
```

**Options:**
- `-h, --height N` - Crop height in pixels (overrides --percent)
- `-p, --percent N` - Crop height as N% of page height (default: 40)
- `-r, --resolution N` - PNG resolution DPI for LilyPond (default: 300)
- `--help` - Show help message

**Output:**
- `{basename}-full.png` - Full page PNG render (can be deleted after preview creation)
- `{basename}-preview.png` - Cropped preview image

**Notes:**
- Use higher `--percent` (45-55) for tunes with chords, lyrics, or multiple staves
- The script uses macOS's native `sips` tool (no ImageMagick required)
- Preview images are automatically detected by the index generator
- MIDI generation is disabled during preview rendering (`-dno-midi` flag)
- The full PNG can be deleted to save space (uncomment cleanup line in script)

### batch-generate-previews.py

Intelligently generates preview images for all LilyPond files in the repository with smart caching.

**Features:**
- ✅ Only generates previews when needed (no preview exists OR preview older than PDF)
- ✅ Parallel processing (4 jobs by default)
- ✅ Excludes tutorial/practice folders
- ✅ Progress tracking and statistics
- ✅ Dry-run mode to preview changes

**Usage:**
```bash
# Generate previews for all files (smart caching)
python3 scripts/batch-generate-previews.py

# Dry run to see what would be generated
python3 scripts/batch-generate-previews.py --dry-run

# Force regenerate all previews
python3 scripts/batch-generate-previews.py --force

# Use 50% crop for more visible content
python3 scripts/batch-generate-previews.py --percent 50

# Increase parallel jobs for faster processing
python3 scripts/batch-generate-previews.py --parallel 8

# Verbose mode (show all files including up-to-date ones)
python3 scripts/batch-generate-previews.py --verbose
```

**Options:**
- `--force` - Regenerate all previews regardless of timestamps
- `--percent N` - Crop percentage (default: 40)
- `--resolution N` - PNG resolution DPI (default: 300)
- `--dry-run` - Show what would be done without doing it
- `--parallel N` - Number of parallel jobs (default: 4)
- `--verbose` - Show all files including up-to-date ones

**Excluded Directories:**

The batch generator automatically skips template and library files:
- **Template dirs**: `Scales/`, `common/`, `common/`
- **Tutorial dirs**: `lilypong_how-to/`, `Harmonica/`, etc.
- **Practice dirs**: `8-Step_Warm-Up_Plan/`, `Marc's Practice Points/`

These directories contain include files and templates that aren't meant to be compiled as standalone pieces.

**Smart Caching Logic:**

The batch generator checks three conditions before generating a preview:

1. **Preview doesn't exist** → Generate
2. **PDF doesn't exist** → Skip (nothing to preview)
3. **PDF is newer than preview** → Regenerate
4. **Preview is up-to-date** → Skip

This means you can safely run the batch generator after editing files - it will only regenerate what's needed!

**Workflow:**

```bash
# After editing LilyPond files and compiling PDFs:
lilypond my-tune.ly

# Regenerate only outdated previews:
python3 scripts/batch-generate-previews.py

# Regenerate the index:
python3 generate-index-page.py
```

**Example Output:**
```
======================================================================
Batch Preview Generation
======================================================================
Root directory: /Users/marc/Sheet-Music
Crop percent: 40%
Resolution: 300 DPI
Parallel jobs: 4
======================================================================

🎵 Scanning for LilyPond files...
   Found 327 files to check
✓  Classical/Bach_Badinerie/Bach-Badinerie.ly: ✓ Generated
✓  Christmas/The First Noel/The First Noel.ly: preview is up to date
✓  Folk_Canada/Teardrop Waltz/Teardrop Waltz_Marc.ly: ✓ Generated
⊘  Practice/exercise.ly: PDF does not exist (skipping)

======================================================================
Summary
======================================================================
Total files:      327
Up to date:       310
Generated:        15
Failed:           0
Skipped (no PDF): 2
======================================================================

✓ All previews generated successfully!
```

## Index Generation

After generating previews, regenerate the index to display them:

```bash
python3 generate-index-page.py
```

The index generator automatically detects preview images and displays them in the card view. If no preview exists, a musical note emoji (🎼) is shown as a placeholder.

### URL Parameters Support

The generated `index.html` supports various URL parameters for direct linking and sharing:

#### Supported Parameters

- **`?tune=slug`** - Opens a specific tune detail page
  - Example: `index.html?tune=i-saw-three-ships`
  - The slug is the URL-friendly version of the tune title (lowercase, hyphens instead of spaces)

- **`?filter=type`** - Applies a predefined filter
  - `?filter=christmas` - Shows only Christmas music
  - `?filter=top10` - Shows top 10 tunes

- **`?search=query`** - Applies a search filter
  - Example: `index.html?search=bach`

- **`?category=name`** - Filters by category
- **`?country=name`** - Filters by country
- **`?difficulty=level`** - Filters by difficulty level

#### Important: Handling URL Parameters

**When adding new URL parameters**, you must update TWO places in `index.html`:

1. **Reading parameters on page load** - in the `applyURLFilters()` function
2. **Writing parameters to URL** - in the filter/navigation functions

**Example bug that was fixed:** The `tune` parameter was being written to the URL when clicking on a tune (via `navigateToTune()`), but it wasn't being read on page load in `applyURLFilters()`. This meant that direct links like `?tune=i-saw-three-ships` would show the full tune list instead of opening the specific tune.

**To prevent this bug pattern:**
- Always check both read and write paths when adding new parameters
- Test direct URL links after implementing parameter handling
- Add comments in the code explaining what each parameter does

## Preview Image Naming Convention

Preview images must follow this naming pattern:
- LilyPond file: `my-tune.ly`
- Preview image: `my-tune-preview.png`

The preview should be in the same directory as the `.ly` file.

## Tips & Best Practices

### Choosing Crop Percentage

Different types of sheet music need different crop amounts:

- **40% (default)** - Single staff, simple tunes
- **45-50%** - Tunes with chord symbols or lyrics
- **50-55%** - Multiple staves, complex arrangements

### Performance

The batch generator uses parallel processing. On a typical system:
- 4 parallel jobs (default): ~2-3 minutes per 100 files
- 8 parallel jobs: ~1-2 minutes per 100 files (diminishing returns)

### Disk Space

Preview images are typically:
- Full PNG: ~500KB - 1MB
- Preview PNG: ~200KB - 400KB

For 300 tunes: expect ~100-200MB for all previews.

### Cleaning Up

To remove all preview images:
```bash
find . -name "*-preview.png" -delete
find . -name "*-full.png" -delete
```

To remove only full-page renders (keep previews):
```bash
find . -name "*-full.png" -delete
find . -name "*-full.midi" -delete
```

## Dependencies

### make-score-preview.sh
- `lilypond` - LilyPond engraving software
- `sips` - Native macOS image manipulation tool (built-in)

### batch-generate-previews.py
- Python 3.7+
- `lilypond` (via make-score-preview.sh)
- `sips` (via make-score-preview.sh)

## Troubleshooting

### "Error: lilypond not found in PATH"
Install LilyPond or add it to your PATH:
```bash
export PATH="/Applications/LilyPond.app/Contents/Resources/bin:$PATH"
```

### "Script failed: timeout"
Some complex scores take longer to render. The batch generator has a 120-second timeout per file. If a file consistently times out:
1. Check if the `.ly` file compiles correctly
2. Simplify the score if possible
3. Generate that preview manually with higher timeout

### Preview looks too small/large
Adjust the crop percentage:
```bash
# Show more content
python3 scripts/batch-generate-previews.py --percent 55 --force

# Show less content
python3 scripts/batch-generate-previews.py --percent 35 --force
```

### Preview quality is poor
Increase the resolution:
```bash
python3 scripts/batch-generate-previews.py --resolution 400 --force
```

## Integration with Git

Consider adding this to your workflow after making changes:

```bash
#!/bin/bash
# After editing LilyPond files

# Compile PDFs
make all  # or your build command

# Generate/update previews
python3 scripts/batch-generate-previews.py

# Regenerate index
python3 generate-index-page.py

# Commit everything
git add .
git commit -m "Update sheet music and previews"
```

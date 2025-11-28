# Missing Previews Investigation

**Date**: 2025-11-27

## Files Without Previews (But Have PDFs)

These files have PDFs but failed during preview generation due to compilation errors:

### Classical Music

| File | Composer | Issue |
|------|----------|-------|
| Bach-Badinerie.ly | J. S. Bach (1685-1750) | Failed during preview generation |
| Io-Ti-Penso-Amore.ly | Niccolò Paganini (1782–1840) | Failed during preview generation |
| Paradis-Sicilienne.ly | Maria-Theresia von Paradis (1759–1824) | Failed during preview generation |
| Brahms-Berceuse.ly | Johannes Brahms (1833–1897) | Failed during preview generation |

### Folk/Traditional

| File | Title | Issue |
|------|-------|-------|
| You_are_my_Sunshine.ly | You are my Sunshine | Has PDF, has proper metadata, preview generation failed |
| triptosligo-3.ly | Trip To Sligo, The | ❌ Wrong title format (should be "The Trip To Sligo") |
| The Trip To Sligo (Jig).ly | The Trip To Sligo | ✓ Correct title, has preview |

### Gypsy Jazz / Jazz

| File | Composer | Issue |
|------|----------|-------|
| Bistro_Fada.xml.ly | Stéphane Wrembel | Failed - missing include files |
| Daphne - Grappelli+Taylor.ly | Django Reinhardt | Failed - missing include files |
| Minor Swing - van Hemert.ly | Django Reinhardt & Stéphane Grappelli | Failed - missing include files |
| As-Time-Goes-By.ly | Herman Hupfeld | Failed - compilation error |
| Misty.ly | Erroll Garner | Failed - compilation error |

## Root Causes

### 1. Compilation Errors During Preview Generation

**These files are in the failed files list from batch-generate-previews.py**

The preview generation script tries to compile the LilyPond file to PNG, but fails due to:
- Missing include files (violin-functions.ly, stylesheet files, etc.)
- Syntax errors in the .ly file
- Deprecated LilyPond commands

**Why they have PDFs but no previews:**
- PDFs were likely compiled manually or with a different environment that had the includes
- Preview generation runs in isolation and can't find dependencies

### 2. Metadata Issues

#### "You are my Sunshine" - Composer Field

**Current metadata (Folk_USA/You_are_my_Sunshine/You_are_my_Sunshine.ly):**
```lilypond
\header {
  title = \markup \caps "You are my Sunshine"
  subtitle = "Words & Music by the Rice Brothers"
  composer = "Jimmie Davis and Charles Mitchell"
  style = "old-time"
  tagline = ""
}
```

**Status:** ✓ Metadata is correct!
- Composer: Jimmie Davis and Charles Mitchell
- Subtitle credits the Rice Brothers appropriately

#### "Trip To Sligo" - Title Format Issue

**File: triptosligo-3.ly**
```lilypond
title = "Trip To Sligo, The"  # ❌ Wrong - old ABC notation style
```

**File: The Trip To Sligo (Jig).ly**
```lilypond
title = "The Trip To Sligo"   # ✓ Correct
```

**Issue:** The triptosligo-3.ly file uses the old ABC notation style where articles (The, A, An) are moved to the end with a comma. This should be "The Trip To Sligo".

## Solutions

### Priority 1: Fix Compilation Errors for Important Pieces

These are high-value classical pieces that should have previews:

1. **Bach-Badinerie.ly** - Popular baroque piece
2. **Brahms-Berceuse.ly** - Beautiful lullaby
3. **Paradis-Sicilienne.ly** - Famous romantic piece
4. **Io-Ti-Penso-Amore.ly** - Paganini song

**Action:** Check what include files are missing and either:
- Add the missing includes to the repository
- Fix the include paths in the files
- Copy the required includes to a common location

### Priority 2: Fix Title Format

**File:** Folk_Ireland/The Trip To Sligo (Jig)/triptosligo-3.ly

**Change:**
```lilypond
# Before:
title = "Trip To Sligo, The"

# After:
title = "The Trip To Sligo"
```

### Priority 3: Fix Jazz/Gypsy Jazz Missing Includes

These files likely need the common include files:
- Minor Swing
- Daphné
- Bistro Fada
- As Time Goes By
- Misty

**Action:** Identify what include files they need and add them.

## Detailed File Status

### Files WITH Previews
- ✓ The Trip To Sligo (Jig).ly - Has preview and correct title
- ✓ You_are_my_Sunshine.ly - Has preview and correct metadata

### Files WITHOUT Previews (Need Fixing)
- ✗ Bach-Badinerie.ly - Compilation error
- ✗ Brahms-Berceuse.ly - Compilation error
- ✗ Paradis-Sicilienne.ly - Missing include
- ✗ Io-Ti-Penso-Amore.ly - Has preview! (checked: has preview)
- ✗ triptosligo-3.ly - Wrong title format + compilation error

### Check Results

Let me verify which actually have previews:

```bash
# Check for existing previews
ls -la Classical/Bach_Badinerie/*preview.png
ls -la Classical/Brahms_Berceuse/*preview.png
ls -la Classical/Paradis\ -\ Sicilienne/*preview.png
ls -la Classical/Paganini_Io-ti-penso-amore/*preview.png
ls -la Folk_Ireland/The\ Trip\ To\ Sligo\ \(Jig\)/*preview.png
```

## Next Steps

1. **Fix triptosligo-3.ly title** - Quick fix, change title format
2. **Investigate missing includes** - Find what's needed for classical pieces
3. **Generate previews for fixed files** - Re-run batch generator after fixes
4. **Update metadata template** - Document proper title format

## Notes

- The batch generator excluded 128 template files, so the failures are actual music files
- All mentioned files have PDFs, so they compile in some environment
- The issue is preview generation failing in isolated environment without includes

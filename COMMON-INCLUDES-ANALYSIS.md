# Common Includes Analysis

## Current State

### Existing Common Include Files

#### 1. **common/title-formatting.ly** (4 usages)
**Purpose:** Provides reusable title formatting styles
**Features:**
- 4 pre-defined styles: simpleTitle, realBookStyle, classicalStyle, minimalStyle
- Pulls data from \header block (title, composer, arranger, etc.)
- Optional page headers for odd/even pages
- Includes tagline = "" in usage examples

**Issue:** Old version (2.19.11) - should be updated to 2.24.0

#### 2. **common/includes.ly** (4 usages)
**Purpose:** Master include file that loads multiple common files
**Contents:**
```lilypond
\language "english"
\include "bars-per-line-engraver.ly"
\include "violin-functions.ly"
```

**Files currently using it:**
- Folk_Canada/Teardrop Waltz/Teardrop Waltz_Marc.ly
- (3 others)

#### 3. **stylesheets/stylesheet_fiddle.ly** (29 usages - MOST USED!)
**Purpose:** Fiddle-specific formatting
**Usage:** Most popular include file in the repository

#### 4. **common/violin-functions.ly** (18 usages)
**Purpose:** Custom violin-specific functions and utilities

#### 5. **common/markups.ly** (9 usages)
**Purpose:** Custom markup commands
**Features:**
- paragraph - justified text layout
- writeMusic/writeMusicNoTime - embed score snippets
- sectionLetter - section markers
- repeat-stencil - bracket repeats

#### 6. **stylesheets/common-header.ily** (1 usage - NEW)
**Purpose:** Standardized tagline setting
**Contents:**
```lilypond
\version "2.24.0"
\header {
  tagline = ##f
}
```

### Duplicated Files

Some files exist in both `common/` and `stylesheets/`:
- bars-per-line-engraver.ly (both locations)
- twoByTwoBeaming.ly (both locations)
- Others may be duplicated

## Problems Identified

1. **Version Inconsistency**
   - title-formatting.ly uses version 2.19.11 (outdated)
   - New common-header.ily uses 2.24.0 (correct)

2. **Location Confusion**
   - Files scattered between `common/` and `stylesheets/`
   - Some files duplicated in both locations
   - No clear organization principle

3. **Tagline Inconsistency**
   - title-formatting.ly examples use `tagline = ""`
   - Repository standard should be `tagline = ##f`
   - Many files still have inline `tagline = ""`
   - New common-header.ily correctly uses `tagline = ##f`

4. **No Master Documentation**
   - No README in common/ directory
   - Only new README in stylesheets/ (just created)
   - Users don't know which includes to use

## Recommendations

### Short-Term (Immediate)

1. **Update title-formatting.ly**
   - Change version to 2.24.0
   - Update tagline examples from "" to ##f
   - Add documentation about using with common-header.ily

2. **Consolidate Location**
   - Decide on single location: either `common/` OR `stylesheets/`
   - Recommendation: Use `common/` for all shared includes
   - Keep `stylesheets/` for pure style files (fonts, spacing, etc.)

3. **Create common/README.md**
   - Document all available includes
   - Show usage examples
   - Explain when to use each file

### Long-Term (Migration Plan)

1. **Create Master Include File**
   ```
   common/sheet-music-common.ily
   ```
   That includes:
   - Version declaration
   - English language
   - Common header (tagline = ##f)
   - Optional: title formatting

2. **Migration Strategy**
   - Start with new files using new system
   - Gradually migrate existing files
   - Use find/replace scripts for bulk updates

3. **Standardize Path References**
   - All includes should use paths relative to repository root
   - Or define LILYPOND_INCLUDE environment variable

## Proposed New Structure

```
common/
├── README.md                    # Documentation for all includes
├── sheet-music-common.ily       # Master include (NEW)
├── common-header.ily            # Tagline standardization (MOVED from stylesheets)
├── title-formatting.ily         # Title styles (UPDATED)
├── includes.ly                  # Legacy compatibility
├── violin-functions.ly          # Violin utilities
├── markups.ly                   # Custom markups
├── bars-per-line-engraver.ly    # Bar engraver
└── ...

stylesheets/
├── README.md                    # Style-specific docs
├── stylesheet_fiddle.ly         # Fiddle formatting
├── stylesheet_lighter.ly        # Lighter formatting
├── LilyJAZZ.ily                 # Jazz fonts
└── ...
```

## Usage Examples

### Current Best Practice (After common-header.ily)
```lilypond
\version "2.24.0"
\language "english"

\header {
  title = "My Tune"
  composer = "Traditional"
  country = "Ireland"
  style = "jig"
}

\include "../../common/common-header.ily"
```

### Future Proposed (Single Master Include)
```lilypond
\include "../../common/sheet-music-common.ily"

\header {
  title = "My Tune"
  composer = "Traditional"
  country = "Ireland"
  style = "jig"
  % tagline automatically set by sheet-music-common.ily
}
```

## Files to Update

Priority files that should adopt new common-header.ily:
- All files currently using inline `tagline = ""`
- All files using title-formatting.ly (need coordination)
- New files being created

## Next Steps

1. ✅ Created common-header.ily with tagline = ##f
2. ✅ Created stylesheets/README.md
3. ⬜ Update title-formatting.ly version and tagline
4. ⬜ Create common/README.md
5. ⬜ Decide on common/ vs stylesheets/ organization
6. ⬜ Consider creating master sheet-music-common.ily
7. ⬜ Test with multiple file types
8. ⬜ Document migration path for existing files

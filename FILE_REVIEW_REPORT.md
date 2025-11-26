# File Review Report
**Date:** 2025-11-26

---

## 1. Untitled Files in Root

### File: `Untitled.pdf` + `Untitled.midi`
- **Location:** Root directory
- **Size:** 44KB (PDF), 237 bytes (MIDI)
- **Date:** Nov 25, 2025 (yesterday)
- **Creator:** LilyPond 2.24.4
- **Pages:** 1 page

### Source Files Found:
1. **`Practice/Untitled.ly`** - Practice exercise (fingering practice: a c_3 a c_1 e_3...)
2. **`Lilypond_How-to/Untitled.ly`** - Tutorial/helper functions file (markup commands)

### Analysis:
The root PDF/MIDI appear to be output files from one of these source .ly files.

**Content:**
- Practice/Untitled.ly: Simple fingering exercise (empty title/header)
- Lilypond_How-to/Untitled.ly: Tutorial code (markup helpers)

### Recommendations:
**Option 1:** Delete root PDF/MIDI (can be regenerated from source)
- ✅ Source files exist in proper locations
- ✅ Can regenerate output anytime
- ❌ Loses compiled outputs

**Option 2:** Keep and rename based on content
- Review Practice/Untitled.ly → rename to "Fingering-Exercise-1.ly" + move PDF/MIDI
- Lilypond_How-to/Untitled.ly is OK (tutorial code)

**Option 3:** Move to temp/output folder
- Create `_output/` or `_temp/` folder for generated files

**My suggestion:** **Delete** the root PDF/MIDI files. The sources are properly located.

---

## 2. Scales/ Folder vs Practice/Scales

### Top-level `Scales/` Folder (107 files)
**Purpose:** Comprehensive scale library / reference collection

**Contents:**
- Template files (TrebleScalesTemplate.ly, BassScalesTemplate.ly, etc.)
- Complete scale collections by key
- Subdirectory: `fr/` (French language versions - 58+ files)
- Systematic coverage of all keys

**File examples:**
```
CScales.ly
BasicScales.ly
CommonSettings.ly (helper file)
fr/FaBemol_TrebleAndBass.ly
fr/FaDiese_Treble.ly
```

### `Practice/MyViolin Practice/Scales/` (9 files)
**Purpose:** Personal practice exercises

**Contents:**
- Personal practice files (scales.ly, grade1_scales.ly)
- Duplicates: "Copy of scales&Arppegios.ly"
- Specific exercises: "scale g-major.ly"

**File examples:**
```
scales.ly
scale g-major.ly
book_Scales+Arpeggios.ly
scales & bow.ly
```

### Comparison:
| Aspect | Scales/ (107) | Practice/Scales/ (9) |
|--------|---------------|----------------------|
| Purpose | Reference library | Personal practice |
| Coverage | All keys systematically | Selected keys for practice |
| Organization | Templates + by key | Ad-hoc collection |
| French versions | Yes (58+ files) | No |
| Duplicates | No | Yes ("Copy of...") |

### Conclusion:
**These are DIFFERENT collections serving different purposes.**

**Recommendation:** **KEEP BOTH SEPARATE**
- `Scales/` = Reference library (like a textbook)
- `Practice/Scales/` = Your personal practice routine

**Action needed:**
- Clean up duplicates in Practice/Scales/ ("Copy of scales&Arppegios.ly")
- Consider renaming Practice/Scales/ to Practice/MyScalePractice/ for clarity

---

## 3. Devil's Dream - ✅ COMPLETED

**Action:** Moved to Folk_USA/Devils Dream/
- American fiddle tune
- Now properly categorized

---

## 4. WIP Folders (Underscore Prefix)

### `_Greensleeves/` (5 files)

**Contents:**
```
Greensleeves.ly
Greensleeves-1.ly
Greensleeves-2.ly
Greensleeves-3.ly
Greensleeves-Marc.ly
```

**Comparison with Folk_England/Greensleeves Jig:**
- Folk_England has: Greensleeves Jig.ly, Greensleeves-Jig.ly (2 files)
- Different arrangements? Or duplicates?

**Need to:**
1. Read both sets of files
2. Compare if they're different arrangements or duplicates
3. Decide: merge unique content or keep separate versions

**Question:** Are these different arrangements (jig vs. standard) or work-in-progress versions?

---

### `_Mozart_RondoAllaTurca/` (4 files)

**Contents:** (need to list)

**Action:** Move to `Classical/Mozart_Rondo_Alla_Turca/`
- Classical piece
- Remove underscore (no longer WIP)

**Question:** Is this ready to move or still work-in-progress?

---

## 5. Other Single-File Folders

From the analysis, there are 67 folders with only 1 .ly file.

**Classical folders (most single-file):** These are OK
- Each piece is standalone (Bach Badinerie, Paganini works, etc.)
- Classical music organization by composer/work makes sense

**Folk folders (some single-file):** Room to grow
- Folk_French (1 file) - OK, can add more French tunes
- Folk_Romania (1 file) - OK, can add more
- Folk_Germany (2 files) - just added Muss I Denn

**Other considerations:**
- Games/ (1 file) - what is this? Review content
- Latina/ (2 files) - keep or merge?

---

## Summary of Decisions Needed

### Immediate (High Priority):
1. **Untitled files:** Delete root PDF/MIDI? Or rename source files?
2. **_Greensleeves/:** Review and compare with Folk_England version
3. **_Mozart_RondoAllaTurca/:** Ready to move to Classical?

### Medium Priority:
4. **Practice/Scales duplicates:** Clean up "Copy of..." files?
5. **Games/ folder:** What's in it? Where should it go?

### Low Priority:
6. **Latina/ folder:** Keep separate or merge with Pop?
7. **Very small Folk collections:** Keep for growth or merge?

---

## Recommended Actions

**I suggest we tackle these in order:**

1. ✅ **Devil's Dream** - DONE (moved to Folk_USA)

2. **Untitled files** - Awaiting your decision:
   - [ ] Delete root PDF/MIDI (my recommendation)
   - [ ] Or rename and organize

3. **_Greensleeves/** - Need to review:
   - [ ] Read files and compare with Folk_England version
   - [ ] Merge or keep separate?

4. **_Mozart_RondoAllaTurca/** - Check if ready:
   - [ ] Move to Classical?

5. **Clean up Practice/Scales**:
   - [ ] Remove duplicate "Copy of..." file

**What would you like me to tackle next?**

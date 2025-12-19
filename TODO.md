# Sheet Music Repository - TODO List

- [x] Check new tunes: Humoresque, Besame mucho, renamed of Manha-de-Carnaval.
- [x] Review Christmas music files (Silent Night, Joy to the World, Carol of the Bells, etc.) to ensure they follow repository format standards - All 16 Christmas files now have consistent metadata
- [x] Update README.md with comprehensive documentation for contributors and AI agents - Added repository overview, format standards, multi-key pattern documentation, workflows, and examples
- [x] Fix URL tune parameter bug (?tune=slug wasn't opening tune detail) - Added parameter handling in applyURLFilters() function. **Lesson learned**: When adding URL parameters, always update BOTH read (applyURLFilters) and write (navigation) functions. Documented in scripts/README.md and code comments.
- [] Fix compilation errors in files that fail to generate previews - 45 files failed during batch preview generation including: Carol-of-the-bells_SATB.ly, silent_night.ly, SilentNight.ly, Silent Night2.ly, and various other files with partcombine or layout issues
- [] Add transposed versions of Christmas tunes in violin-friendly keys 
- [] Fix duplicate Rondo Alla Turca entries - 3 versions with identical metadata (Piano, Violin, Violin-MacBookAir). Either update subtitles to distinguish them or delete obsolete MacBookAir version
- [] check all the files that have transposed version (they use the \transpose keyword) and let's make them look nice like "Erev shel Shoshanim"
- [] work on having a common bookTitleMarkup that we can inport in files
- [] finish "Can she excuse my wrongs", find music on imlsp
- [] Add difficulty to tunes
- [] we want all the files to use the same tagline "tagline  = ##f". Can we put that into a common file?
- [] check header of:  "Numi numi - Hebrew Lullaby", "Chosen Kalle Mazel Tov"
- [] if we include \include "../../common/improviso.ily" we get an error

**Last Updated:** 2025-11-25

## ✅ Completed Tasks

### Metadata Cleanup (Nov 2024 - Nov 2025)

- [x] Fixed metadata for 68+ files (added composer, style fields)
- [x] Changed all "meter" fields to "style" (67 files total)
- [x] Added dates to classical composer names (e.g., "Erik Satie (1866--1925)")
- [x] Handled duplicate files:
  - Deleted 2 true duplicates
  - Replaced Si-Tu-Savais stub with complete version
  - Added metadata to Mori+Shej_2.ly alternate arrangement
- [x] Updated generate-index-enhanced.py to use "style" instead of "meter"
- [x] Added stylesheet includes to 23 folk tunes in 4/4 or 2/2 time
- [x] Fixed final 5 classical files (Gymnopédie, Bach Badinerie, Dowland)
- [x] Reduced files missing composers from 178 to 0! 🎉

### Repository Organization

- [x] Reorganized repository structure:
  - Renamed Trad_*folders to Folk_*
  - Split Celtic folder by country (Ireland, Scotland)
  - Created proper folder hierarchy

---

## 📋 Low Priority Tasks

### 1. Bug/Test Files

**Priority:** Very Low
**Action:** Move to appropriate location or archive

Files:

- `Folk_Finland/Ievan Polkka/bug repeat partial.ly`
- `Folk_Finland/Ievan Polkka/bug rythm.ly`

**Notes:** These are test files for debugging LilyPond issues. Consider:

- Creating a `_tests/` or `_debug/` folder
- Or deleting if no longer needed

---

### 2. Gymnopédie Guitar Component Files

**Priority:** Low
**Action:** Review later if individual metadata needed

Location: `Classical/Erik_Satie_Gymnopédie/Gymnopedie_Guitar/`

**Notes:**

- These are component files that are part of a larger guitar arrangement
- Already have copyright.ly files
- May not need individual metadata as they're included by a main file

---

### 3. Practice Files Organization

**Priority:** Low
**Action:** Review and potentially consolidate

Location: `Practice/MyViolin Practice/`

**Notes:**

- Some duplicate scale files exist
- Consider organizing by:
  - Technique type (scales, arpeggios, etudes)
  - Difficulty level
  - Position work

---

### 4. Missing Key Signatures in Jazz Files

**Priority:** Low
**Action:** Review, but likely not needed
**Notes:** Jazz style often doesn't require key signatures in the traditional sense, as harmony is fluid. This is probably fine as-is.

---

### 5. Extended Metadata (Optional)

**Priority:** Very Low
**Action:** Add optional metadata from .music-metadata-template.json

Fields to consider:

- `difficulty` (1-5 scale)
- `tags` (additional categorization)
- `notes` (practice notes, performance tips)

**Files that could use extended metadata:**

- All Gymnopédie arrangements (difficulty, performance notes)
- Bach Badinerie (difficulty: advanced)
- Dowland pieces (historical context)

---

## 🔧 Current Tasks (In Progress)

### Index.html Improvements

- [ ] **Add music sheet preview to card display** - Display the beginning of the music sheet in the card view for quick visual reference

---

## 🎯 Future Enhancements

### Content Additions

- [ ] Add more folk tunes from various traditions
- [ ] Expand classical repertoire
- [ ] Add more gypsy jazz transcriptions

### Technical Improvements

- [ ] Generate PDF files automatically for all .ly files
- [ ] Create MIDI files for practice
- [ ] Add CI/CD pipeline for automatic compilation
- [ ] Create mobile-friendly index page
- [ ] Add search functionality to index.html

### Documentation

- [ ] Add performance notes for complex pieces
- [ ] Document bowing patterns for folk tunes
- [ ] Create style guides for different genres

---

## 📊 Repository Statistics

**As of 2025-11-25:**

- Total tunes: 407
- Files with complete metadata: 407 (100%)
- Files with missing composers: 0 (was 178)
- Folk tunes with stylesheet: 23+ files
- Genres represented: Folk (Irish, Scottish, Hungarian, Russian, Romanian, Jewish, etc.), Classical, Jazz, Gypsy Jazz, Pop, Soundtracks

---

## 🎵 Metadata Standards

### Required Fields

```lilypond
\header {
  title = "Tune Name"
  composer = "Composer Name (YYYY--YYYY)" % Include dates for classical
  style = "jig|reel|waltz|classical|baroque|etc"
  tagline = ""
}
```

### Optional Fields

- `subtitle` - Additional context or alternate title
- `poet` - Lyricist (for songs with lyrics)
- `arranger` - Arranger name (format: "arr. Name")
- `opus` - Opus number for classical works
- `video` - URL to performance video
- `session` - Link to thesession.org for folk tunes
- `origin` - Geographic origin (for traditional music)

### Style Values Reference

- **Folk:** jig, reel, hornpipe, polka, waltz, slip jig, etc.
- **Classical:** baroque, classical, romantic, contemporary
- **Jazz:** swing, bebop, gypsy jazz, jazz waltz
- **Other:** practice exercise, etude, lullaby, anthem

---

## Notes

- Always use `style` field for genre/type (NOT `meter` - that's time signature!)
- Include composer dates for classical music: "J. S. Bach (1685–1750)"
- Use relative paths for includes: `\include "../../common/stylesheet_fiddle.ly"`
- All folk tunes in 4/4 or 2/2 should include the fiddle stylesheet

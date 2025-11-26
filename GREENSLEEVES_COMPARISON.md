# Greensleeves Files Comparison

## Summary

**`_Greensleeves/`** folder contains multiple different arrangements and versions of Greensleeves, while **`Folk_England/Greensleeves Jig/`** contains specifically the JIG arrangement.

These are **DIFFERENT** and should be organized differently.

---

## File Breakdown

### `_Greensleeves/` (WIP folder - 21 files)

#### 1. **Standard Greensleeves versions:**
- `greensleeves.ly` - Basic violin arrangement
- `greensleeves (Em).ly` - E minor version with lyrics ("Alas, my love...")
- `greensleeves_landscape.ly` - Landscape format version

#### 2. **Guitar arrangements:**
- `greensleeves_guitar.ly` - Guitar arrangement by David Kastrup (Mutopia Project)
  - "Voice and guitar arranged from memory"
  - Creative Commons license
- `greensleeves_melody.ly` - Melody version

#### 3. **Other formats:**
- `greensleeves.abc` - ABC notation format
- Multiple PDF and MIDI outputs

**Key characteristics:**
- 6/8 time signature (waltz feel)
- Multiple keys (G major, E minor, etc.)
- Traditional melody with lyrics
- Various arrangements (voice, guitar, violin)

---

### `Folk_England/Greensleeves Jig/` (2 .ly files)

#### Files:
- `Greensleeves Jig.ly` - JIG arrangement (6/8 in G minor, tempo 120)
- `Greensleeves-Jig.ly` - Similar jig arrangement

**Key characteristics:**
- Specifically arranged as a JIG
- G minor key
- Has video link: https://www.youtube.com/watch?v=4aDK9qdoWpk
- Metadata: composer = "Traditional English", style = "jig"
- Proper metadata (added in our session)

---

## Analysis

### Are they duplicates? **NO**

**Folk_England version:**
- Specific JIG arrangement
- Fast tempo for dancing
- Purpose: Irish/Scottish session tunes style

**_Greensleeves versions:**
- Traditional song arrangements
- Various keys and styles
- Guitar arrangements
- Original melody with lyrics
- Different purpose: general performance/learning

---

## Recommendations

### Option 1: Keep Both Separate (Recommended)
**Reasoning:** Different musical purposes

**Proposed structure:**
```
Folk_England/
└── Greensleeves Jig/        # Keep as-is (jig arrangement)

Folk_England/ (or create Folk_England/Greensleeves/)
└── Greensleeves/            # Rename _Greensleeves → Folk_England/Greensleeves/
    ├── Standard Versions/   # Traditional arrangements
    ├── Guitar/              # Guitar-specific versions
    └── Other/               # ABC, landscape, etc.
```

### Option 2: Merge into Single Collection
Combine all into `Folk_England/Greensleeves/` with subfolders:
- `Jig_Arrangements/`
- `Traditional_Versions/`
- `Guitar_Versions/`

---

## Detailed File Decisions

### Keep in `Folk_England/Greensleeves Jig/`:
✅ `Greensleeves Jig.ly` - Has proper metadata
✅ `Greensleeves-Jig.ly` - Backup/alternate version

### From `_Greensleeves/` - Organize into `Folk_England/Greensleeves/`:

**Standard Versions:**
- `greensleeves.ly` → Keep (basic violin)
- `greensleeves (Em).ly` → Keep (with lyrics, E minor)
- `greensleeves_landscape.ly` → Keep or delete? (just formatting difference)

**Guitar Versions:**
- `greensleeves_guitar.ly` → Keep (Mutopia arrangement)
- `greensleeves_melody.ly` → Keep or merge with guitar?

**Other Formats:**
- `greensleeves.abc` → Keep (ABC notation reference)

**Generated Files (PDFs/MIDIs):**
- Option: Keep main ones, delete duplicates
- Or: Delete all (can regenerate from .ly files)

---

## Proposed Action Plan

### Immediate:
1. Rename `_Greensleeves/` → `Folk_England/Greensleeves/`
2. Organize into subfolders:
   ```
   Folk_England/Greensleeves/
   ├── Standard/
   │   ├── greensleeves.ly
   │   ├── greensleeves (Em).ly
   │   └── greensleeves_landscape.ly (optional)
   ├── Guitar/
   │   ├── greensleeves_guitar.ly
   │   └── greensleeves_melody.ly
   └── ABC/
       └── greensleeves.abc
   ```
3. Keep `Folk_England/Greensleeves Jig/` separate (jig-specific)
4. Clean up: Delete duplicate PDFs/MIDIs (keep 1-2 main ones)

### Add Metadata:
Need to add metadata to files in renamed Greensleeves folder:
- `composer = "Traditional English"`
- `style = "folk song"` (or "ballad")
- `tagline = ""`

---

## Question for You:

**Do you want to:**

**A)** Keep Jig separate, move _Greensleeves → Folk_England/Greensleeves/ (recommended)
```
Folk_England/
├── Greensleeves/         # Traditional versions (from _Greensleeves)
└── Greensleeves Jig/     # Jig arrangement (existing)
```

**B)** Merge everything into one Greensleeves folder with subfolders
```
Folk_England/Greensleeves/
├── Jig_Arrangements/
├── Traditional_Versions/
└── Guitar_Versions/
```

**C)** Something else?

**My recommendation: Option A** - Clearer organization, jig is distinct style

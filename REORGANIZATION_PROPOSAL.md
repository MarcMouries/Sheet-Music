# Marc's Sheet Music Collection - Reorganization Proposal

**Generated:** 2025-11-26
**Total Files:** 436 .ly files
**Current Issues:** Loose files, inconsistent structure, single-file folders

---

## 🎯 Organizational Philosophy

### Current Structure
The collection currently uses a **mixed approach**:
- Geographic organization for folk music (Folk_Ireland, Folk_Hungary, etc.)
- Genre organization for other music (Jazz, Classical, Pop, etc.)
- Special folders for practice materials

### Proposed Improvements
**Keep the current top-level structure** but improve consistency within categories.

---

## 🔴 Critical Issues to Fix

### 1. **Loose Files in Root Directory (2 files)**

**Files:**
- `Untitled.midi`
- `Untitled.pdf`

**Action:** DELETE these untitled files (appear to be test/temporary files)

---

### 2. **Folders with Underscore Prefix** (Indicates WIP/Temp)

#### `_Greensleeves/` (5 files)
- **Issue:** Duplicate of Folk_England/Greensleeves Jig
- **Action:** Review files, merge unique content into Folk_England/Greensleeves Jig/, DELETE folder

#### `_Mozart_RondoAllaTurca/` (4 files)
- **Issue:** WIP folder, belongs in Classical
- **Action:** MOVE to `Classical/Mozart_Rondo_Alla_Turca/`

---

### 3. **Devil's Dream** (1 file - loose in root level)
- **Issue:** Top-level folder with 1 file, no clear category
- **What is it?** Devil's Dream is a traditional American fiddle tune
- **Action:** MOVE to `Folk_USA/Devils Dream/`

---

## 📂 Recommended Folder Structure

### **Classical/** (110 files) ✅
**Status:** Well organized, keep as-is
- Organized by composer/piece
- Good for browsing classical repertoire

**Suggestions:**
- Single-file folders are OK here (each piece standalone)
- Consider grouping smaller works: `Classical/_Short Pieces/` for single-movement works

---

### **Folk_[Country]/** (66 files total) ✅
**Status:** Good geographic organization

**Current:**
- Folk_Canada (3 files)
- Folk_England (2 files)
- Folk_Finland (6 files)
- Folk_French (1 file)
- Folk_Germany (2 files - just added Muss I Denn)
- Folk_Hungary (7 files)
- Folk_Ireland (22 files) ⭐ Largest collection
- Folk_Italy (2 files)
- Folk_Jewish (7 files)
- Folk_Romania (1 files)
- Folk_Russia (2 files)
- Folk_Scotland (2 files)
- Folk_USA (7 files)

**Suggestions:**
- Keep structure
- Single-file folders: Consider merging very small collections into `Folk_Other/` or keep for future growth
- Folk_Ireland: Consider sub-organizing by style (Jigs/, Reels/, Airs/, etc.)

---

### **Practice/** (66 files) 📝
**Status:** Needs better organization

**Current subfolders:**
- MyViolin Practice/Scales/
- Various loose practice files

**Proposed Structure:**
```
Practice/
├── Scales/              # All scale exercises
├── Arpeggios/           # All arpeggio exercises
├── Etudes/              # Musical studies
├── Exercises/           # Technical exercises
├── Sight-Reading/       # Sight-reading practice
└── Marcs_Work/          # Personal practice pieces
```

**Action:** Consolidate and categorize all practice files

---

### **8-Step_Warm-Up_Plan/** (8 files) 🔥
**Status:** Good structure, keep as-is
- Organized warm-up routine
- Sequential structure makes sense
- Don't merge with Practice/

---

### **Marc's Practice Points/** (5 files) 🎯
**Status:** Keep separate
- Personal practice focuses on specific pieces
- Different purpose than general Practice/
- Keep as curated collection of challenging passages

---

### **Scales/** (107 files) ⚠️
**Status:** LARGE duplicate with Practice/Scales

**Action:**
1. Review if this is different from Practice/MyViolin Practice/Scales
2. If duplicate: MERGE into Practice/Scales/
3. If different purpose: RENAME to clarify (e.g., "Scale_Reference_Library")

---

### **Gypsy-Jazz/** (20 files) ✅
**Status:** Well organized
- Keep as-is
- Good genre-specific collection

---

### **Jazz/** (11 files) ✅
**Status:** Keep separate from Gypsy-Jazz
- Different style/era
- Keep as-is

---

### **Pop/** (9 files) 🎵
**Status:** Mixed content

**Current:**
- Happy Birthday (traditional)
- The First Noel_2 (Christmas) - **Already moved to Christmas/**
- French/ (Sous le ciel de Paris)

**Suggestions:**
- Keep Pop/French/ for French pop/chanson
- Consider Pop/American/, Pop/Holiday/ if collection grows

---

### **Christmas/** (3 files) 🎄
**Status:** Small but focused

**Content:**
- The First Noel_2/
- Let It Snow (just added)
- We Wish You a Merry Christmas files

**Action:** Keep, good for seasonal music

---

### **Soundtrack/** (9 files) 🎬
**Status:** Good organization by movie

**Current:**
- The Adventures of Pinocchio (1972)/

**Suggestion:** Good structure - organize by movie/show name

---

### **Learn Violin with Famous Themes/** (8 files) 📚
**Status:** Educational resource
- Keep as-is
- Different purpose than practice (teaching materials)

---

### **Latina/** (2 files) 💃
**Status:** Very small collection

**Action Options:**
1. Keep for future growth
2. Merge into `Folk_Latin/` if adding more Latin American music
3. Merge into `Pop/` if modern Latin pop

---

### **Harmonica/** (3 files) 🎵
**Status:** Different instrument

**Action:** Keep separate - non-violin music

---

### **Games/** (1 file) 🎮
**Status:** Unclear purpose

**Action:** Review content, likely merge into Soundtrack/ or Pop/

---

## 📋 Detailed Action Plan

### Phase 1: Clean Up (High Priority)
1. ✅ DELETE `Untitled.midi` and `Untitled.pdf`
2. Review and merge `_Greensleeves/` into Folk_England
3. Move `_Mozart_RondoAllaTurca/` to Classical
4. Move `Devil's Dream/` to Folk_USA
5. Review and consolidate `Scales/` vs `Practice/Scales`

### Phase 2: Reorganize Practice (Medium Priority)
1. Create Practice/ subfolder structure
2. Categorize all practice files by type
3. Move exercises to appropriate subfolders
4. Update any that need metadata

### Phase 3: Review Single-File Folders (Low Priority)
- Most single-file folders in Classical/ are fine (standalone pieces)
- Folk single-file folders OK (room to grow)
- Review Practice/ single-file folders for consolidation

### Phase 4: Metadata Completion (Ongoing)
- All files now have composer ✅
- All files have style ✅
- Continue adding optional metadata (difficulty, notes, etc.)

---

## 🎵 Final Recommended Top-Level Structure

```
Marc's Sheet Music Collection/
├── Classical/              # 110 files - organized by composer/work
├── Folk_[Country]/         # 66 files - organized geographically
│   ├── Folk_Ireland/      # 22 files (largest)
│   ├── Folk_Hungary/      # 7 files
│   ├── Folk_Jewish/       # 7 files
│   ├── Folk_USA/          # 7+ files (add Devil's Dream)
│   └── [other countries]
├── Gypsy-Jazz/            # 20 files - distinct style
├── Jazz/                  # 11 files - separate from Gypsy-Jazz
├── Practice/              # 66+ files - reorganize by type
│   ├── Scales/
│   ├── Arpeggios/
│   ├── Etudes/
│   └── Exercises/
├── Marc's Practice Points/ # 5 files - personal focuses
├── 8-Step_Warm-Up_Plan/   # 8 files - structured routine
├── Pop/                   # 9 files
│   └── French/           # French pop/chanson
├── Soundtrack/            # 9 files - organized by movie
├── Christmas/             # 3 files - seasonal
├── Learn Violin with Famous Themes/ # 8 files - teaching
├── Harmonica/             # 3 files - different instrument
├── Latina/                # 2 files
└── stylesheets/           # Supporting files
```

---

## 💡 Organization Principles

### What Makes a Good Folder?
1. **Clear Purpose:** Genre, geography, or function
2. **Room to Grow:** Can accommodate new files naturally
3. **Easy to Browse:** Logical grouping for finding music
4. **Consistent:** Similar types organized similarly

### When to Create vs. Merge?
- **Create new folder:** 5+ related files OR growing collection
- **Keep single-file folders:** Classical pieces, or room to grow
- **Merge folders:** Duplicates, very small collections with no growth plan

### Metadata Standards (Already Implemented) ✅
- All files have: title, composer, style, tagline
- Classical: Include composer dates
- Folk: Include geographic origin
- Practice: composer = "Marc Mouries"

---

## 🚀 Next Steps

**Immediate:**
1. Review this proposal
2. Make decisions on controversial moves
3. Execute Phase 1 cleanup

**Short-term:**
4. Execute Phase 2 (Practice reorganization)
5. Continue adding music to collection

**Ongoing:**
- Maintain metadata standards
- Keep folder structure consistent
- Add extended metadata (difficulty, notes) as needed

---

**Questions to Answer:**
1. Keep separate Scales/ folder or merge with Practice/?
2. What to do with Games/ folder?
3. Merge very small Folk collections (1-2 files) or keep for growth?
4. Create Folk_Ireland/ subfolders by tune type (Jigs, Reels, etc.)?

# Version Naming Convention

## When to Use Versions

Use version suffixes when you have multiple arrangements or variations of the same tune:

### Good Reasons for Versions:
- Different keys (e.g., D major vs G major)
- Different arrangements (solo vs duet)
- Simplified vs complete versions
- Different styles (classical vs jazz arrangement)

### Bad Reasons (Don't Create Versions):
- Work in progress (just overwrite the file)
- Temporary experiments (use a separate scratch folder)
- Backup copies (use git for version control)

## Naming Patterns

### Pattern 1: By Characteristic (Preferred)
Use descriptive suffixes that indicate the difference:

```
Tune-Name-D.ly          (in D major)
Tune-Name-G.ly          (in G major)
Tune-Name-solo.ly       (solo arrangement)
Tune-Name-duet.ly       (duet arrangement)
Tune-Name-simple.ly     (simplified version)
Tune-Name-advanced.ly   (advanced version)
Tune-Name-jazz.ly       (jazz arrangement)
Tune-Name-classical.ly  (classical arrangement)
```

**Example:**
```
Auld-Lang-Syne/
  ├── Auld-Lang-Syne-D.ly       (in D major)
  ├── Auld-Lang-Syne-D.pdf
  ├── Auld-Lang-Syne-G.ly       (in G major)
  └── Auld-Lang-Syne-G.pdf
```

### Pattern 2: By Iteration
When you have sequential improvements without other distinguishing features:

```
Tune-Name-v1.ly
Tune-Name-v2.ly
Tune-Name-v3.ly
```

**Use sparingly** - descriptive names are better!

### Pattern 3: Combined
When both characteristics and versions exist:

```
Tune-Name-solo-v1.ly
Tune-Name-solo-v2.ly
Tune-Name-duet-v1.ly
```

## File Organization

Each tune should have ONE folder, with all versions inside:

```
The-Butterfly/
  ├── TheButterfly-v1.ly
  ├── TheButterfly-v1.pdf
  ├── TheButterfly-v2.ly
  ├── TheButterfly-v2.pdf
  ├── TheButterfly-simplified.ly
  ├── TheButterfly-simplified.pdf
  └── reference.pdf (optional - original source)
```

## Metadata for Versions

Update the header to reflect the version:

### Version 1 (Original):
```lilypond
\header {
  title = "The Butterfly"
  subtitle = "Slip Jig"
  composer = "Traditional Irish"
  meter = "slip jig"
}
```

### Version 2 (Different Key):
```lilypond
\header {
  title = "The Butterfly"
  subtitle = "Slip Jig in G major"  % Note the key
  composer = "Traditional Irish"
  arranger = "Transposed to G by Marc Mouries"
  meter = "slip jig"
}
```

### Version 3 (Simplified):
```lilypond
\header {
  title = "The Butterfly"
  subtitle = "Simplified for Beginners"
  composer = "Traditional Irish"
  arranger = "Simplified by Marc Mouries"
  meter = "slip jig"
}
```

## What NOT to Do

### ❌ Bad Examples:
```
Tune-1.ly               % What's "1"? Use descriptive name
Tune-2.ly
Tune-copy.ly            % Don't use "copy"
Tune-new.ly             % Don't use "new"
Tune-old.ly             % Don't use "old"
Tune-final.ly           % Nothing is ever "final"
Tune-20241125.ly        % Don't use dates
Tune-backup.ly          % Use git, not manual backups
```

### ❌ Multiple Folders:
```
The-Butterfly/          % Don't create separate folders
The-Butterfly-v2/       % Keep all versions together
The-Butterfly-simple/
```

## Renaming Existing Files

### Current Files to Rename:

```bash
# Folk_Ireland/Up Sligo
up_sligo.ly → Up-Sligo-v1.ly
up_sligo-1.ly → Up-Sligo-v2.ly
upsligo-3.ly → Up-Sligo-v3.ly

# Folk_Ireland/DrGilbert
drGilbert_1.ly → Dr-Gilberts-Reel-v1.ly
drGilbert_1-1.ly → Dr-Gilberts-Reel-v2.ly

# Folk_Ireland/The Butterfly
TheButterfly.ly → TheButterfly-v1.ly
TheButterfly_3.ly → TheButterfly-v3.ly

# Classical/Erik_Satie_Gymnopédie
gymnopedie.ly → Gymnopedie-v1.ly
gymnopedie_v2.ly → Gymnopedie-v2.ly
```

### How to Rename:
```bash
# Navigate to folder
cd "Folk_Ireland/Up Sligo"

# Rename files
mv up_sligo.ly Up-Sligo-v1.ly
mv up_sligo-1.ly Up-Sligo-v2.ly
mv upsligo-3.ly Up-Sligo-v3.ly

# Don't forget to rename associated files
mv up_sligo.pdf Up-Sligo-v1.pdf
mv up_sligo.midi Up-Sligo-v1.midi
# etc.
```

## Index Display

The enhanced index will show versions grouped together:

**Table View:**
```
Title              Composer           Category        Files
─────────────────────────────────────────────────────────
The Butterfly v1   Traditional Irish  Folk/Ireland    📝 PDF 🎵
The Butterfly v2   Traditional Irish  Folk/Ireland    📝 PDF 🎵
The Butterfly v3   Traditional Irish  Folk/Ireland    📝 PDF 🎵
```

**Card View:**
Each version appears as a separate card with its own play button.

## When in Doubt

1. **Ask**: Is this truly a different version, or just a work in progress?
2. **Describe**: Can I describe what makes this version different?
3. **Use**: Prefer descriptive names over v1/v2/v3
4. **Keep**: All versions in ONE folder

## Examples from Your Collection

### Good Organization:
```
Folk_Scotland/Auld-Lang-Syne/
  ├── Auld-Lang-Syne_(in D).ly      ✅ Key specified
  ├── Auld-Lang-Syne_Jig.ly         ✅ Style specified
```

### Needs Improvement:
```
Classical/Erik_Satie_Gymnopédie/
  ├── gymnopedie.ly                 ❌ No version indicator
  ├── gymnopedie_v2.ly              ❌ What's the difference?
  ├── gymnopedie_1_Violin.ly        ❌ Inconsistent naming

SHOULD BE:
  ├── Gymnopedie-No1-violin.ly      ✅ Clear purpose
  ├── Gymnopedie-No1-simplified.ly  ✅ Descriptive
```

## Quick Reference

| Situation | Suffix | Example |
|-----------|--------|---------|
| Different key | `-D`, `-G`, etc. | `Tune-D.ly` |
| Solo/duet | `-solo`, `-duet` | `Tune-solo.ly` |
| Skill level | `-simple`, `-advanced` | `Tune-simple.ly` |
| Style | `-jazz`, `-classical` | `Tune-jazz.ly` |
| Instrument | `-violin`, `-flute` | `Tune-violin.ly` |
| Generic version | `-v1`, `-v2` | `Tune-v1.ly` (use last) |

---

**Remember**: The filename should tell you what makes this version unique!

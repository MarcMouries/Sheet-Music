# Failed LilyPond Files - Fix TODO List

**Total: 50 files** that failed to compile during batch preview generation.

**Common Error Pattern:** Most files fail with `warning: no such internal option: no-midi`
This indicates they're using deprecated LilyPond syntax.

---

## Christmas Songs (7 files)

- [ ] `Christmas/Carol-of-the-bells/Carol-of-the-bells_SATB.ly`
- [ ] `Christmas/Silent-Night/Silent Night Quartet/violin1_part.ly`
- [ ] `Christmas/Silent-Night/Silent Night2.ly`
- [ ] `Christmas/Silent-Night/SilentNight.ly`
- [ ] `Christmas/Silent-Night/silent_night ORIGINAL.ly`
- [ ] `Christmas/Silent-Night/silent_night.ly`

---

## Classical Music (7 files)

- [ ] `Classical/Mozart_Eine Kleine Nachtmusik/Eine Kleine Nachtmusik.ly`
- [ ] `Classical/Mozart_Rondo-Alla-Turca/KV331_3_RondoAllaTurcaNotes.ly`
- [ ] `Classical/Pachelbel_Canon-in-D/template - Duet.ly`
- [ ] `Classical/Pachelbel_Canon-in-D/canon in D - Rock Violin.ly`
- [ ] `Classical/Pachelbel_Canon-in-D/canon in D - Violin I._ NEW relative.ly`
- [ ] `Classical/Paganini_Concerto-4/Paganini-Concerto-4.ly`

---

## Folk Tunes (7 files)

- [x] `Folk_Canada/L-Air-Mignonne/L-Air-Mignonne.ly` ✓ Fixed - Added missing layout statement
- [ ] `Folk_England/Greensleeves/greensleeves (Em).ly`
- [ ] `Folk_England/Greensleeves/greensleeves_guitar.ly`
- [ ] `Folk_England/Greensleeves/greensleeves_melody.ly`
- [ ] `Folk_Jewish/Chosen-Kalle-Mazel-Tov/Chosen_Kalle_Mazel_Tov.ly`
- [ ] `Folk_Russia/Polyushko-pole/Plaine, ma plaine+Gm+Cm.ly`
- [ ] `Folk_Russia/Polyushko-pole/Plaine, ma plaine.ly`

---

## Jazz & Gypsy Jazz (5 files)

- [ ] `Gypsy-Jazz/Tchavolo-Swing/Tchavolo-Swing.ly`
- [ ] `Jazz/Misty/Misty_Piano.ly`
- [ ] `Jazz/Summertime/Summertime_Grappelli.ly`
- [ ] `Latina/Besame-Mucho/Besame_Mucho.ly`
- [ ] `Latina/Besame-Mucho/Besame_mucho_from-MuseScore.ly`

---

## Soundtracks (4 files)

- [ ] `Soundtrack/In-the-Mood-for-Love/In-the-Mood-for-Love.ly`
- [ ] `Soundtrack/Schindlers_List/Schindlers_List_Theme_Solo_Violin.ly`
- [ ] `Soundtrack/Schindlers_List/Schindlers_List_Theme_for_Strings_and_Solo_Violin.ly`
- [ ] `Wedding/Mendelssohn_Wedding-March/Mendelssohn_Wedding-March (For Organ).ly`

---

## Practice Files (10 files)

- [ ] `Practice/A-major-pentatonic-7.ly`
- [ ] `Practice/My Gypsy Jazz Practice.ly`
- [ ] `Practice/MyViolinBook/BasicScales.ly`
- [ ] `Practice/MyViolinBook/bend.ly`
- [ ] `Practice/MyViolinBook/bend test.ly`
- [ ] `Practice/MyViolinBook/myStaffAndTimeSettings.ly`
- [ ] `Practice/MyViolinBook/modes.ly`
- [ ] `Practice/MyViolinPracticeBook/Formatting-of-piece-headers.ly`
- [ ] `Practice/MyViolinPracticeBook/notes.ly`
- [ ] `Practice/MyViolinPracticeBook/ii-V-I-Lick-in-D-Em-A7-D.ly`
- [ ] `Practice/Practice_All.ly`
- [ ] `Practice/Practice_Shifts.ly`
- [ ] `Practice/Untitled.ly`

---

## Lilypond How-To / Tutorial Files (9 files)

- [ ] `Lilypond_How-to/A in thirds.ly`
- [ ] `Lilypond_How-to/HarpConcert.ly`
- [ ] `Lilypond_How-to/Untitled.ly`
- [ ] `Lilypond_How-to/circularStaff.ly`
- [ ] `Lilypond_How-to/dark-mode-sheet-music.ly`
- [ ] `Lilypond_How-to/count-in.ly`
- [ ] `Lilypond_How-to/eyeGlasses.ly`
- [ ] `Lilypond_How-to/lilyfied/snippet-map-1178644136.ly`
- [ ] `Lilypond_How-to/lilyfied/snippet-names-1178644136.ly`

---

## Fix Strategy

1. **Analyze Common Error**: Check if files use `-dno-midi` flag or deprecated syntax
2. **Update Syntax**: Remove or replace deprecated flags
3. **Test Compilation**: Compile each file to verify fixes
4. **Regenerate Previews**: Run batch preview generation on fixed files

---

## Progress

- **Total Files**: 50
- **Fixed**: 1
- **Remaining**: 49
- **Status**: In progress

### Recent Fixes

1. `Folk_Canada/L-Air-Mignonne/L-Air-Mignonne.ly` - Added missing `\layout { }` statement

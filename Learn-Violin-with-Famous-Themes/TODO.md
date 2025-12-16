# Learn Violin with Famous Themes - TODO

## Current Status
- Book compiles successfully with 13 pieces ordered by difficulty
- All pieces use conditional compilation for standalone vs. book mode
- No more header bleeding (BWV 1067, opus numbers, etc.)

## Pending Tasks

### High Priority
- [ ] Expand placeholder pieces with more complete melodies:
  - [ ] Pachelbel Canon - add more variations
  - [ ] Mozart Eine kleine Nachtmusik - complete first movement excerpt
  - [ ] Vivaldi Spring - add more of the opening theme
  - [ ] Mozart Rondo alla Turca - extend the main theme
  - [ ] Shostakovich Waltz No. 2 - complete the romantic theme
  - [ ] Bizet Toreador Song - add more of the march

### Medium Priority
- [ ] Add fingering suggestions for difficult passages
- [ ] Add practice tips/notes for each piece
- [ ] Consider adding easier arrangements of advanced pieces
- [ ] Add bowing suggestions where helpful

### Low Priority
- [ ] Add more Level 4-5 pieces for advanced students
- [ ] Consider adding famous opera excerpts
- [ ] Add QR codes linking to performance videos
- [ ] Create accompanying piano parts for selected pieces

### Future Enhancements
- [ ] Mozart: "Queen of the Night" Aria excerpt
- [ ] Albinoni: Adagio in G minor
- [ ] More Bach pieces (Air on G String, etc.)
- [ ] Tchaikovsky: excerpts from ballets
- [ ] Paganini: simplified Caprice excerpts

## Notes
- Files use `compilingBook` variable to control standalone vs. book compilation
- All \header blocks are conditionally set
- All \score blocks are conditionally included
- Main file: Learn-Violin-with-Famous-Themes.ly
- Total pieces: 13 (Level 1 through Level 4-5)

## Completed ✓
- [x] Fixed title page formatting (reduced title size from #8 to #4)
- [x] Created placeholder files for missing pieces:
  - Pachelbel: Canon in D
  - Mozart: Eine kleine Nachtmusik
  - Vivaldi: Spring from Four Seasons
  - Mozart: Rondo alla Turca
  - Shostakovich: Waltz No. 2
  - Bizet: Toreador Song
- [x] Fixed header/music mismatch issues (commented out \score blocks)
- [x] Implemented conditional compilation pattern with `compilingBook` flag
- [x] Fixed page numbering system
- [x] Fixed headers bleeding across pages (wrapped all \header blocks in conditionals)
- [x] Added Theme and Theme Duet versions for Ode to Joy

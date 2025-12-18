# NOTES LILYPOND

## Octave Notation in LilyPond

**IMPORTANT:** Understanding LilyPond's octave notation system:

- `c` = C below middle C (one octave below middle C)
- `c'` = middle C (the C in the middle of the piano keyboard)
- `c''` = C above middle C (one octave above middle C)
- `c'''` = C two octaves above middle C

### For Violin in First Position:
- Open strings: `g`, `d'`, `a'`, `e''`
- G string: `g` (open) to `c'` (4th finger)
- D string: `d'` (open) to `g'` (4th finger)
- A string: `a'` (open) to `d''` (4th finger)
- E string: `e''` (open) to `a''` (4th finger)

### For Violin in Third Position:
- D string: `g'` (1st finger) to `c''` (4th finger)
- A string: `d''` (1st finger) to `g''` (4th finger)
- E string: `a''` (1st finger) to `d'''` (4th finger)

**Example - "You Are My Sunshine":**
The melody includes `e''` which is NOT a high note on the E string, but rather:
- E on the A string, 3rd position, 2nd finger
- OR the open E string (but in context, it's played in 3rd position)
- The tune is good for learning 3rd position because it uses the comfortable pattern: `d'` (open D string), `g'` (1st finger), `a'` (2nd finger), `b'` (3rd finger) on the D string

## Setting the staff size

````bash
#(set-global-staff-size 14)
````

## Multi-lines Labels for Notes with Perfect Alignment

To create reference charts with labels (like "Note names:" and "LilyPond:") that align perfectly with lyrics under staff notes:

### The Problem
When displaying note names or notation references under staff notes, you need:
- Labels positioned on the left side
- Perfect alignment of text under notes
- Colons in labels vertically aligned
- No overlap between labels and note letters
- Proper page margins so labels are visible

### The Solution: instrumentName on Lyrics contexts

Use the `Instrument_name_engraver` on Lyrics contexts to position labels, with careful margin and spacing settings:

```lilypond
\version "2.24.0"

\paper {
  left-margin = 35\mm  % Ensure labels fit within printable area
}

melody = {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g1 d' a' e''
  \bar "|."
}

noteNames = \lyricmode {
  G D A E
}

lilypondNotation = \lyricmode {
  g d' a' "e''"
}

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
      \consists "Instrument_name_engraver"
      \override InstrumentName.X-offset = #2
      instrumentName = \markup \line {
        \pad-to-box #'(0 . 11) #'(0 . 0)
        \right-align \bold "Note names:"
      }
      shortInstrumentName = \markup \bold "Note:"
    } \lyricsto "" {
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
      \consists "Instrument_name_engraver"
      \override InstrumentName.X-offset = #2
      instrumentName = \markup \line {
        \pad-to-box #'(0 . 11) #'(0 . 0)
        \right-align \bold "LilyPond:"
      }
      shortInstrumentName = \markup \bold "Lily:"
    } \lyricsto "" {
      \lilypondNotation
    }
  >>
  \layout {
    indent = 15\mm  % Space between labels and staff
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}
```

### Key Components Explained

1. **Page margins**: `left-margin = 35\mm` provides enough space for labels within the printable area

2. **Instrument name engraver**: `\consists "Instrument_name_engraver"` adds instrument name capability to Lyrics contexts

3. **X-offset adjustment**: `\override InstrumentName.X-offset = #2` shifts labels right to stay within margins

4. **Colon alignment**: `\pad-to-box #'(0 . 11) #'(0 . 0) \right-align` creates a fixed-width box (11 units) with right-aligned text, ensuring colons line up vertically

5. **Staff indent**: `indent = 15\mm` controls horizontal space between labels and staff (not too wide, not too narrow)

6. **Automatic lyrics alignment**: `\lyricsto ""` uses LilyPond's automatic lyrics system for perfect note-to-syllable alignment

### Result
- Labels appear on the left with colons perfectly aligned
- Note letters automatically align under their staff notes
- No overlap or clipping
- Professional, clean appearance

See `Lilypond_How-to/Notes-Lilypond-Violin.ly` and `Lilypond_How-to/Notes-Lilypond-Violin-Comparison.ly` for working examples.

## Conditional Compilation - Dual-Purpose Part Files

To create part files that can be compiled standalone OR included in a full score without generating duplicate PDFs:

### In the Part Files (e.g., Violin_Part.ly, Viola_Part.ly, Bass_Part.ly)

Use conditional compilation with `ly:get-option` and `add-score`:

```lilypond
% Music definitions (always included)
melody = \relative c'' {
  % ... music ...
}

\header {
  title = "Piece Title"
  subtitle = "Violin Part"
  composer = "Composer Name"
}

\include "../../common/common-header.ily"

% Only generate score block if not included as part
#(if (not (ly:get-option 'included-as-part))
  (add-score
    #{
      \score {
        \new Staff {
          \melody
        }
        \layout { }
        \midi { }
      }
    #}))
```

### In the Full Score File

Set the option before including the part files:

```lilypond
\version "2.24.0"

% Set flag to prevent included parts from generating their own scores
#(ly:set-option 'included-as-part #t)

% Include part files (music definitions only)
\include "Violin_Part.ly"
\include "Viola_Part.ly"
\include "Bass_Part.ly"

\header {
  title = "Piece Title"
  subtitle = "Full Score"
}

% Generate the full score
\score {
  <<
    \new StaffGroup <<
      \new Staff { \clef treble \melody }
      \new Staff { \clef alto \viola }
      \new Staff { \clef bass \bass }
    >>
  >>
  \layout { }
  \midi { }
}
```

### How It Works

- When a part file is compiled standalone, `ly:get-option 'included-as-part` returns `#f` (false), so `(not #f)` is `#t` (true), and `add-score` runs to generate the PDF
- When a part file is included in the full score (after setting the option to `#t`), `ly:get-option` returns `#t`, so `(not #t)` is `#f`, and `add-score` is skipped
- The full score file sets the option, includes all parts (getting only their music definitions), then generates a single combined score

**Note:** LilyPond may show `warning: no such internal option: included-as-part` because custom options aren't officially recognized, but the mechanism still works correctly since undefined options return `#f`.

## Custom Stylesheets and Engravers

### bars-per-line-engraver

Controls the number of measures per line with repeating patterns:

```lilypond
\include "../../stylesheets/bars-per-line-engraver.ly"

\layout {
  \context {
    \Score
    \consists #(bars-per-line-engraver '(4 4 4 4 4 4 4 4 4 6))
  }
}
```

The list `'(4 4 4 4 4 4 4 4 4 6)` specifies 4 bars per line for the first 9 lines, then 6 bars on the last line. Forces line breaks at specified bar counts.

### twoByTwoBeaming

Custom beaming pattern that groups eighth notes in pairs (♪♪ ♪♪) instead of groups of four:

```lilypond
\include "../../stylesheets/twoByTwoBeaming.ly"

\layout {
  \context {
    \Voice
    \twoByTwoBeaming
  }
}
```

### fingering-slide-engraver

For violin music - attaches glissandi to fingering numbers instead of note heads:

```lilypond
\include "../../stylesheets/fingering-slide-engraver.ly"
```

## Common Headers and Metadata

### Standard Header Fields

Use consistent metadata fields across all scores:

```lilypond
\header {
  title = "Title"
  subtitle = "Optional subtitle"
  composer = "Composer Name"
  country = "Country Name"        % Geographic origin
  genre = "Folk"                  % Primary category (Folk, Classical, Jazz, Soundtrack)
  subgenre = "Irish"              % Sub-category (optional)
  style = "jig"                   % Musical style (optional: jig, reel, waltz, czardas)
  arranger = "Name"               % When applicable
  transcriber = "Name"            % When applicable
}

\include "../../common/common-header.ily"
```

The `common-header.ily` file sets up consistent formatting, removes the default LilyPond tagline, and provides custom title markup.

## Layout Customizations

### Grace Notes

Customize grace note appearance for a lighter look:

```lilypond
#(define (add-grace-property context property val)
  (let ((where (ly:context-property-where-defined context 'graceSettings)))
    (ly:context-set-property! where 'graceSettings
      (cons (list 'Voice property val)
        (ly:context-property where 'graceSettings)))))

$(add-grace-property 'Voice 'NoteHead 'font-size '-6)
$(add-grace-property 'Voice 'Slur 'height-limit '0.5)
$(add-grace-property 'Voice 'Flag 'font-size '-5)
$(add-grace-property 'Voice 'Stem 'length '4)
$(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
```

### Custom Beaming in 3/4 Time

Disable automatic beaming and set explicit beat structure:

```lilypond
\layout {
  \context {
    \Score
    \set beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/4)
    \set Timing.beatStructure = 1,1,1
  }
}
```

### Spacing and Indentation

```lilypond
\paper {
  indent = 10 \mm

  % Spacing between title and music
  markup-system-spacing.basic-distance = #16
  markup-system-spacing.padding = #2

  % Vertical spacing between systems
  system-system-spacing = #'((basic-distance . 16)
                             (minimum-distance . 12)
                             (padding . 1)
                             (stretchability . 60))
}

\layout {
  \override LyricText.font-size = #-2
}
```

### Rehearsal Marks Positioning

Align rehearsal marks with key signatures:

```lilypond
\layout {
  \context {
    \Score
    % Align marks with the key signature at system starts
    \override RehearsalMark.break-align-symbols = #'(key-signature)
    \override RehearsalMark.self-alignment-X = #LEFT
    \override RehearsalMark.X-offset = #4
    \override RehearsalMark.Y-offset = #-2
  }
}
```

Use box marks for sections:

```lilypond
\mark \markup \box "A"
\mark \markup \box "B"
\mark \markup \box "C"
```

## Transposition Techniques

### Creating Multiple Keys in One File

Generate scores in different keys from the same music definitions:

```lilypond
melody = \relative c'' {
  % ... music in original key ...
}

chordNames = \chordmode {
  % ... chords in original key ...
}

% Original key (G major)
\score {
  <<
    \new ChordNames { \chordNames }
    \new Staff { \melody }
  >>
}

% Transposed to A major
\score {
  <<
    \new ChordNames { \transpose g a \chordNames }
    \new Staff { \transpose g a \melody }
  >>
}

% Transposed to Bb major
\score {
  <<
    \new ChordNames { \transpose g bf \chordNames }
    \new Staff { \transpose g bf \melody }
  >>
}
```

Common transpositions:
- `\transpose c d` (C to D - up a major second)
- `\transpose g a` (G to A - up a major second)
- `\transpose g bf` (G to Bb - up a minor third)
- `\transpose g d` (G to D - up a fifth)

## MIDI Settings

### Basic MIDI Configuration

```lilypond
\midi {
  \tempo 4 = 120      % Quarter note = 120 BPM
  \tempo 4. = 120     % Dotted quarter (for compound meters)
}
```

### Setting MIDI Instruments

```lilypond
\new Staff \with {
  midiInstrument = "violin"
} {
  % ... music ...
}
```

Common instruments: "violin", "viola", "cello", "french horn", "acoustic bass"

## Chord Notation

### ChordNames with Change Detection

Only show chord symbols when they change:

```lilypond
chordNames = \chordmode {
  \global
  a1:m   a1:m    c1    c1
  e2.:m  d2.:m   c2.   b2.:m
}

\new ChordNames \with {
  chordChanges = ##t    % Only show when chords change
} {
  \chordNames
}
```

Common chord types:
- Major: `d`, `g`, `c`
- Minor: `a:m`, `e:m`, `b:m`
- Seventh: `a:7`, `d:7`, `e:7`
- Major seventh: `c:maj7`

## Repeat Structures

### Basic Volta Repeat

```lilypond
\repeat volta 2 {
  % music that repeats
}
```

### Repeat with Alternative Endings

```lilypond
\repeat volta 2 {
  % music that repeats
}
\alternative {
  { % first ending }
  { % second ending }
}
```

### Pickup Measures

Start with a partial measure:

```lilypond
\partial 8 g16 a    % Pickup of two sixteenth notes
\partial 4          % Pickup of one quarter note
```

## Useful Includes

### Essential Includes for Violin Music

```lilypond
\include "../../common/includes.ly"           % Sets English language, includes engravers
\include "../../common/violin-functions.ly"   % Violin-specific functions (slide, harmonicPitch, etc.)
\include "../../stylesheets/twoByTwoBeaming.ly"
\include "../../stylesheets/bars-per-line-engraver.ly"
```

### Stylesheets for Different Styles

```lilypond
\include "../../stylesheets/stylesheet_fiddle.ly"   % Optimized for folk/fiddle music
\include "../../stylesheets/LilyJAZZ.ily"           % Jazz font style
```

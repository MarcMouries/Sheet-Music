# NOTES LILYPOND

## Setting the staff size

````bash
#(set-global-staff-size 14)
````

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

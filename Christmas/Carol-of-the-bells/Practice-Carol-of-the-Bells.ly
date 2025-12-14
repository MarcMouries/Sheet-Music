\version "2.24.4"
\language "english"

\header {
  title = "Practice Carol of the Bells"
}


% ------------
% CUSTOM FUNCTIONS
% ------------

% bracketWithLabel - Wraps a music fragment with a horizontal analysis bracket
%
% Usage: \bracketWithLabel <markup> { <music> }
%
% Description:
%   Creates a horizontal bracket above a music fragment with a custom text label.
%   The bracket spans from the first note to the last note of the music expression.
%   Requires the Horizontal_bracket_engraver to be added to the Voice context.
%
% Parameters:
%   label - A markup expression for the bracket label (e.g., \markup \italic "text")
%   mus   - A music expression containing the notes to bracket
%
% Example:
%   \bracketWithLabel \markup \italic "E natural minor" { e fs g a b c d e }
%
% Setup required in \layout block:
%   \context {
%     \Voice
%     \consists "Horizontal_bracket_engraver"
%     \override HorizontalBracket.direction = #UP
%   }
%
bracketWithLabel =
#(define-music-function (label mus) (markup? ly:music?)
   (let* ((elts (ly:music-property mus 'elements))
          (first-note (car elts))
          (last-note (last elts)))
     (ly:music-set-property! first-note 'articulations
       (cons (make-music 'NoteGroupingEvent 'span-direction -1)
             (ly:music-property first-note 'articulations)))
     (ly:music-set-property! last-note 'articulations
       (cons (make-music 'NoteGroupingEvent 'span-direction 1)
             (ly:music-property last-note 'articulations)))
     #{
       \once \override HorizontalBracketText.text = #label
       #mus
     #}))



% SCALES -----

naturalMinor     = { e fs g a b c d e   }
harmonicMinor    = { e fs g a b c ds e  }
melodicMinorAsc  = { e fs g a b cs ds e }


% GLYPHS -----

flatGlyph = \markup \musicglyph "accidentals.flat" % ♭

flatGlyphSmall   = \markup \fontsize #-1 \musicglyph "accidentals.flat"


%minorIII = \markup \concat { \flatGlyph "3" }
%minorVI  = \markup \concat { \flatGlyph "6" }
%minorVII = \markup \concat { \flatGlyph "7" }


minorIII         = \markup \concat { \flatGlyphSmall "3" }
minorVI          = \markup \concat { \flatGlyphSmall "6" }
minorVII         = \markup \concat { \flatGlyphSmall "7" }


% -------------

\layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
    \override HorizontalBracket.direction = #UP
    % Optional styling:
    %       \override HorizontalBracket.thickness = #1.2
    %       \override HorizontalBracketText.font-size = 0
  }
  \context {
    \Lyrics
    \override LyricText.font-size = -1
  }
}


global = {
  \time 3/4
  \key e \minor
  \tempo 4=100
}

melody =
\relative c' {
  \global
  b8( cs ds e fs g
  a b c d e fs ))
  \stemDown
  g( fs e d c b a
  g fs e ds cs )

}


\score {
  \new Staff { \melody }
  \layout { }
  \midi { }
}

\markup \bold \larger "Run in E minor: mixed forms"

\score {
  \layout {
    \context {
      \Voice
      \consists "Horizontal_bracket_engraver"
      \override HorizontalBracket.direction = #UP
    }
  }

  \new Staff {
    \relative b {
      \key e \minor
      \time 3/4

      % First section: bracket + label
      b8 -\tweak HorizontalBracketText.text \markup \italic "melodic minor"
      \startGroup ( cs ds e fs g ) \stopGroup

      % Second section: bracket + label
      a8 -\tweak HorizontalBracketText.text \markup \italic "natural minor"
      \startGroup
      ( b c d e fs )
      \stopGroup
    }
  }
}


\markup  \vspace #0.5

% --- Explanatory text with correct italics ---
\markup {
  \column {

    \line { \bold "Explanation" }
    \line {
      "The first segment (B–C♯–D♯–E–F♯–G) uses "
      \italic "E melodic minor"
      " tones (raised 6th and 7th)."
    }
    \line {
      "The continuation (A–B–C–D–E–F♯) returns to "
      \italic "E natural minor"
      " color with C and D naturals."
    }
    \line { "Mixing minor forms within one run is common for voice-leading and color." }
  }
}




\markup {
  \column {
    \vspace #0.5
    \line { \bold "1. E Minor as a Base Key" }
    \line { "The natural E minor scale is:" }
    \line { \italic "E – F♯ – G – A – B – C – D – (E)" }
    \line { "No C♯ or D♯ here—those are accidentals." }
  }
}

\score {
  <<
    \new Staff {
      \new Voice = "scaleNat" {
        \relative e' {
          \key e \minor
          \time 4/4
          % Analysis bracket spanning the whole scale (label above)
          e4-\tweak HorizontalBracketText.text \markup \italic "E natural minor"
          \startGroup
          fs g a b c d e \stopGroup
        }
      }
    }


    % Degree labels under the notes
    \new Lyrics \lyricsto "scaleNat" {
      "1" "2" \minorIII "4" "5" \minorVI \minorVII "1"

    }
  >>
  \layout {
    \context {
      \Voice
      \consists "Horizontal_bracket_engraver"
      \override HorizontalBracket.direction = #UP
    }
  }

}


\markup {
  \column {
    \vspace #0.5
    \line { \bold "2. Harmonic Minor Influence" }
    \line { "In E harmonic minor, the 7th degree is raised:" }
    \line { \italic "E – F♯ – G – A – B – C – D♯ – (E)" }
    \line { "That explains the D♯ you see—it creates a strong leading tone to E." }
  }
}

\score {
  <<
    \new Staff {
      \new Voice = "scaleHarm" {
        \relative e' {
          \key e \minor
          \time 4/4
          e4-\tweak HorizontalBracketText.text \markup \italic "E harmonic minor (raised 7th)"
          \startGroup
          fs g a b c ds e \stopGroup
        }
      }
    }
    \new Lyrics \lyricsto "scaleHarm" {
      "1" "2" \minorIII "4" "5" \minorVI "7" "1 "
    }
  >>
  \layout {
    \context {
      \Voice
      \consists "Horizontal_bracket_engraver"
      \override HorizontalBracket.direction = #UP
    }
  }

}

\markup {
  \column {
    \vspace #0.5
    \line { \bold "3. Melodic Minor Influence" }
    \line { "In E melodic minor (ascending), both the 6th and 7th are raised:" }
    \line { \italic "E – F♯ – G – A – B – C♯ – D♯ – (E)" }
    \line { "This explains C♯ and D♯ together in your run. Composers often use this for smoother melodic motion." }
  }
}

\score {
  \layout {
    \context {
      \Voice
      \consists "Horizontal_bracket_engraver"
      \override HorizontalBracket.direction = #UP
    }
  }

  \header {
    title = "E Melodic Minor (ascending)"
    subtitle = "Degrees: 1 2 ♭3 4 5 6 7 1"
  }

  <<
    \new Staff {
      \new Voice = "scaleMelAsc" {
        \relative e' {
          \key e \minor
          \time 4/4
          e4-\tweak HorizontalBracketText.text \markup \italic "E melodic minor (ascending)"
          \startGroup
          fs g a b cs ds e \stopGroup
        }
      }
    }

    \new Lyrics \lyricsto "scaleMelAsc" {
      "1" "2" \minorIII "4" "5" "6" "7" "1"
    }
  >>
}

\markup {
  \column {
    \vspace #0.5
    \line { \bold "4. Chromaticism and Voice Leading" }
    \line { "Sometimes accidentals are added for color or to connect notes smoothly (chromatic passing tones)." }
    \line { "For example, going from B to D♯ via C♯ creates a nice stepwise motion." }
    \line { "Runs often mix natural, harmonic, and melodic minor forms for expressive effect—it’s a stylistic choice to add tension and resolution." }
  }
}


\markup \large \bold "TEST: bracketWithLabel"

\score {
  \layout {
    \context {
      \Voice
      \consists "Horizontal_bracket_engraver"
      \override HorizontalBracket.direction = #UP
    }
    \context {
      \Lyrics
      \override LyricText.font-size = -1
    }
  }

  <<
    \new Staff {
      \new Voice = "scaleNat" {
        \relative e' {
          \key e \minor
          \time 4/4
          % Analysis bracket over the entire natural minor scale
          \bracketWithLabel \markup \italic "E natural minor" { \naturalMinor }
        }
      }
    }
    \new Lyrics \lyricsto "scaleNat" {
      "1" "2" \minorIII "4" "5" \minorVI \minorVII "1"
    }
  >>
}
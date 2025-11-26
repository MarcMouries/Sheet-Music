
\version "2.19.28"
% automatically converted by musicxml2ly from /Users/Marc/OneDrive/sheet_Music_Violin/Violin Solo fm Sheherazade_Rimsky-Korsakov.xml

\header {
  encodingsoftware = "MuseScore 2.0.1"
  encodingdate = "2015-10-24"
  style = "classical"
}

#(set-global-staff-size 20.0762645669)
\paper {
  paper-width = 21.0\cm
  paper-height = 29.7\cm
  top-margin = 1.0\cm
  bottom-margin = 2.0\cm
  left-margin = 1.0\cm
  right-margin = 1.0\cm
}
PartPOneVoiceOne =  \relative e''' {
  \clef "treble" \key g \major \numericTimeSignature\time 4/4 | % 1
  e2 ^\markup{ \bold {Lento} } ( e8*2/3 ) \once \override
  TupletBracket #'stencil = ##f
  \times 2/3  {
    d32.*53/60 e32.*53/60 d32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    c32.*53/60 d32.*53/60 c32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    b32.*53/60 ( c32.*53/60 ) b32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    a32.*53/60 c32.*53/60 e32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    g32.*53/60 fis32.*53/60 d32.*53/60
  }
  s1*1/1920 \break | % 2
  e4 ( e8*2/3 ) \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    d32.*53/60 e32.*53/60 d32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    c32.*53/60 d32.*53/60 c32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    b32.*53/60 ( c32.*53/60 ) b32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    a32.*53/60 c32.*53/60 e32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    g32.*53/60 fis32.*53/60 e32.*53/60
  }
  s1*1/1920 e4 ( | % 3
  e8*2/3 ) \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    a,,32.*53/60 ( c32.*53/60 ) e32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    g32.*53/60 fis32.*53/60 e32.*53/60
  }
  s1*1/1920 e8*2/3 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    a,,32.*53/60 ( c32.*53/60 ) e32.*53/60
  }
  s1*1/1920 \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    g32.*53/60 fis32.*53/60 e32.*53/60
  }
  s1*1/1920 e2 \break | % 4
  \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    a,16 ^\markup{ \bold {Cadenza} } ( c16 ) e16
  }
  \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    g16 fis16 e16
  }
  \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    a16 ( c16 ) e16
  }
  \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    g16 fis16 e16
  }
  \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    a8 ( c8 ) e8
  }
  \once \override TupletBracket #'stencil = ##f
  \times 2/3  {
    g8 fis8. ^\markup{ \bold {Lentissimo} } ( e16 )
  }
  | % 5
  \time 6/4  | % 5
  e2 ^\markup{ \bold {Allegro} } r2 r2 \bar "|."
}


% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = "Violin"
      \set Staff.shortInstrumentName = "Vln."
      \context Staff <<
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
      >>
    >>

  >>
  \layout {}
  \midi {}
}


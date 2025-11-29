\version "2.24.4"
\language "english"

\paper {
  % Add space for instrument names
  indent = 10\mm
  short-indent = 10\mm
}

global = {
  \key c \major
  \time 4/4
}

violin = \relative c'' {
  \global
  % Music follows here.
    a'4 d8. d16 a8 a4 g8

}

contrabass = \relative c, {
  \global
  % Music follows here.
   d4 a d4 a d4 a d4 a d4 a 
}

right = \relative c'' {
  \global
  % Music follows here.
  a a a a a
}

leftSynthPad = \relative c' {
  \global
  % Music follows here.
   d4 a d4 a d4 a d4 a d4 a 
}

leftSynthBass = \relative c' {
  \global
  % Music follows here.
  a a a a a
}

violinPart = \new Staff \with {
  instrumentName = "Vl."
  shortInstrumentName = "Vl."
  midiInstrument = "violin"
} \violin

contrabassPart = \new Staff \with {
  instrumentName = "Cb."
  shortInstrumentName = "Cb."
  midiInstrument = "contrabass"
} { \clef bass \transposition c \transpose c c' \contrabass }

synthPadPart = \new PianoStaff \with {
  instrumentName = "Syn.Pad"
  shortInstrumentName = "Syn.Pad"
} <<
  \new Staff = "right" \with {
    midiInstrument = "pad 2 (warm)"
  } \right
  \new Staff = "left" \with {
    midiInstrument = "pad 2 (warm)"
  } { \clef bass \leftSynthPad }
>>

synthBassPart = \new PianoStaff \with {
  instrumentName = "Syn.Bass"
  shortInstrumentName = "Syn.Bass"
} <<
  \new Staff = "left" \with {
    midiInstrument = "synth bass 1"
  } { \clef bass \leftSynthBass }
>>

\score {
  <<
    \violinPart
    \contrabassPart

  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}

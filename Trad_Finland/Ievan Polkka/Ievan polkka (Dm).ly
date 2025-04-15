\version "2.14.0"
\language "english"
%% 
#(set-global-staff-size 22)
\layout {
    indent = 0\in
}

\header {
    title = "Ievan polkka"
    composer = "Trad. Finish Folk Song"
  }

global = {
  \tempo 4 = 120
  \time 2/4
  \key d \minor
  \numericTimeSignature
}

melody = \relative c'' {
  \set Staff.midiInstrument = #"acoustic grand"

  \global
  \repeat volta 2 {
    a8 d d e 
    f  d d f  
  }
  \alternative {
    {e8 c c  e 
     f8 d d4   }
    {a'8 g f  e 
     f8 d d4   }
  }
\break
  \repeat volta 2 {
   | a'8 a g f 
   | e8 c c e 
   | g8 g f e
  }
  \alternative {
    {f8 d d f}
    {f8 d d4}
  }
\break
  \repeat volta 2 {
    | d8. d16 d8 e  |  f d d f  
    | e   c c e     |  f16 e d c d8 a
    | d8. d16 d8 e  |  f8 d d4 
    | g8  f16 g f8 e|  f8 d d4 
  }
\break
  \repeat volta 2 {
    | a'8. f16 f8 a |  g8 e e f
    | g8 f16 g f8 e |  d8 e f g
    | a8. f16 f8 a  |  g8 e e f
    | g8 f16 g f8 e |  f8 d d4 
  }
}



harmonies = \chordmode {
  \global 
  d2:m 
}

text = \lyricmode {
 
}

\score {
  <<
    \new ChordNames { \harmonies }
%    \new FretBoards { \harmonies }
    \new Staff  {  \context Voice = "vocal" { \melody } }
%    \new Lyrics \lyricsto "vocal" \text
  >>
   \layout{}
   \midi { }

}

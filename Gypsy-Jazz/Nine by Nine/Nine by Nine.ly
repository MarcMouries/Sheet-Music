\language "english"
\version "2.19.13"
\header {
  title = "Nine by Nine"
  composer = "N. Picket"
  country = "France"
  style = "gypsy jazz"
  tagline = ""
}
global = {
}
melody = \relative c'' {
    \mark \default

\repeat volta 2 {
  <g b>4  r <fs b>4 r8   <e b'>8
  ~q4  r4 r4 r8 <e d'>8
  ~q4  b'8. a16 g8. e16 g8. <e b'>16~
   <e b'>4 r4 r4  r8 <e d'>8~
\break
  d'4   b8. a16 g8. e16 g8 <e b'>8~
  <e b'>4 r8
  d'8 ~ d8. b16 c8 <e, b'>8 ~ q4
  r8 g8 ~ g8. e16 fs8 e ~
  e4 r r2
\break
}
\alternative {
  {r1}
  {r4 r8 e'8 fs g4  a8~}
}

  a4 r4 r2
  r8 a8 \tuplet 3/2 {  g8  fs d }
  fs8. g16 fs8. d16 b8. b16 r4 r2
\break
  r4 r8 e8 fs g4  a8~
  a4 r4 r2
  r8 a8 \tuplet 3/2 {  g8  fs d }
  e8. fs16 e8. d16 b8. b16 r4 r2
\break
r2 r4 r8 g8~
  <g b>4  r <fs b>4 r8   <e b'>8
  r1
  r1
}
chordNames = \chordmode {
  %\global
  g2 b2 e1:m e1:m7

}

words = \lyricmode {
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff {
        \time 4/4
  \key e \minor
  \tempo 4=100
      \melody }
  >>
  \layout {
    indent = 0
  }
  \midi { }
}

\score {
  <<
    \new RhythmicStaff
    \with {
      \override VerticalAxisGroup.default-staff-staff-spacing = #'()
    }
    {
      \repeat unfold 8 { s8^1 s^"+" s^2 s^"+" s^3 s^"+" s^4 s^"+" }
    }
    \new Staff
    \relative c' {
      \numericTimeSignature
      \set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
      \melody
    }
  >>
  \layout {
    indent = 0
    \context {
      \RhythmicStaff
      \remove "Time_signature_engraver"
      \remove "Clef_engraver"
      \override BarLine.transparent = ##t
      \override StaffSymbol.line-count = #0
    }
  }
}
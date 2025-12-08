\version "2.13.9"
\include "english.ly"
#(ly:set-option 'point-and-click #f)
#(set-default-paper-size "letter")

\header {
  title = "I Saw Three Ships"
  composer = "Traditional English"
  country = "England"
  style = "christmas carol"
}

\include "../../common/common-header.ily"
harmonies = \chordmode {
  s8 | f4. c/f | f c/f |
  f2. | c/f | f4. c/f |
  f4. c/f | f2. | c4./f f4 r8 |
}
melody = \relative c' {
  \key f \major \time 6/8
  \new Voice = "repeat" \repeat volta 1 {
    \partial 8 c8 | <f a,>4 <f a,>8 <g c,>4 <a f>8 | <c a>4 <a f>8 <g c,>4 <bf g>8 | \break
    <a f>4 <f a,>8 <f a,>4 <a f>8 | <g c,>4 <e c>8 c4 c8 | <f a,>4 <f a,>8 <g c,>4 <a f>8 | \break
    <c a>4 <a f>8 <g c,>4 <b g>8 | <a f>4 <f a,>8 <f a,>8 <g c,> <a f> | <g c,>4. <f a,>4 r8 |
  }
}
lyrics_A = \lyricmode {
  I saw three ships come sail -- ing in On
  Christ -- mas Day, on Christ -- mas Day, I saw three ships come
  sail -- ing in On Christ -- mas Day in the morning -- ing.
}
lyrics_B = \lyricmode {
  And what was in those ships all three On
  Christ -- mas Day, on Christ -- mas Day? And what was in those
  ships all three On Christ -- mas Day in the morning -- ing?
}
lyrics_C = \lyricmode {
  The Vir -- gin Mary and Christ were there On
  Christ -- mas Day, on Christ -- mas Day, The Vir -- gin Mary and
  Christ were there On Christ -- mas Day in the morning -- ing.
}

  
  
\score {
  <<
    \new ChordNames \harmonies
    \new Staff { \melody }
    \addlyrics { \lyrics_A }
    \addlyrics { \lyrics_B }
    \addlyrics { \lyrics_C }
  >>
  \layout { }
  \midi { \tempo 8 = 100}
}

  
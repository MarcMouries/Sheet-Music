\version "2.12.3"
\language "english"

\include "Let_It_Snow_music.ily"

\header {
  title = "Let It Snow, Let It Snow, Let It Snow!"
  subtitle = "Key: F major"
  composer = "Jule Styne"
  country = "USA"
  poet = "Sammy Cahn"
  genre = "Christmas"
}

\include "../../common/common-header.ily"

\paper {
  #(set-paper-size "letter")
}


targetKey = c

\score {
  <<
    \new Voice = "eins" {
      \transpose c \targetKey \Melodie
    }
    \new Lyrics \lyricsto "eins" \Text
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}

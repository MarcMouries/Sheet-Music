\version "2.24.0"
\include "english.ly"

\include "Carol-of-the-bells_Violin_music.ily"

\header {
  title = "Carol of the Bells"
  subtitle = "Shchedryk (Щедрик)"
  composer = "Mykola Leontovych (1877–1921)"
  poet = "Peter J. Wilhousky"
  country = "Ukraine"
  genre = "Christmas"
}

\include "../../common/common-header.ily"




targetKey = e

\score {
  \new Staff {
    \transpose g \targetKey \sopMusic
  }
  \layout { }
}

\score {
  \unfoldRepeats \transpose g \targetKey \sopMusic
  \midi { \tempo 4 = 184 }
}
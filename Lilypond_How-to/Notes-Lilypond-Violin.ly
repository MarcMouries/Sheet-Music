\version "2.24.0"

\header {
  title = "Lilypond & Violin"
}

\paper {
  left-margin = 20\mm
  bookTitleMarkup = \markup {
    \fill-line {
      %\override #'(font-name . "Georgia Bold")
      %\override #'(font-name . "Palatino Bold")
      \override #'(font-name . "Optima Bold")
      
      
      
      \override #'(font-size . 6)
      \fromproperty #'header:title
    }
  }
}

melody = {
  g1 d' a' e''
}

noteNames = \lyricmode { G D A E }

lilypondNotation = \lyricmode { g d' a' "e''" }

\markup \vspace #1
\markup {
  \override #'(font-name . "Optima")
  \override #'(font-size . 2)
  "Open Strings - First Position"
}


\score {
  <<
    \new Staff { \melody }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #LEFT
      \override LyricText.font-name = "Optima"
      \override LyricText.font-size = 0
      \override InstrumentName.X-offset = #2
      instrumentName = \markup \line { \pad-to-box #'(0 . 11) #'(0 . 0) \right-align \override #'(font-name . "Optima Bold") "Note names:" }
    } \lyricsto "" { \noteNames }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #LEFT
      \override LyricText.font-size = 0
      \consists "Instrument_name_engraver"
      \override InstrumentName.X-offset = #2
      instrumentName = \markup \line { \pad-to-box #'(0 . 11) #'(0 . 0) \right-align \override #'(font-name . "Optima Bold") "LilyPond:" }
    } \lyricsto "" { \lilypondNotation }
  >>
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

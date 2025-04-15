\version "2.24.4"
\language "english"

\header {
  title = "Harmonica Note Chart"
  instrument = "Harmonica in Bb"
}

\markup { \bold "Entering notes with Lyrics" => "Looks good but numbering is separate from the notes so it's not easy note entry" }
melody_only = \relative c' {
  c4 ef f g bf c
}

fingering = \lyricmode {  "4" "-5" "6" "-6" "7" "-8" }
\score {
  <<
    \new Staff { \melody_only }
    \addlyrics { \fingering }
  >>
}


\markup { \bold "Entering notes with Fingering" => "Looks good not great" }
melody_with_finger = \relative c' {
    c4 \finger "-4" ef \finger "-5"  f\finger"6" g\finger"-6" bf\finger"7" c\finger"-8"
}
\new Staff {
  \override Fingering.staff-padding = 1.0
  \override Fingering.font-encoding = #'latin1
  \override Fingering.font-size = #-2
  \melody_with_finger
}


\markup { \bold "Entering notes with TextScripts" => "Looks good and easier to enter" }

melody_with_text = \relative c' {
  c4^"-4" ef^"-5" f^"6" g^"-6" bf^"7" c^"-8"
}
\new Staff {
  \override TextScript.staff-padding = 1.0
  \melody_with_text
}


\version "2.24.0"
\language "english"

date = #(strftime "%B, %d %Y" (localtime (current-time)))

\header { 
  title = "Summertime" 
  subtitle = "S. Grappelli"
  subsubtitle = "Album Stephane Grappelli, Bill Coleman"
  % from this video https://www.youtube.com/watch?v=9Y4d8DXF83M


  composer = "G. Gershwin"
  tagline = ##f     % Remove default LilyPond tagline
  poet =  "Transcribed by Marc Mouries"
  tagline = \markup 
  \column {
      "(cc)(by)(sa) me Rights Reserved."
     \with-url "https://www.youtube.com/watch?v=mNejZlpOpAU" { "Youtube Video Gypsy Jazz Violin Lessons - Minor Swing" }
     \line {  $(format "Typeset with LilyPond ~a. ," (lilypond-version))  \date  } 
  } 
} 

\markup \vspace #1
\markup { "=> Add Chords"}
\markup { "=> Add Swing Tempo"}
\markup \vspace #1
#(set-global-staff-size 21)
\layout {
    indent = 0\in
}

\paper {
  #(set-paper-size "letter")
}

global = {
  \key a \minor
  \time 4/4
  \tempo 4=120
}

violin = \relative c' {
  \global
  \partial 8
  b16 b16 
  \grace g' \glissando b8 g8 b8 b8 ~ b2 
  a8 g a g \grace a (\glissando bf)  a 
  g g e e e c b4
  r4 r4 r4 r4 r4 
}

\score {
  \violin
  \midi { 
     \set Staff.midiInstrument = #"violin" 
  }
\layout {
    \context {
      \Score
      \override Glissando.minimum-length = #4
      \override Glissando.springs-and-rods =  #ly:spanner::set-spacing-rods
    }
  }
}
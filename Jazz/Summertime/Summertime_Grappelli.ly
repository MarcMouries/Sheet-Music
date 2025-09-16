\version "2.19"
\language "english"

date = #(strftime "%B, %d %Y" (localtime (current-time)))

\header { 
  title = "Summertime" 
  subtitle = "S. Grappelli"
  subsubtitle = "Album Stephane Grappelli, Bill Coleman"

  composer = "Gershwin" 
  tagline = ##f     % Remove default LilyPond tagline
    poet =  "Transcribed by Marc & Maxence Mouries"
  tagline = \markup 
  \column {
    {
      "(cc)(by)(sa) me Rights Reserved."
     \with-url #"https://www.youtube.com/watch?v=mNejZlpOpAU"
     { "Youtube Video Gypsy Jazz Violin Lessons - Minor Swing" }}
    { \line {  $(format "Typeset with LilyPond ~a. ," (lilypond-version))
               \date  } 
    }
  } 
} 

\markup \vspace #1
\markup { "- Add Swing Tempo"}
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
  b16 b 
  \grace g' \glissando b4 g bf(\glissando b) a g a b a g
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
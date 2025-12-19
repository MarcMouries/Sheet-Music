\version "2.24.0"
\language "english"
\include "../../common/twoByTwoBeaming.ly"

date = #(strftime "%B, %d %Y" (localtime (current-time)))

\header { 
  title = "Summertime" 
  subtitle = "S. Grappelli"
  subsubtitle = "Album Stephane Grappelli, Bill Coleman"
  % from this video https://www.youtube.com/watch?v=9Y4d8DXF83M


  composer = "G. Gershwin"
  country = "USA"
    genre = "Jazz"     % Remove default LilyPond tagline
  poet =  "Transcribed by Marc Mouries"
  tagline = \markup 
  \column {
      "(cc)(by)(sa) me Rights Reserved."
     \with-url "https://www.youtube.com/watch?v=mNejZlpOpAU" { "Youtube Video Gypsy Jazz Violin Lessons - Minor Swing" }

\include "../../common/common-header.ily"
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
  %\key bf \minor
  \time 4/4
  \tempo 4=120
}

chordNames = \chordmode {
 
e1:m  
s1 s1 
e2:m  d2:m 
e1:m 

}


violin = \relative c' {
  \global
  r4 r8 b16 b16 
  \grace g' \glissando b8 g!8 
 
  b8 b8 ~ b2 r2
  a8 g a g \grace a (\glissando bf)  a!8 ~ a4
  g8 e8 e e \tuplet 3/4 {ds8 d c} \tuplet 3/4 {c8 b b~}  
  b4
  
  r4 r4 r4 r4 r4 
  
  r1 r1 r1 r1
  r1 r1 r1 r1
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff \violin
  >>
  \layout {
    indent=0
    \context {
      \Voice
      \twoByTwoBeaming
    }
    \context {
      \Score
         \override Glissando.minimum-length = #4
         \override Glissando.springs-and-rods =  #ly:spanner::set-spacing-rods
         %use the line below to insist on your layout
         %\override NonMusicalPaperColumn.line-break-permission = ##f
         %\consists #(bars-per-line-engraver '(4 ))
    }
  }
  \midi { }
}
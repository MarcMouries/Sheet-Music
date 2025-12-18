\version "2.24.0"
\language "english"
\header {
  title = "The Wellerman"
  composer = "Traditional"
  country = "New Zealand"
  style = "sea shanty"
  session = "https://thesession.org/tunes/20383#setting40372"
}

\include "../../common/common-header.ily"
\layout {
  indent = 10\mm
}

chordNames = {}

words = \lyricmode {
There once was a ship that put to sea, 
The name of the ship was the Bil -- ly O' Tea
The winds blew hard, 
her bow dipped down, 
Oh, blow, my bul -- ly boys, blow

Soon may the Wel -- ler -- man come 
To bring us su -- gar and tea and rum.
One day when the ton -- guing is done, we'll take our leave and Go. 

She
}

melody =  \relative c'' {

  \time 2/4 
  \key 
  c \minor
  \partial 8 g8    
  \repeat volta 2 {
    
    c,8    c16   c16     ef8    g8    
    g8    g8    g8  g8        af8    
    f16    f16     f8    af16 af  c16 c   \autoBeamOff g8    g8  \autoBeamOn
    c,8    
    \break
    c8    c8    c8    ef8    g8    
    g8    g8    g8    g8    f8    ef16 ef   d8    c2  
    \break
    c'4    c8.    af16    bf16 bf    g8    g8.  g16  
    af8    f8    f16    f16    af8    c8    g8     g4  
    \break
    c4    c8    c16    af16    bf16    bf16    g8
    g8.    g16 
    g8    f8    ef8    d8    
    c4.
  }
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { 
    \override Lyrics.LyricText.font-size = #-2 
  }
  \midi {\tempo 4 = 100 }
}


\version "2.24.0"
\language "english"
\header {
  title = "The Trip To Sligo"
  composer = "Traditional"
  country = "Ireland"
  style = "jig"
  session = "https://thesession.org/tunes/397#setting13238"
}

\include "../../common/common-header.ily"


chordNames = \chordmode {
  \skip 8
  
  e2.:m    d2.    e2.:m    e2.:m

  
}

melody =  \relative c' {

  \time 6/8 \key g \major  
  \partial 8 d8 
  \repeat volta 2 {
    e4    
    b'8  b8     g8    e8     
    d4   d'8    a8    fs8    d8     
    e4   b'8    b8    g8    e8     
    g8   fs8    e8    e'4    fs8
    \break
    g8   fs8    e8    d8    c8    b8     
    a8   fs8    d'8    a8   fs8    d8     
    e4    b'8    b8    g8   b8   
    a8    g8    fs8    e4  
  } 
  \break
  \repeat volta 2 {
    b'8
    e8    b8    e8    g8     b8    e,8   
    fs8   d8    fs8   fs8   g8     fs8   
    e8    b8    e8    g8    b8    e,8   
    fs8   a8    fs8   g8    fs8
    e8     
    \break
    e8    b8    e8    g8    b8    e,8     
    d8    cs8   d8    a8    fs8    d8     
    e8    fs8   g8    a8    b8    c8
    b8    g8    fs8   e4
  }
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
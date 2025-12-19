\version "2.24.0"
\language "english"
\include "../../common/stylesheet_fiddle.ly"
\header {
  title = "Dr. Gilbert's"
  composer = "Traditional"
  country = "Ireland"
  genre = "Folk"

  subgenre = "Irish"
}

\include "../../common/common-header.ily"
voicedefault =  \relative c''' {

  \time 4/4
  \key e \minor
  \tempo 4 = 112
    g8    fs8  \repeat volta 2 {
    e8    b8    b8   a8    a8    b4. ^"~"     
    d8    b8    a8   c8    b8  a8    
    g8    fs8   e8   d8    b8    d8    g4    
    fs8   g8    e8   d8    b8    e8    d8    b8    
    a8    g8    b8   e8    \times 2/3 { e8  e  e }
    e8    d8    b8   d8    g8    e8    \times 2/3 { e8 e  e}   
    e8    fs8   g8   a8   \times 2/3 {  b8  c  d }   
    e8    d8    b8    d8    g8    b8     a8
    fs8    d8    fs8    e8    fs8    g8    fs8
  }
  \repeat volta 2 {
    e8    b4. ^"~"    g'8    b,4. ^"~"     d8
    e8    fs8    g8    a8    fs8    d8    fs8  
    \times 2/3 {   g8    g8    g8  }   b8    g8    fs8    g8
    a8    fs8     e8    g8    fs8    d8    e8    b4.
    ^"~"          a'8    fs8    d8    fs8    e8
    d8    b8    cs8     d8    b8    a8    fs8    fs8
    e8    d8    fs8     e8    a8    c8    a8    b8    d8
    g8    b8     a8    fs8    d8    fs8    e8    fs8
    g8    fs8
  }
}

\score{
  <<

    \context Staff="default"
    {
      \voicedefault
    }

  >>
  \layout {
  }
  \midi {}
}

\version "2.24.0"
\language "english"
\header {
  title = "The Connaughtman's Rambles"
  composer = "Traditional"
  country = "Ireland"
  style = "jig"
  session = "https://thesession.org/tunes/19#setting19"
  tagline = ""
}

melody =  \relative a' {

  \time 6/8
  \key d \major
  \partial 8 a8
  \repeat volta 2 {
    fs8    a8    a8    d8    a8    a8
    b8    a8    a8    d8    a8    g8
    fs8    a8    a8    d8(    fs8    e8  )
    d8    b8    b8     b8    a8    g8
    \break
    fs8    a8    a8    d8    a8    a8
    b8    a8    a8    d8(    e8    fs8)
    g8     fs8    e8    d8(    fs8    e8)
  } \alternative{
    {
      d8    b8    b8
      b8    a8    g8
    }
    {
      d'8    b8    b8    b4.
    }
  }
  \break
  \repeat volta 2 {
    fs'8   b8    b8    fs8    a8    fs8
    fs8    e8    d8    e8    d8    e8   
    fs8    b8    b8    fs8    a8    fs8  
    fs8    e8    d8     e4.  
    \break
    fs8    b8    b8    fs8    a8    fs8
    fs8    e8    d8    d8    e8    fs8  \bar "|"   
    g8     fs8    e8    d8    fs8    e8
  } \alternative{
    {
      d8    b8    b8
      b4.
    } {   d8    b8    b8    b8    a8    g8  \bar "||"   }
  }
}


\score {
  <<
    %  \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
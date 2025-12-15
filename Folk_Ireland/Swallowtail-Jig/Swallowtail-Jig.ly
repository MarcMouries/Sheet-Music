\version "2.19.53"
\language "english"
\header {
  title = "Swallowtail Jig"
  composer = "Traditional"
  country = "Ireland"
  video = ""
  genre = "Folk"
  subgenre = "Irish"
}

\include "../../common/common-header.ily"


global = {
  \time 6/8
  \key d \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  \partial 4 s4
  e2.:m   e2.:m   d2.   d2.  
  e2.:m   e2.:m   d2.   e2.:m     
  e2.:m   e2.:m   d2.   e2.:m     
  
}

melody = \relative c' {
  \global
  
  \partial 4 
   e 8 fs
  \repeat volta 2 {
   | g 8 e  e    b'\upbow e, e
   | g 8 e  e    b' a  g
   | fs 8 d  d    a' d,  d
   | d'8 cs d    a  g  fs
   \break
   | g 8 e  e    b'\upbow e, e
   | g 8 e  e    b'4\upbow cs8\upbow
   | d 8 cs d    a  g  fs
   | g 8 e  e    e8
  }
  \break
  \repeat volta 2 {
      \partial 8
   b'8\upbow
   b8( cs d)  e4( fs8)
   e4( fs8)   e8( d  b)
   b8( cs d)  e4( fs8)
   e8( d  b)  d4.
   \break
   b8( cs d)  e4( fs8)
   e4( fs8)   e8( d  b)
   d8 cs d    a  g  fs
   g8\downbow( e)  e    e8
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

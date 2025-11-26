\version "2.19.53"
\language "english"
\header {
  title = "Swallowtail Jig"
  video = ""
}

global = {
  \time 6/8
  \key d \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  e1:m   e1:m   d1   e1:m 
  
}

melody = \relative c' {
  \global
  
  \repeat volta 2 {
  \partial 4 
   e 8 fs
   g 8 e  e    b'\upbow e, e
   g 8 e  e    b' a  g
  fs 8 d  d    a' d,  d
   d'8 cs d    a  g  fs
   \break
   g 8 e  e    b'\upbow e, e
   g 8 e  e    b'4\upbow cs8\upbow
   d 8 cs d    a  g  fs
   g 8 e  e    e8
  }
  \break
  \repeat volta 2 {
      \partial 4 
   r8 b'8\upbow
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

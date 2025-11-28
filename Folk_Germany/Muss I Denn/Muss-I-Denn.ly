\version "2.24.0"
\language "english"
\header {
  title = "Muss I Denn"
  composer = "Traditional German"
  style = "folk song"
  tagline = ""
}

global = {
    \key e \major
    \time 4/4 
  \tempo 4=100
}

chordNames = \chordmode {
  \global
}

melody = \relative c' {
  \global
    \partial 4
    \slurDashed
    \repeat unfold 2 {
      e8 fs gs4 gs8 b a4 a8 ( cs ) b4 b8 a gs4 ( gs )
      b4 b8 a gs8 ( gs ) gs ( b ) a4 a fs b gs2 r4
    }
    \repeat volta 2 {
      e8 gs fs4. gs8 a4 fs gs4. a8 b4
      b8 ( b ) cs4 cs e ds8 ( cs ) b2 r4
      e,8 gs b4 b8 cs b4 b8 ( e )
      b4 b8 a gs2 b4 b8 a gs4 gs8 b
      a4 a fs b gs2 r4
    }
  }


words = \lyricmode {
      Muss i denn, muss i denn
    zum Städ -- te -- le hin-aus,
    Städ -- te -- le hin-aus,
    und du, mein Schatz, bleibst hier.
    \set ignoreMelismata = ##t
    Wenn i komm, wenn i komm,
    wenn i wie -- der -- um komm, _ wie -- der -- um komm, _
    kehr i ein mein Schatz, bei dir.
    Kann i glei' net all -- weil bei dir sein,
    han i doch mei Freud an _ dir.
    Wenn i komm, wenn i komm,
    wenn i wie -- der -- um komm, wie -- der -- um komm,
    kehr i ein mein Schatz bei dir.
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}

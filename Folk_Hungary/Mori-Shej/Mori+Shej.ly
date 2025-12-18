\version "2.19.7"

%\include "../../stylesheets/stylesheet_fiddle.ly"

%date = #(strftime "%d-%m-%Y" (localtime (current-time)))
%\markup{ engraved on \date }
\header{
  title= "Mori Shej"
  subtitle="Mori Shej, Szabina (My Daughter Sabina)"
  composer= "József Balogh (Kályi Jág)"
  country = "Hungary"
  style = "lullaby"
  instrument =""
  arranger= ""
}
\include "../../common/common-header.ily"


%#################################### Melody ########################
melody = \relative c'' {
  \clef treble
  \key a \minor
  \time 4/4
  \tempo 4 = 120

  %\partial 16*3 a16 d f   %lead in notes
\mark \markup \box "A"

  a8 a4. a4 b
  a8 g4. a4 g|
  e4 e e4. d8|
  e8 (f) e (d) e2|
  \break
  a8 a4. a4 b
  a8 g4. a4 g|
  e4 e e4. d8|
  e8 (f) e (d) e2|
  %\alternative { { }{ } }
  \break
\mark \markup \box "B"

  \repeat volta 2{
    d1 
    e8 fis4. g2|
    a8 b4. a4 g|
    e8 d4. c2|
    \break
    b8 c d c d c d4 |
    e4 d8 c e4 d8 c
    a4 a2 a4 ~
    a1
  }
  % \alternative { { }{ } }

}
%################################# Lyrics #####################
\addlyrics{
  Bu -- ter káj egy ber -- ses -- zki szán
  Mó -- ri drá -- go pi -- ko séj \skip1

  Vor -- bisz mán -- ge ká -- ki-ko -- ki
  Mó -- ri drá -- go pi -- ko séj
  %chorus
  Áj mo -- ri séj, mo -- ri dra -- go pik -- ony -- éj
  Ál -- ál-- ál -- á.....
}
\addlyrics{
  Kin -- áu tu -- ke sz -- om -- ná -- káj
  Mó -- ri drá -- go pi -- ko séj
  Lá lu -- má -- ko sz -- om -- ná -- káj
  Mó -- ri drá -- go pi -- ko séj

}
\addlyrics{
  Ál -- din dév -- lá mu -- rá sá \skip1
  Mó -- ri drá -- go pi -- kon -- ya
  Mó -- ri drá -- go pi -- kon -- ya \skip1
  Mu -- rá su -- kár szá -- bi -- ná


}
%################################# Chords #######################
harmonies = \chordmode {
  a1:m   a1:m    c1    c1
  %repeated
  a1:m   a1:m    c1    c1
  %b
  g1     g1    a1:m  a1:m
  g1     e1:7  a1:m  a1:m

}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t % remove N.C ?
      \harmonies
    }
    \new Staff \with {
      %instrumentName = "Violin"
    }
    \melody
  >>

\layout{ }
\midi { \tempo 4 = 120}
}
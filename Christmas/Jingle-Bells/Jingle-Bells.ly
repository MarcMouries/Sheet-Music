\version "2.20.0"
\language english

\header {
	title = "Jingle Bells"
	composer = "James Lord Pierpont"
}
\include "../../common/common-header.ily"


melody = \relative c'{
  \clef treble
  \numericTimeSignature
  \time 4/4
  \key g \major
  \partial 8 
  d8
  \repeat volta 3 {
    | d8 b' a g  d4. 16 ~ 16
    | 8 b'8 a g  e4. e8
    | e c' b a   fs4. fs8  
    | e' d  c a  b4.  d,8 
    \break
    | d8 b' a g  d4. 16 ~ 16
    | d8 b' a g  e4. 8  
    | e8 c' b a  d d d d  
    | e d c a  g4 d'4
    \break
    | b8 8 4  8 8 4  
    | 8 d8 g,8. a16  b4. r8 
    | c8 8 8. 16  8 b8 8 16 16
    | 8 a8 8 b8  a4( d8) r
    \break
    | b8 8 4  8 8 4  
    | 8 d8 g,8. a16  b4. r8 
    | c8 8 8. 16  8 b8 8 16 16  
  }
  \alternative {
    \relative b'{ d8 d c a  g4. r8  }
    \relative b'{ d8 d e fs  g4. r8  }
  }
  \bar "|."
}

lyric = \lyricmode {
  <<
    { 
      \set associatedVoice = "melody"
      Dash -- ing through the snow, in_a one -- horse o -- pen sleigh.
      Over the fields we go, laugh -- ing all the way.
      Bells on bob -- tail ring, mak -- ing spi -- rits bright.
      What fun it is to ride and sing a sleigh -- ing song to -- night!  
    }
    \new Lyrics { 
      \set associatedVoice = "melody"
      A_day or two a -- go, the sto -- ry I must tell. 
      I_went out on the snow, and_on my back I fell.
      A_gent was ri -- ding by, in_a_one -- horse o -- pen sleigh.
      He laughed as there I spraw -- ing lie, but quick -- ly drove a -- way.
    }
    \new Lyrics { 
      \set associatedVoice = "melody"
      Now the ground is white, \skip 2 go it while you're young.
      Take the girls to -- night, and_sing this sleigh -- ing song.
      Just_get a bob -- tailed bay, two_for -- ty as his speed.
      \skip 2 Hitch him to an o -- pen sleigh and crack! you'll take the lead.
    }
  >>
  Jin -- gle bells, jin -- gle bells, jin -- gle all the way!
  Oh, what fun it is to ride in a one -- horse o -- pen sleigh! Hey! 
  Jin -- gle bells, jin -- gle bells, jin -- gle all the way!
  Oh, what fun it is to ride in a one -- horse o -- pen sleigh!
  one -- horse o -- pen Sleigh!
}

chordNames = \chordmode {
%s6 g2 g4 c4
}

\score {
  \layout {
    \context {
      \Score proportionalNotationDuration = #(ly:make-moment 1/4)
    }
  }
  
  <<
    \new ChordNames \chordNames

    \new Staff { 
      \new Voice = "melody"
      \melody
    }
    %\new Lyrics \lyricsto "melody" {  \lyric     }
  >>
}
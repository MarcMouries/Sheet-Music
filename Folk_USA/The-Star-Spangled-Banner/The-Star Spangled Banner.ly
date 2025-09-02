\version "2.19.24"
\include "english.ly"

\header{
  title = "Star Spangled Banner"
  subtitle = " "
}

global = {
  \time 3/4
  \key e \major
  \autoBeamOff
}

sopMusic = \relative c' {
\partial 2
\once \override NoteHead.font-size = #-4 e8 e4 \once \override NoteHead.font-size = #-4 e8 |
        e4 gs b |
        e2 gs8( fs) |
        e4 gs, as |
        b2 b8~ b |
        gs'4. fs8 e4 |

        ds4. cs8 ds4 |
        e4 e b |
        \cadenzaOn gs e \bar "|" e8 e \cadenzaOff \bar "|"
        e4 gs b |
        e2 gs8( fs) |

        e4 gs, as |
        b2 b8~ b |
        gs'4. fs8 e4 |
        ds4. cs8 ds4 |
        e4 e b |
        gs e gs'8~ gs |

        gs4 gs a |
        b2 a8( gs) |
        fs4 fs gs |
        a2 a8~ a |
        gs4. fs8 e4 |

        ds4. cs8 ds4 |
        e gs, as |
        \cadenzaOn b2 \bar "|" b8( b8) \cadenzaOff \bar "|"
        e4 e e8[ ds] |
        cs4 cs cs |

        fs a8[ gs] fs[ e] |
        e4( ds) b8 b |
        e4. fs8 gs[ a] |
        b2\fermata e,8 fs |
        gs4. a8 fs4 |
        e2 \bar "|."
}

altoMusic = \relative c {
\partial 2
\once \override NoteHead.font-size = #-4 e8 \melisma e4 \once \override NoteHead.font-size = #-4 e8 \melismaEnd |
        e4 gs b |
        e2 b8( a) |
        gs4 gs fs |
        fs2 b8~ b |
        b4. a8 gs4 |

        b4. b8 b4 |
        b gs b |
        \cadenzaOn gs e \bar "|" e8 e \cadenzaOff \bar "|"
        e4 gs b |
        e2 b8( a) |

        gs4 gs fs |
        fs2 b8~ b |
        b4. a8 gs4 |
        b4. b8 b4 |
        b gs b |
        gs e b'8~ b |

        b4 b b |
        b2 b8( b) |
        ds4 ds e |
        fs2 b,8~ b |
        b4. a8 gs4 |

        b4. b8 b4 |
        b gs fs |
        \cadenzaOn fs2 \bar "|" b8( a) \cadenzaOff \bar "|"
        gs4 gs b |
        a a a |

        a a cs |
        gs( fs) b8 b |
        b4. ds8 e[ fs] |
        gs2 b,8 cs | %corrected typo in original: c2 should be d2
        b4. b8 a4 |
        gs2 \bar "|."
}

bassMusic = \relative c, {
\partial 2
\once \override NoteHead.font-size = #-4 e8 e4 \once \override NoteHead.font-size = #-4 e8 |
        e4 gs b |
        e2 b8( b) |
        e4 e, fs |
        b2 b8~ b |
        e,4. fs8 gs4 |

        b4. b8 a4 |
        gs e b' |
        \cadenzaOn gs e \bar "|" e8( e) \cadenzaOff \bar "|"
        e4 gs b |
        e2 b8( b) |

        e4 e, fs |
        b2 b8~ b |
        e,4. fs8 gs4 |
        b4. b8 a4 |
        gs e b' |
        gs e e'8~ e |

        e4 e fs |
        gs2 fs8( e) |
        b4 b b |
        b2 ds8~ ds |
        e4. e8 e4 |

        b4. b8 a4 |
        gs e fs |
        \cadenzaOn b2 \bar "|" b8( b) \cadenzaOff \bar "|"
        e,4 e gs |
        a a a8[ gs] |

        fs4 fs8[ gs] a[ as] |
        b2 b8 a |
        gs4. b8 e4 |
        e2\fermata gs,8 a |
        b4. b8 b4 |
        e,2 \bar "|."
}

verseone = \lyricmode {
\set stanza = "1. "
Oh, say can you see, by_the dawn's ear -- ly light, What_so proud -- ly we
hail'd at the twi -- light's last gleam -- ing? Whose broad stripes and bright stars thro'_the
per -- il -- ous fight, O'er_the ram -- parts we watched were so gal -- lant -- ly stream -- ing,
And_the rock -- et's red glare, the_bombs burst -- ing in air Gave proof thro' the
night that our flag was still there; Oh, say, does the star -- span -- gled
ban -- ner still wave O'er the land of the free, and the home of the brave?
}

versetwo = \lyricmode {
\set stanza = "2. "
On_the shore dim -- ly seen thro'_the mists of the deep, Where_the foe's haugh -- ty
host in dread si -- lence re -- pos -- es, What is that, which the breeze o'er_the
tow -- er -- ing steep, As_it fit -- ful -- ly blows, half con -- ceals, half dis -- clo -- ses!
Now_it catch -- es the gleam of_the morn -- ing's first beam, In_full glo -- ry re --
flect -- ed now shines on the stream; 'Tis_the star -- span -- gled ban -- ner, Oh,
long may it wave O'er the land of the free, and the home of the brave!
}

versethree = \lyricmode {
\set stanza = "3. "
Oh, thus be it ev -- er_when free -- men shall stand Be -- tween their loved
homes and the war's des -- o -- la -- tion. Blest with vic -- tory and peace, may_the
heav'n -- res -- cued land Praise_the pow'r that has made and pre -- served us a na -- tion.
Then con -- quer we must, when_our cause it is just, And this be our
mot -- "to--" ''In God is our trust,'' And_the star -- span -- gled ban -- ner in
tri -- umph shall wave O'er the land of the free, and the home of the brave! 
}

\score {
  \context ChoirStaff <<
  \context Staff = women <<
  \context Voice =
    sopranos { \voiceOne << \global \sopMusic >> }
  \context Voice =
    altos { \voiceTwo << \global \altoMusic >> }

  \context Lyrics = altos \lyricsto altos \verseone
  \new Lyrics \lyricsto altos \versetwo
  \new Lyrics \lyricsto altos \versethree
  >>

  \context Staff = men <<
    \clef bass
    \context Voice =
      basses { << \global \bassMusic >> }
  >>
>>

\layout {
   indent = 0.0\cm
    \context {
      \Score
       \remove Bar_number_engraver
    }
 }

  \midi {
    \tempo 4 = 100
    }


}

%Note: Original has two eighth notes in small font (in addition to quarter note in normal font) to indicate two syllables in first bar of second verse. Midi plays all three notes.

%Note: Did not transcribe quarter note in bar 10 - not necessary because same number of syllables in that bar for all verses
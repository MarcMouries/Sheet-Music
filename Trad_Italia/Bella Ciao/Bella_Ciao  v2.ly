\version "2.16.0"
\language "english"
#(set-default-paper-size "letter")
#(set-global-staff-size 20)

\header {
title = "Bella ciao"
composer = "Arrangements:Marc Mouries"
}

\paper {
  %%indent = 0 \mm 
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##t 
  ragged-bottom = ##f  
  }



verseI = \lyricmode {
  \set stanza = #"1."
  U -- na mat -- ti -- na mi son sve -- glia -- to
  O bel -- la ciao!, bel -- la ciao, bel -- la ciao ciao ciao
  U -- na mat -- ti -- na mi son sve -- glia -- to
  Eo ho tro -- va -- to l'in -- va -- sor
}


theMelody = \transpose f f  {
  \relative c' {
    \clef treble
    \key f \major 
    \repeat volta 2 { 
    \time 2/4
    r8 a'[  d  e]      
    f  d ( d4 )    % 2
    r8 a d e       % 3
    f d( d4)       % 4
    r8 a d e       % 5
    f4 e8 d        % 6
    f4 e8 d        % 7
    a'4 a          % 8
    a8 a[ g a]     % 9
    bf bf( bf4)  | % 10
    r8 bf a g    | % 11
    bf a( a4)    | % 12
    r8 a g f     | % 13
    e4 a         | % 14
     }
    \alternative {
  { f4 e4   | d2  }
  { b'4 cs4 | d2}
}
     
}% end of last bar in partorvoice
}

\score { 
  << 
   % \context ChordNames { \theChords }
    \new Staff {
      \context Voice = "voiceMelody" { \theMelody }
    }
    \new Lyrics = "lyricsI" {
      \lyricsto "voiceMelody" \verseI
    }
        >> 
\midi {} 
\layout {} 
} 
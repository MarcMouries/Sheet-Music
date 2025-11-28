
\version "2.14.0"
\include "english.ly"
% english.ly     c   d   e   f   g   a   b   -s/-sharp   -f/-flat

#(set-global-staff-size 24)

\header {
        title = "Concerto in Sol Minore"
        subtitle = "La Stravaganza - Concerto op.4 No.6 in G minor RV316a"
        piece = "1. Allegro"
        composer = "Antonio Vivaldi (1678 – 1741)"
  country = "Italy"
         date = "1720"
        style = "Baroque"
        maintainer = "Hajo Dezelski"
        maintainerEmail = "dl1sdz (at) gmail.com"
	footer = "Mutopia-2008/06/01-1429"
	tagline = ""
}

ViolinoSolo =  	\relative g'' {
  \tempo 4=100
  \clef violin
  \key g \minor
  \time 2/4
  \set Staff.midiInstrument = #"violin"
  \override Score.BarNumber #'break-visibility = #'#(#f #t #t)
  \set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)
g4\f d4        | bf'4. a8   | g fs g a | d,4. ef8 | d8( c) \stemDown bf( a) | bf g bf d | g8 a16 bf16 a8-.( g8-.) | fs2 | \break
g4-\upbow\p d4 | bf'4.( a8) | g fs g a | c,4. ef8 | d8( c) \stemDown bf( a) | bf g bf d | g8 a16 bf16 a8-.( g8-.) | fs2 | \break
bf2\f( | bf8)( ef,) g( bf) | a2( | a8)( d,) f( a) | g2( | g8)( cs,) e( g) |   

}


% The score definition

\score {
	\context Staff << 
        \set Staff.instrumentName = "Violino"
        { 
		\ViolinoSolo  
		}
    >>
	\layout { }
 	 \midi { 
	 }
}


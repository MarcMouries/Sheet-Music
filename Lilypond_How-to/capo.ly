melody = \relative c'' {a4 g f e | f1} 
chordsPart = \chordmode {f2 c:7 | f1} 

\score { 
    << 
        \new ChordNames { 
            \chordsPart 
        } 
        \new ChordNames { 
            \set instrument = #"Capo 3" 
            \transpose f d {\chordsPart} 
        } 
        \new Staff { 
            \key f \major 
            \melody 
        } 
    >> 

    \layout { 
        \context {\ChordNames \consists Instrument_name_engraver } 
    } 
} 

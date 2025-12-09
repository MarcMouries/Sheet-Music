\version "2.19.80"


chJazzMusic = { < c ees ges > -\markup \super "dim." 
	< c es ges beses > -\markup \super "7dim" 
	< c e ges> -\markup \super "5>" 
	< c e gis> -\markup \super "aug."  
} 

chJazz = #(append (sequential-music-to-chord-exceptions chJazzMusic #t))

accords =  \chordmode {
	%\set chordRootNamer = #chordNamer      
	\set chordNameExceptions = #chJazz    
	%\set chordChanges = ##t            
	c1:dim       des1:dim7        e:5+       fis:5-       
}

musique = \relative c' {
	c1	des	e	fis
}

\score {
    <<
%        \new ChordNames
        \override ChordNames.ChordName.font-size = #2
        \override ChordNames.ChordName.font-name = #"lilyjazzchord"
        \accords  
        \musique
       
    >>
    \layout { }
}
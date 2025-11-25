\version "2.14.2"
\include "italiano.ly"

\header {
  title = "Bella Ciao"
  composer = "Traditional Italian"
  style = "folk song"
  tagline = ""
}


theMelody =  {
  \time 2/4
  \key re \minor		
	r8 la re' mi' 
	fa' re'~ re'4
	r8 la re' mi' 
	fa' re'~ re'4
	r8 la re' mi' 
	fa'4 mi'8 re' 
	fa'4 mi'8 re' 
	la'4  la'
	la'8 la'[ sol' la'] 
	sib'8 sib' ~ sib'4
	r8 sib' la' sol' sib' la'~ la'4
	r8 la' sol' fa' mi'4 la' fa' mi' re'2
}

theChords = \chordmode { 
     re2:m re:m re:m re:m re:m re:m re:m 
     la:7 la:7 sol:m sol:m re:m re:m la:7 re4:m la4:7 re:m 
} 
       


\score { 
  << 
    \context ChordNames { \theChords }
    \new Staff {
      \context Voice = "voiceMelody" { \theMelody }
    }   
  >> 
\midi {} 
\layout {} 
} 
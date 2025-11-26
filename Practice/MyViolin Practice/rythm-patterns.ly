\include "english.ly"
#(set-global-staff-size 24)
\score {
 \new RhythmicStaff { 
 %\new PianoStaff { 
  \time 3/4
	c4 c8  c4  c8 | c8( c8) c8 c8( c8) c8 
	\break
  \time 2/4
	c8. c16  c8.  c16 | c16[( c16  c16) c16] c16[( c16  c16) c16] 
    \break
\time 3/4
	c8 c4  c8  c4 | c8 c8( c8) c8 c8( c8) 
	\break
\time 2/4
	c16 c8. c16 c8. |  c16[ c16(  c16 c16)] c16[ c16(  c16 c16)] 
\break
	c16[ ~ c16  c16 c16] c16[~ c16  c16 c16] 
    \break
	c16[ c16 ~ c16 c16] c16[ c16 ~ c16 c16] 
\break
	c16[ c16 c16 ~ c16] c16[ c16  c16 ~ c16] 
\break
	c16[ c16 c16  c16 ~] c16[ c16  c16  c16] 
\break

\time 3/4
	c8. [ c16 c16 c16] c8. [ c16 c16 c16] | c16(c16 c16) c16[ c16 c16] c16[(c16 c16)] c16[ c16 c16]
\break
    c16 [ c8. c16 c16] c16 [ c8. c16 c16] |
\break
    c16 [ c16 c8. c16] c16 [ c16 c8. c16] |
\break
    c16 [ c16 c16 c8.] c16 [ c16 c16 c8. ] |

 }
    

  \header {
    piece = "Rhythm Patterns"
  composer = "Marc Mouries"
  style = "practice exercise"
}
  \layout {
    indent = 0\in
    ragged-right=##t
  }
}
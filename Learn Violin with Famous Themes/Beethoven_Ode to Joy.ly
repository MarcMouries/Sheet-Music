\version "2.19.49"

\header {
  title = "Ode to Joy"
  subtitle = "From Symphony No. 9"
  composer = "L. V. Beethoven (1770–1827)"
  opus = "Op. 125"
  style = "hymn"
  tagline = ""
}

sop =  \transpose c c'{
	\voiceOne
	b4 b c' d' | d' c' b a | g g a b | b4. a8 a2 \bar "||"
	b4 b c' d' | d' c' b a | g g a b | a4. g8 g2 \bar "||"	
	a4 a b g | a  b8[( c']) b4 g | a  b8[( c']) b4 a | g a d2 \bar "||"
	b4 b c' d' | d' c' b a | g g a b | a4. g8 g2 |
}

alto =  \transpose c c'{
	\voiceTwo
	g4 g a g | g4. a8 g4 fis | d d fis g| g4. fis8 fis2 |
	g4 g a g | g4. a8 g4 fis | d d fis g| g4 fis d2 |
	d4 d d d | d d d d | d d fis fis | e cis d2 |
	d4 g a a b  g8[( a]) g4 e | e d fis g |g fis g2 |
}

tenor = {
	\voiceOne
	d'4 d' c' b | e'4. d'8 d'4 d' | b b d' d' | d'4. d'8 d'2 \bar "||"
	d'4 d' c' b | e'4. d'8 d'4 d' | b b d' d' | d'4 d' b2 \bar "||"
	fis4 fis g  e | fis  g8[( a8]) g4 e | fis fis fis b | b a g( fis) \bar "||"
	g4 d' f' f' | g'4. d'8 d'4 c' | g g c' d' | d' d' b2
}
bass = {
      \voiceTwo
      g4 g g g | e4. fis8 g4 d | b b a g | d4. d8 d2 |
      g4 g g g | e4. fis8 g4 d | b b a g | d d g,2 |
      d4 d d d | d d d d | d d dis dis | e a, d2 |
      g4 g f f  | e4. fis8 g4 c | c b, a, g, | d d g,2 |
}


global = {
	\time 4/4
	\key g \major
	\skip 1*16
	\bar "|."
}

OdeToJoy = \context Staff = upper<< 
	\global
	\clef "violin"
	  <<
	   \context Voice = "sop"    \sop
	   \context Voice = "alto" \alto
	  >>
>>

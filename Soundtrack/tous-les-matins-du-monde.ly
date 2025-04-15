\version "2.24.1"
\language "english"

\header {
  title = "Improvisations sur les folies d'Espagne"
  subtitle = "Du Film Tous Les Matins du Monde"
  subsubtitle = "Transposed from D to G"
}

global = {
  \time 3/4
  \key c \major
}

chordNames = \chordmode {
  \global
  d2.:m  a2.   d2.:m   c2. 
  f2.   c2.   d2.:m   a2.
  
}

melody = \relative c'' {
  \global
  d4 << a,4. f' d'>> d8
  << a,4. e' cs'>> cs8 cs4
  d4 << a,4. f' d'>> d8 
  << c,4. g' e'>> e8 e4 
  f4 << c,4. a' f'>> f8
  << c,4. g' e'>> e8 e4 
    d4 << a,4. f' d'>> d8
  << a,2. e' cs'>> 
\break 
d8  a  f  d  a  d'
cs8 a  e  cs a  cs'
d8  a  f  d  a  d'
e8  c  g  e  c  e'
f8  c  a  f  c  f'
e8  c  g  e  c  e'
d8  a  f  d  a  d'
cs8 a  e  cs a  cs'
\break


d8  a'  f  d   a'  f 
cs  a'  e  cs  a'  e 
d8  a'  f  d   a'  f 

c2. 
f2. 
c2. 
d2.  
a2. 
r 
r
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}

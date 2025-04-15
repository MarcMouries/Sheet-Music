\version "2.19.17"
\language "english"

\header {
  title = "hungarian minor (gipsy) Scale"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
}

Hungarian_Minor_Gypsy_A = \relative c' {
  a4   b   c   ds  e   f    gs
}

melody = \relative c''' {
  d8  cs b a    gs8 b  a gs
  fs8 es d cs   c 8 cs a gs
  fs4
}

\score { \new Staff { \transpose a c' \Hungarian_Minor_Gypsy_A } \layout { }}
\score { \new Staff { \transpose a d' \Hungarian_Minor_Gypsy_A } \layout { }}

\markup "A"
\score { \new Staff { \Hungarian_Minor_Gypsy_A } \layout { }}
\score { \new Staff { \melody } \layout { }}
\score { \new Staff { \transpose a c'  \Hungarian_Minor_Gypsy_A } \layout { }}
\score { \new Staff { \transpose a c' \melody } \layout { }}
\score { \new Staff { \transpose a g   \Hungarian_Minor_Gypsy_A } \layout { }}
\score { \new Staff { \transpose a g \melody } \layout { }}


\markup "B"
\score { \new Staff { \transpose a c  \melody } \layout { }}
\score { \new Staff { \transpose a d \melody } \layout { }}
\score { \new Staff { \transpose a e \melody } \layout { }}
\score { \new Staff { \transpose a f \melody } \layout { }}
\score { \new Staff { \transpose a g \melody } \layout { }}

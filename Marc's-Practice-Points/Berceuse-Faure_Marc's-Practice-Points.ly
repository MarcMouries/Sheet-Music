\version "2.19.31"
\language "english"
\header {    composer = "Marc Mouries"
  genre = "Exercise"}

\include "../common/common-header.ily"
Title =  "Berceuse de Faure"
\include "practice-points-header.ly"

%\markup \vspace #2
\markup { "3 & 4th finger D Scale"}


\markup { "2nd position"}

melody = \relative c' {
\repeat volta 2{  a-1_"I" c-3 d-3 e  d c }
\repeat volta 2{  a-1 c-3 d-3 e  d c }
\repeat volta 2{  b-1_"II" d-3 e-3 fs  e d }
\repeat volta 2{  b-1 d-3 e-3 f s  e d }
}


\relative c' {
  \time 6/8
  d8_4 e fs e d cs
  d8_3  e fs e d cs
  d8_2  e fs e d cs
  d8_1  e fs e d cs_1
  d8_2^"& back"
  
}
\score {  \new Staff { \melody }
  \layout { }
}
\markup \vspace #2
\markup { "Option 1: Move to 2nd position"}


\relative c'{
 \repeat volta 2 { 
   b-1 e-3  e-3 b-1 
 }
fs'4.-4 e8-3  b4.-1 d8-3 
cs4.-2 d8-2

b-1 d-3 cs-2 d-2
}
\markup { "Option 2: Stay in 3rd position % extend back to 2nd position"}
\relative c'{
  
\repeat volta 2{  b 4_1 ( d-2 cs d fs-4 d-2 cs d) }


 \repeat volta 2 { 
fs'4-4 e-3 fs d fs cs fs b,4-1 
 }
}




melody = \relative c' {

s1^"flesh scale"

\time 6/8
  a8( b d  e fs a-2)  b8 (a fs-2 e d-4 b)
  e8^"idem as before but short-long"( fs a  b cs e-2)  fs8 (e cs-2 b a-4 fs)
  b8( cs e  fs gs b-2)  cs8 (b gs-2 fs e-4 cs)
\break
\time 4/4
\repeat volta 2{
  a4_1^"I"  c_2^"" b_1^"II"  c_2
  b4_1^""   d_2^"" c_1^"III" d_2
  c4_1^""   e_2^"" d_1^"IV"  e_2
  d4_1^""   f_2^"" e_1^"V"   f_2
  e4_1^""   g_2^"" f_1^"VI"  g_2
  g4_2^""   e_1^"" f_2^"V"   e_1
  f4_2^""   d_1^"" e_2^"VI"  d_1
  e4_2^""   c_1^"" d_2^"III" c_1
  d4_2^""   b_1^"" c_2^"II"  b_1
  c4_2^""   a_1^"" b_2^"I"   a_1

}
\break

\repeat volta 2{  b 4_1 ( d-2 cs d fs-4 d-2 cs d) }
\repeat volta 2{  b 8_1 ( d-2 cs d) fs-4 ( d-2 cs d) }
\repeat volta 2{  fs8_1  a-2 gs a cs-4 a-2 gs a}
\repeat volta 2{  cs8_1  e-2 ds e gs-4 e-2 ds e}
\repeat volta 2{  gs8_1  b-2 as b ds-4 b-2 as b}
\break
s1^"en premiere position too"
s1
s1
s1
\break
\repeat volta 2{ d,,8 _2^"pos III" e fs-1 g a b cs
d-4 cs-4 b a g fs e d cs}
\repeat volta 2{ a'8 _2^"pos III" b cs-1 d e fs gs
a-4 gs-4 fs e d cs b a gs}
\break

\repeat volta 2{ d8   _1^"pos IV" e fs g fs-4 e d cs}
\repeat volta 2{ a' _1^"pos IV" b cs d cs-4 b a gs}
\repeat volta 2{ e' _1^"pos IV" fs gs a gs-4 fs e ds}
\repeat volta 2{ b' _1^"pos IV" cs ds e ds-4 cs b as}


\break
\time 4/4
  c,,8-1  e  g-4 f e f d e
  g8-1    b  d-4 c b c a b
  d8-1    fs a-4 g fs g e fs
  a8-1    cs e-4 d cs d b cs
\break
\time 6/8
  c,,8-1  e g f a fs
  g8-1  b d c a fs
  d'8-1  fs a g e cs
  a' 8-1  cs e d b gs
\break
\time 4/4
  d4-1  fs a-4\flageolet  g-4
  fs  a-4\flageolet
  <a,-0 d-1\harmonic> <d-1 g-4\harmonic>



}


\score {
    \new Staff { \melody }
  \layout { indent = 0}
}

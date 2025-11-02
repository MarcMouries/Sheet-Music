\version "2.19.11"


stringNumberSpanner =
#(define-music-function (parser location StringNumber) (string?)
  #{
    \override TextSpanner.style = #'solid
    \override TextSpanner.font-size = #-5
    \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
    \override TextSpanner.bound-details.left.text = \markup {
      %\circle
      \number #StringNumber }
  #})



\markup \bold { "Dounis' Daily dozen 1 C"}  
dounis_daily_dozen_one_C = \relative c' {
  \time 3/4
  a16 (a' g f 
  e16 e' d c 
  b16 b' a g) 
  f16 e-4 d c 
  b16 a-4 g f
  e16 d c b
  
  b16 b' a g 
  f16 f' e d 
  c16-4 c' b a 
  g16 f e d 
  c b a g
  f e d c
    \break

  c16_1 c' b a 
  g16 g' f e 
  d16-4 d' c b 
  
  a16-1 g-4 f e 
  d c b a
  g f e d
  
  d16 d' c b 
  a16-1 a'-1 g f 
  e16-1 e' d c 
  
  b16-1 a-4 g f 
  e-1 d-4 c b
  a-1 g-4 f e
  
  e16 e' d c 
  b16-1 b'-1 a g 
  f16-1 f' e d 
  
  c16-1 b-4 a g 
  f-1 e-4 d c
  b-1 a-4 g f
  
  f16 f' e d 
  c16-1 c'-1 b a 
  g16-1 g' f e 
  
  d16-1 c-4 b a 
  g-1 f-4 e d
  c-1 b-4 a g
      \break

    g16 g' f e 
  d16-1 d'-1 c b 
  a16-1 a' g f 
  
  e16-1 d-4 c b 
  a-1 g-4 f e
  d-1 c-4 b a
  
  a16 a' g f 
  e16-1 e'-1 d c 
  b16-1 b' a g 
  
  f16-1 e-4 d c 
  b-1 a-4 g f
  e-1 d-4 c b
  
  a2 r4
  
}

\score {
  \dounis_daily_dozen_one_C 
  
\layout { indent=0 }
}

\markup \bold { "Galamian"}  

\score {
\relative c' {
  \textSpannerUp
  \stringNumberSpanner "4"
  <a_1 a'>8 \startTextSpan  b_2 c_3 \stopTextSpan  d_4 
  <e_1 e'>8 \startTextSpan  f_2 g_3 \stopTextSpan  a_4
  <b_1 b'>8 \startTextSpan  c_2 d_3 \stopTextSpan  e_4
  f_1         g    a    b  
  <b^4 b,_1>  a^3  g-2  f-1  
  <e^4 e,_1>  d    c    b    
  <a^4 a,_1>  g    f    e
  d c b a 
  <b_1 b'>8 ^\markup {"II Pos."} \startTextSpan  c_2 d_3 \stopTextSpan  e_4   
}
\layout { indent=0 }
}
\markup { "The fourth finger is held down silently during the playing of the second and third fingers."}  


space = 3

\markup \vspace #space
    

\markup {
  violin: \score { \new Staff { <g d' a' e''>1 }             \layout { indent=0 } } ,
  cello:  \score { \new Staff { \clef "bass" <c, g, d a> }  \layout { indent=0 } }
}
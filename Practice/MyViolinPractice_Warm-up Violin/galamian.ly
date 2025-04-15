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
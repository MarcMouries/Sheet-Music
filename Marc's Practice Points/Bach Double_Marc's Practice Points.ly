\version "2.19.32"
\language "english"
\include "../common/violin-functions.ly"

\header {    composer = "Marc Mouries"
  style = "practice exercise"
  tagline = ""}
Title =  "Bach Double Violin Concerto in Dm"
\include "practice-points-header.ly"


\markup \bold "Mes. 25-27"
\score {
  \new Staff \with {  instrumentName = "To play "}
  \relative c''' {
    \set Score.currentBarNumber = #75
%\bar ""  % Permit first bar number to be printed

    r2 r4 r16 g,-"solo" f e |
    %26
    f8 a' e, g' d,16 g' f e d c bf a |
    bf8 d' a, c' g,16 c' bf a g f e d |

  }
}
\score {
  \new Staff \with {  instrumentName = "Practice"}
  \relative c'' {
    \repeat percent 4{
    bf4-1 \glissSize #5 d  <d, d'> <d d''-4>
    }
    \repeat percent 5{
         a''-1_"oo-o-o" d16-4 c bf a r4 r16 a16-3_"o-o-o" g f \glissSize #5
    }
  }
}

\markup \vspace #1
\markup \bold "Mes. 42"
mesFortyTwo =   \relative c' {
    \set Score.currentBarNumber = #42
%\bar ""  % Permit first bar number to be printed
    e16 c a c d b gs b c8 a a'4 ~ |
  }
mesFortyTwoPractice =   \relative c' {
    \repeat volta 2{
       a'4-4 (a,-1) gs'-3( gs,-1)
    }
      \repeat volta 2{
       <a -1  a' -4>2
       <gs-1  gs'-3>2
}
  }
\markup {
  To play \writeMusic ##{ \mesFortyTwo #}
  Practice \writeMusic ##{
    \mesFortyTwoPractice
  #}  }



\markup \vspace #1
\markup \bold "Mes. 58-61"
\score {
  \new Staff \with {  instrumentName = "To play "}
  \relative c'' {
    \set Score.currentBarNumber = #58
%\bar ""  % Permit first bar number to be printed

    g8 g'4 fs8 g4 r16 ef,-"solo" d c
    bf8 g' c, a' bf, g' a, fs' |
    bf, g' d a' bf g r16 f' ef d |
    c( ef  g) c d,( f  g) b c g ef c b( d  f) g |
  }
}
partA =   \relative c'' {
    \repeat volta 2{
     b8-1_\markup {
       \small \italic "finger substitution"} [c-2] c-\shift-1 cs-2 cs-\shift-1}
  }
partB =   \relative c' {
    \repeat volta 2{
     a8_1 fs'-2  bf,_\shift-1 g'-2 c,_\shift-1 a'-2 d,_\shift-1 b'-2}
  }
partC =   \relative c'' {
    \repeat volta 2{
     c8-1 ef-3  d-2 f-4 c-1 ef-3 b-1 d-3}
  }\markup {
  Practice \writeMusic ##{ \partA #}
  "  " \writeMusic ##{ \partB #}
  "  " \writeMusic ##{ \partC #}  }
\markup \vspace #1
\markup \bold "Mes. 75-76"
\score {
  \new Staff \with {  instrumentName = "To play "}
  \relative c' {
    \set Score.currentBarNumber = #75
%\bar ""  % Permit first bar number to be printed

    d16 g_1 bf d g d bf g
    d(  f_1  a) d f d a f
    d(  e_1  g) bf e bf g d cs( e  g) a e'8 r
  }
}

\score {
  \new Staff \with {  instrumentName = "Practice"}
  \relative c'' {
  <<
    %    Voice "1" : Melody
    { g8-1 bf-3  g[ bf] g[ bf] g[ bf]
      f8_1 a_3   f[ a ] f[ a ] f[ a]
      e8^1 g^3   e[ g ] e[ g ] e[ g]
      <g,-0 g'-1>4 <g-0 bf'-3>4
      <f'_1 a -0>4 <a-3  a-0>
      <g,_0 e'-1>4 <g    g'-3>
    }
     \\
    %    Voice "2" : Drone
     { g1
       a'1
       g,1
     } >>
}
%\layout { indent = 0}
}

\markup \vspace #1
\markup \bold "Mes. 86"
MeasureEightyFiveFirst = \relative c'' {
 a8-0 d-3  f e  cs a}
MeasureEightyFiveSecond = \relative c'' {
 a8-0 d-2  f e  cs a}
MeasureEightyFiveThird = \relative c'' {
 a8-0 d-1  f e  cs a}
\markup {
    \fill-line {
      %\null
      \line {
        \vcenter \override #'(line-width . 40)
        \column{
           {\writeMusic ##{ \MeasureEightyFiveFirst #} }
           {"1st position"}
        }
        \hspace #2
        \vcenter \override #'(line-width . 40)
        \column{
           {\writeMusic ##{ \MeasureEightyFiveSecond #} }
           {"2nd Position"}
        }
        \hspace #2
        \vcenter
        \column{
           {\writeMusic ##{ \MeasureEightyFiveThird #} }
           {"3rd Position"}
        }
      }
      %\null
    }
}
\markup \vspace #1
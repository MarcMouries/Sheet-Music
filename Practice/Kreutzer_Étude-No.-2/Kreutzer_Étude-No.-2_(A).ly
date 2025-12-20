\version "2.19.22"
\language "english"

\include "../../common/stylesheet_fiddle.ly"
\include "../../common/violin-functions.ly"


#(set-default-paper-size "letter")
%#(set-global-staff-size 19)
\header {
  title      = "Kreutzer Etude No. 2"
  composer   = "Rodolphe Kreutzer"
  country    = "France"
  key        = "A"
  poetyear   = "Mouries - 2015"
  composeryear  = "Mouries 2015"
  genre      = "Exercise"
}

\include "../../common/common-header.ily"



%\paper {
  %system-system-spacing #'padding = #6
  %top-markup-spacing    #'padding = #10   % add space between top of page and 1st markup/title
  %markup-system-spacing #'padding = #8   % space between markup & 1st system

  %markup-system-spacing #'padding = #3
 % last-bottom-spacing #'basic-distance = #7
 % last-bottom-spacing #'padding = #2.5


%  print-first-page-number = ##t
%  first-page-number = 3

%  ragged-right = ##f
%  ragged-bottom = ##f
% ragged-last-bottom = ##f
% ragged-last = ##f


%  #(define fonts
%     (make-pango-font-tree
%       "Neuton"
%       "Ubuntu"
%       "Luxi Mono"
%        (/ staff-height pt 20)))
% 
% }

melody =  \relative c'  {
 \time 4/4
 \key f \major
 f16 a  c   bf     a  bf  g^\shift-2 _\smark "II"
 a     f-1  a  c   bf_"III"   a bf g a-4
 f16 a  c   bf     a  bf  g  a-4     f  g  a-4 g   f g e f
 d16 f  a-4 g     f  g  e  f       d  f  a   g   f g e f

 d16 f  a-4 g    f  g   e  f     d  e   f   e    d  e  c   d-4
 bf16 d  f   ef   d  ef  c  d-4   bf  d-0 g   f    e! f  d-0 e
 c16 e  g   f    e  f   d  e     c  e   a-4 g    f  g  e   f

 \break
 d16 f  a-4 g    f  g    e  f      d-0  f  bf  a      g  a  f  g
 e16 g  bf   a    g  a-4  f  g      e    g  c  bf      a  bf  g  a
 f16 a  c   bf    a  bf    c  a      d    d, e  f      g-\shift-1  a  bf  g

 \break
 c16 c, d  e     f    g a f     bf  bf,   c  d      e  f  g  e
 a16 a, bf  c     d-0  e f d     g  g,   a  bf      c  d  e  c
 f16 f, g  a     bf    d e f     g  g,_0 a  bf      c  e  f  g
\break
 a-4 a, bf-2^\shift-1 _\smark "II"  c
 d  f  g  a       bf  bf, c  d        e  g  a  bf
 c16 c, d  e      f  a  bf  c       d  d, e  f        g  bf  c  d
 e16 e, f^2  g    a  c  d  e       f  f, g  a        bf  d  e  f
\break
g16 g,-1 a bf
\restezPos "4" { c c, c'} bf   a f-1 g a
\restezPos "4" { bf bf, bf'} a   g e-1 f g
\restezPos "4" { a a, a'} g   f d-0 e f
\restezPos "3" { g g, g'} f   e c d-4 e
f-1 g a-4 f  bf-4 g a bf  c c, d-0 e

\break
f16  c' b c     a-4  c g  c    f,  a  g  a   f a e a
d,-0 d'-2 cs d   bf!   d a  d    g, bf  a  bf    g bf f bf
e,-1 e' ds e     c    e bf! e    a,-0 c b! c  a-4 c g c
f,-2 a, bf! c   d-4 g,_0 a bf   c c' a f   e c bf g
f_3  bf a d_4   c   e   f bf   a-0   c   a f   e c bf g
f  bf a d_4     e   e   f bf   a-0   c   a f   e c bf g
f a c e  f( a) c f-4 f,2
\bar "|."
}


targetKey = f,

\score {
    \new Staff {
      { \transpose f, \targetKey \melody }
    }
   \layout { indent = 0}
}
\version "2.19.22"
\language "english"

%\include "../../common/stylesheet_fiddle.ly"
\include "../../common/violin-functions.ly"
\include "../../common/common-header.ily"



\header {
  title      = "Etude № 2"
  subtitle   = "Shifting Version"
  composer   = "Kreutzer"
  poetyear   = "Mouries - 2015"
  composeryear  = "Mouries 2015"
    genre = "Exercise"
}




\paper {
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


 #(define fonts
    (make-pango-font-tree
      "Neuton"
      "Ubuntu"
      "Luxi Mono"
       (/ staff-height pt 20)))

}

melody =  \relative c''  {
 \time 4/4
 \key c \major
 c16-2 _\smark "I" e-1 _\smark "IV"  g   f     
 e16  f  d^\shift-2 _\smark "II"
 e16  c-1  e  g   f_"III"   
 e16  f d e-3
 c16-1  e  g   f     
 e16   f  d  e-3     
 c-1  d  e-3 d   
 c d^\shift-1_\smark "III"  b c
 
 a16-2 c^\shift-1   e-3 d     c  d  b  c       a  c  e   d   c d b c

 a16-1_\smark "IV" c^\shift-1 _\smark "VI"  e-3 d    
 c  d   b-2_\smark "IV"  c     
 a  b   c   b    
 a  b  g^\shift-2 _\smark "II"   a
 f16^1 _\smark "II" a^\shift-1 _\smark "IV"  c   bf   
 a  bf  g^\shift-2 _\smark "II"  a   
 f^1 _\smark "II"  a-3 d^\shift-3 _\smark "V"   c    
 b! c  a^\shift-2 _\smark "III" b
 g16^\shift-1_\smark "III" b  d^\shift-3_\smark "?"   c    
 b  c   a  b     
 g  b   e-4 d    
 c  d  b   c

 \break
 a16 c  e-4 d    c  d    b  c      a-0  c  f  e      d  e  c  d
 b16 d  f   e    d  e-4  c  d      b    d  g  f      e  f  d  e
 c16 e  g   f    e  f    g  e      a    a, b  c      d-\shift-1  e  f  d

 %\break
 g16 g, a  b     c    d e c     f  f,   g  a      b  c  d  b
 e16 e, f  g     a-0  b c a     d  d,   e  f      g  a  b  g
 c16 c, d  e     f    a b c     d  d,_0 e  f      g  b  c  d
%\break
 e-4 e, f-2^\shift-1 _\smark "II"  g
 a  c  d  e       f  f, g  a        b  d  e  f
 g16 g, a  b      c  e  f  g       a  a, b  c        d  f  g  a
 b16 b, c^2  d    e  g  a  b       c  c, d  e        f  a  b  c
%\break
d16 d,-1 e f
\restezPos "4" { g g, g'} f   e c-1 d e
\restezPos "4" { f f, f'} e   d b-1 c d
\restezPos "4" { e e, e'} d   c a-0 b c
\restezPos "3" { d d, d'} c   b g a-4 b
c-1 d e-4 c  f-4 d e f  g g, a-0 b

%\break
c16  g' fs g     e-4  g d  g    c,  e  d  e   c e b e
a,-0 a'-2 gs a   f!   a e  a    d, f  e  f    d f c f
b,-1 b' as b     g    b f! b    e,-0 g fs! g  e-4 g d g
%\break
c,-2 e, f! g   a-4 d,_0 e f   g g' e c   b g f d
c_3  f e a_4   g   b   c f   e-0   g   e c   b g f d
c  f e a_4     b   b   c f   e-0   g   e c   b g f d
c e g b  c( e) g c-4 c,2
\bar "|."
}


targetKey = c

\score {
    \new Staff {
      { \transpose c \targetKey \melody }
    }
   \layout { indent = 0}
}
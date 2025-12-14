\version "2.19.22"
\language "english"

\include "../../stylesheets/stylesheet_fiddle.ly"
\include "../../common/violin-functions.ly"


#(set-default-paper-size "letter")
%#(set-global-staff-size 19)
\header {
  title      = "Etude № 2"
  subtitle   = "for Maxence, Stella & Victor"
  composer   = "Kreutzer"
  poetyear   = "Mouries - 2015"
  composeryear  = "Mouries 2015"
  genre = "Exercise"
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

melody =  \relative c''  {
 \time 4/4
 \key a \major
 a16 cs  e   d     cs  d  b^\shift-2 _\smark "II"
 cs     a-1  cs  e   d_"III"   cs d b cs-4
 a16 cs  e   d     cs  d  b  cs-4     a  b  cs-4 b   a b gs a
 fs16 a  cs-4 b     a  b  gs  a       fs  a  cs   b   a b gs a

 fs16 a  cs-4 b    a  b   gs  a     fs  gs   a   gs    fs  gs  e   fs-4
 d16 fs  a   g   fs  g  e  fs-4   d  fs-0 b   a    gs! a  fs-0 gs
 e16 gs  b   a    gs  a   fs  gs     e  gs   cs-4 b    a  b  gs   a

 \break
 fs16 a  cs-4 b    a  b    gs  a      fs-0  a  d  cs      b  cs  a  b
 gs16 b  d   cs    b  cs-4  a  b      gs    b  e  d      cs  d  b  cs
 a16 cs  e   d    cs  d    e  cs      fs    fs, gs  a      b-\shift-1  cs  d  b

 \break
 e16 e, fs  gs     a    b cs a     d  d,   e  fs      gs  a  b  gs
 cs16 cs, d  e     fs-0  gs a fs     b  b,   cs  d      e  fs  gs  e
 a16 a, b  cs     d    fs gs a     b  b,_0 cs  d      e  gs  a  b
\break
 cs-4 cs, d-2^\shift-1 _\smark "II"  e
 fs  a  b  cs       d  d, e  fs        gs  b  cs  d
 e16 e, fs  gs      a  cs  d  e       fs  fs, gs  a        b  d  e  fs
 gs16 gs, a^2  b    cs  e  fs  gs       a  a, b  cs        d  fs  gs  a
\break
b16 b,-1 cs d
\restezPos "4" { e e, e'} d   cs a-1 b cs
\restezPos "4" { d d, d'} cs   b gs-1 a b
\restezPos "4" { cs cs, cs'} b   a fs-0 gs a
\restezPos "3" { b b, b'} a   gs e fs-4 gs
a-1 b cs-4 a  d-4 b cs d  e e, fs-0 gs

\break
a16  e' ds e     cs-4  e b  e    a,  cs  b  cs   a cs gs cs
fs,-0 fs'-2 es fs   d!   fs cs  fs    b, d  cs  d    b d a d
gs,-1 gs' fss gs     e    gs d! gs    cs,-0 e ds! e  cs-4 e b e
a,-2 cs, d! e   fs-4 b,_0 cs d   e e' cs a   gs e d b
a_3  d cs fs_4   e   gs   a d   cs-0   e   cs a   gs e d b
a  d cs fs_4     gs   gs   a d   cs-0   e   cs a   gs e d b
a cs e gs  a( cs) e a-4 a,2
\bar "|."
}

\score {
    \new Staff {
      { \transpose a a \melody }
    }
   \layout { indent = 0}
}
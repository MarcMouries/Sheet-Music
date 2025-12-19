\version "2.7.38"
\header {
  title = "Canon"
  % subtitle = "Subtitle"
  composer = "J. Pachelbel"
  instrument = "Violin I"
  % copyright = "Copyright"
}

\score {

 {
 #(set-accidental-style 'modern-cautionary)
 \clef treble
  % *** |Text|Text:"Sostenuto"|Font:StaffItalic|Pos:11 ***
 \key d\major
 \time 4/4
 r1  |  % 1
 r1  |  % 2
 fis''4\p  e''4 d''4 cis''4 |  % 3
 b'4 a'4 b'4 cis''4 |  % 4
 d''4 cis''4 b'4 a'4 |  % 5
 g'4 fis'4 g'4 e'4 |  % 6
 d'8 (  [  fis'8 )  ]  a'8 (  [  g'8 )  ]  fis'8 (  [  d'8 )  ]  fis'8 (  [  e'8 )  ]  |  % 7
 d'8 (  [  b8 )  ]  d'8 (  [  a'8 )  ]  g'8 (  [  b'8 )  ]  a'8 (  [  g'8 )  ]  |  % 8
 fis'8 (  [  d'8 )  ]  e'8 (  [  cis''8 )  ] \cresc   d''8 ( \<  [  fis''8 )  ]  a''8 (  [  a'8 )  ]  |  % 9
 b'8 (  [  g'8 )  ]  a'8 (  [  fis'8 )  ]  d'8 (  [  d''8 )  ] 
% *** |Text|Text:"tr"|Font:StaffItalic|Pos:9|Justify:Center|Placement:AtNextNote ***

 d''8. (  [  cis''16 )  ]  |  % 10
 d''16\! \mf  [  cis''16 d''16 d'16 ]  cis'16 [  a'16 e'16 fis'16 ]  d'16 [  d''16 cis''16 b'16 ]  cis''16 [  fis''16 a''16 b''16 ]  |  % 11
 g''16 [  fis''16 e''16 g''16 ]  fis''16 [  e''16 d''16 cis''16 ]  b'16 [  a'16 g'16 fis'16 ]  e'16 [  g'16 fis'16 e'16 ]  |  % 12
 d'16\mp  [  e'16 fis'16 g'16 ]  a'16 [  e'16 a'16 g'16 ]  fis'16 [  b'16 a'16 g'16 ]  a'16 [  g'16 fis'16 e'16 ]  |  % 13
 d'16 [  b16 b'16 cis''16 ]  d''16 [  cis''16 b'16 a'16 ]  g'16 [  fis'16 e'16 b'16 ]  a'16 [  b'16 a'16 g'16 ]  |  % 14
 fis'8 [  fis''8-.\mf  ]  e''4 r8  d''8-. fis''4 |  % 15
 b''4 a''4 b''4 cis'''4 |  % 16
 d'''8-. [  d''8-. ]  cis''4 r8  b'8-.\mp  d''4 |  % 17
 d''4. d''8 d''8 [  g''8 ]  e''8 [  a''8 ]  |  % 18
 a''16\mf  (  [  fis''32 g''32 )  ]  a''16 (  [  fis''32 g''32 )  ]  a''32-. [  a'32 (  b'32 cis''32 ]  d''32 [  e''32 fis''32 g''32 )  ]  fis''16 (  [  d''32 e''32 )  ]  fis''16-. [  fis'32 (  g'32 )  ]  a'32 (  [  b'32 a'32 g'32 ]  a'32 [  fis'32 g'32 a'32 )  ]  |  % 19
 g'16 (  [  b'32 a'32 ]  g'16 [  fis'32 e'32 )  ]  fis'32 (  [  e'32 d'32 e'32 ]  fis'32 [  g'32 a'32 b'32 )  ]  g'16 (  [  b'32 a'32 ]  b'16 [  cis''32 d''32 )  ]  a'32 (  [  b'32 cis''32 d''32 ]  e''32 [  fis''32 g''32 a''32 )  ]  |  % 20
 fis''16 (  [  d''32 e''32 ]  fis''16 [  e''32 d''32 )  ]  e''32 (  [  cis''32 d''32 e''32 ]  fis''32 [  e''32 d''32 cis''32 )  ]  d''16 (  [  b'32 cis''32 )  ]  d''16-. [  d'32 (  e'32 )  ]  fis'32 (  [  g'32 fis'32 e'32 ]  fis'32 [  d''32 cis''32 d''32 )  ]  |  % 21
 b'16 (  [  d''32 cis''32 ]  b'16 [  a'32 g'32 )  ]  a'32 (  [  g'32 fis'32 g'32 ]  a'32 [  b'32 cis''32 d''32 )  ]  b'16 (  [  d''32 cis''32 ]  d''16 [  cis''32 b'32 )  ]  cis''32 (  [  d''32 e''32 d''32 ]  cis''32 [  d''32 b'32 cis''32 )  ]  |  % 22
 d''8-.\mp  r8  cis''8-. r8  b'8-. r8  d''8-. r8  |  % 23
 d'8-. r8  d'8-. r8  d'8-. r8  e'8-. r8  |  % 24
 r8  a'8-.\p  r8  a'8-. r8  fis'8-. r8  a'8-. |  % 25
 r8  g'8-. r8  fis'8-. r8  g'8-. r8  e''8-. |  % 26
 fis''16\mf  [  fis'16 g'16 fis'16 ]  e'16 [  e''16 fis''16 e''16 ]  d''16 [  fis'16 d'16 b'16 ]  a'16 [  a16 g16 a16 ]  |  % 27
 b16 [  b'16 cis''16 b'16 ]  a'16 [  a16 g16 a16 ]  b16 [  b'16 a'16 b'16 ]  cis''16 [  cis'16 b16 cis'16 ]  |  % 28
 d'16 [  d''16 e''16 d''16 ]  cis''16 [  cis'16 d'16 cis'16 ]  b16 [  b'16 a'16 b'16 ]  cis''16 [  cis'16 fis'16 e'16 ]  |  % 29
 d'16 [  d''16 e''16 g''16 ]  fis''16 [  fis'16 a'16 fis''16 ]  d''16 [  g''16 fis''16 g''16 ]  e''16 [  a'16 g'16 a'16 ]  |  % 30
 fis'16 [  a'16\mp  a'16 a'16 ]  a'16 [  a'16 a'16 a'16 ]  fis'16 [  fis'16 fis'16 fis'16 ]  fis'16 [  fis'16 a'16 a'16 ]  |  % 31
 g'16 [  g'16 g'16 d''16 ]  d''16 [  d''16 d''16 d''16 ]  d''16 [  d''16 b'16 b'16 ]  a'16 [  a'16 e''16 cis''16 ]  |  % 32
 a'16 [  fis''16 fis''16 fis''16 ]  e''16 [  e''16 e''16 e''16 ]  d''16 [  d''16 d''16 d''16 ]  a''16 [  a''16 a''16 a''16 ]  |  % 33
 b''16 [  b''16 b''16 b''16 ]  a''16 [  a''16 a''16 a''16 ]  b''16 [  b''16 b''16 b''16 ]  cis'''16 [  cis''16 cis''16 cis''16 ]  |  % 34
 d''16 [  d'32 (  e'32 fis'16 )  d'16-. ]  cis'16 [  cis''32 (  d''32 e''16 )  cis''16-. ]  b'16 [  b32 (  cis'32 d'16 )  b16-. ]  cis'16 [  a'32 (  g'32 fis'16 )  e'16-. ]  |  % 35
 d'16 [  g'32 (  fis'32 e'16 )  g'16-. ]  fis'16 [  d'32 (  e'32 fis'16 )  a'16-. ]  g'16 [  b'32 (  a'32 g'16 )  fis'16-. ]  e'16 [  a'32 (  g'32 fis'16 )  e'16-. ]  |  % 36
 fis'16 [  d''32 (  cis''32 d''16 )  fis'16-. ]  a'16 [  a'32 (  b'32 cis''16 )  a'16-. ]  fis'16 [  d''32 (  e''32 fis''16 )  d''16-. ]  fis''16 [  fis''32 (  e''32 d''16 )  cis''16-. ]  |  % 37
 b'16 [  b'32 (  a'32 b'16 )  cis''16-. ]  d''16 [  fis''32 (  e''32 d''16 )  fis''16-. ]  g''16 [  d''32 (  cis''32 b'16 )  b'16-. ]  a'16 [  e'16 a'16 a'16 ]  |  % 38

% *** |Text|Text:"poco meno"|Font:StaffItalic|Pos:-9 ***

 a'4. a'8 d'4. a'8 |  % 39
 g'4 a'4 g'8 [  d'8 ] 
% *** |Text|Text:"tr"|Font:StaffItalic|Pos:8|Justify:Center|Placement:AtNextNote ***

 d'8. [  cis'16 ]  |  % 40
 d'8 [  d''8\f  ]  cis''4 b'4 a'4 |  % 41
 d'8. [  e'16 ]  fis'4 b'4 e'8. [  e'16 ]  |  % 42
 fis'8. [  fis''16 ] 
% *** |Text|Text:"espr."|Font:StaffItalic|Pos:-10 ***

 fis''16 (  [  g''16 )  fis''16 (  e''16 )  ]  d''8. [  d''16 ]  d''16 (  [  e''16 )  d''16 (  cis''16 )  ]  |  % 43
 b'4 d''4 d''16 (  [  c''16 )  b'16 (  c''16 )  ]  a'8. [  a'16 ]  |  % 44
 a'8. [  a''16 ]  a''16 (  [  b''16 )  a''16 (  g''16 )  ]  fis''8. [  fis''16 ]  fis''16 (  [  g''16 )  fis''16 (  e''16 )  ]  |  % 45
 d''16 (  [  c''16 )  b'16 (  c''16 )  ]  a'8. [  a'16 ]  g'8 [  d''8 ]  cis''8. [  cis''16 ]  |  % 46
 d''8 d''4 cis''4 b'4 a'8 ~  |  % 47
 a'8 g'4 fis'8 ~  fis'8. [  e'16 ]  e'4 |  % 48
 fis'8 fis''4 e''8\cresc   d''8\<  d'''4 c'''8 |  % 49
 b''4 d'''8 (  [  a''8 )  ]  b''4 a''4 |  % 50
 a''4\! \f  a'8. (  [  g'16 )  ]  fis'4 fis''8. (  [  e''16 )  ]  |  % 51
 d''4. d''8 d''4 cis''4 |  % 52
 d''8 [  d'8 ]  cis'8 [  cis''8 ]  b'8 [  b8 ]  a8 [  a'8 ]  |  % 53
 g'8 [  g''8 ]  fis''8 [  fis'8 ] \cresc   e'8\<  [  b'8 ]  e'8 [  e''8 ]  |  % 54
 fis''8\! \ff  [  fis'8 ]  e'8 [  e''8 ]  d''8 [  d'8 ]  cis'8 [  cis''8 ]  |  % 55
 b'8 [  b''8 ]  a''8 [  a'8 ]  b'8. [  e''16 ]  a'8 [  a'8 ]  |  % 56
 a'4\fermata  r4  r2  \bar "|."
 }
  \header {
  piece = "Sostenuto"
 }
}

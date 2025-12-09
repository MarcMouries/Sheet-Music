\version "2.19.13"
\language "english"
\include "../../common/violin-functions.ly"

%ADD slide on G
%http://lsr.di.unimi.it/LSR/Item?id=633


\header {
  title = "Misty"
  composer = "Erroll Garner"
  country = "USA"
  subtitle = "Stéphane Grappelli arrangement"
  opus = "transcribed by Marc Mouries"
  genre = "Jazz"
}

\include "../../common/common-header.ily"
#(set-global-staff-size 20)

\paper {
  #(set-paper-size "letter")
  ragged-last-bottom = ##f
  system-count = 8
}

melody = \relative c' {
  \time 4/4
  \key c \major
  \tempo 4 = 76
  r4  g'2 e8  b8  b8(  b2.)  r4
  r4  g16[ a  bf d] a'8 a a8 ~ a2 r2
  g4  e16 ef d c a8 a8 a8 ~ a8
  af8  bf16  af g  af! \glissando g'4  g4
  f8 f g8 f e4 e
  r8  f8 g a g d c4
  r8 d8 d e f4 a,4

    s8^"1:43" b16 c b bf b c d e f g a b d4

    b8  bf8 a4-0 a-2 a  r4
    g4^"gliss" f16 g f e f d'4 c
    s8 s s s s s s s s
    s1 s s
    s1 s s
    s1 s s
    s1
}

\score {
    \new Staff { \transpose g g \melody }
  \layout { }
}
\score {
    \new Staff { \melody }
  \layout { }
  \midi { \tempo 4 = 76 }
}

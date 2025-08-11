\version "2.24.2"
\language "english"

\header {
  title = "Odissea veneziana"
  subtitle = "Rondo Veneziano"
  composer = "G. P. Reverberi & D. Farina"
  tagline = ""
}
%#(set-global-staff-size 16) % Default is usually 20.

violinOne = \relative c'' {
  \clef treble
  \key a \minor
  \time 4/4
  \tempo "Moderato" 4 = 92

  % Page 40 - Line 1
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
  \break
  % Page 40 - Line 2
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
  b16 e, gs e a e b' e, c' e, d' e, e' e, c' e, |
\break
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
  % Page 40 - Line 3
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
  \break
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
  b16 e, gs e a e b' e, c' e, d' e, e' e, c' e, |
\break
  % Page 40 - Line 4
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
 \break
  a16 e' d  e c d b  c  a  b  c  b  d  c  b  c |
%\break
  % Page 41 - Line 1
  b16 e, gs e a e b' e, c' e, d' e, e' e, c' e, |
  \break
  a16 e' d e c d b c a b c b d c b c |
  a16 e' d e c d b c a b c b d c b c |
\break
  % Page 41 - Line 2
  a16 e' d e c d b c a b c b d c b c |
  b16 e, gs e a e b' e, c' e, d' e, e' e, c' e, |


\break
\key d \minor
  % Page 41 - Line 3 (measure 17)
  d'16 a' g a f g e f d e f e g f e f |
  d16  a' g a f g e f d e f e g f e f |
  \break
  d16  a' g a f g e f d e f e g f e d |
  % Page 41 - Line 4 (measure 20)
  e16 a, cs a d a e' a, f' a, g' a, a' a, f' a, |
\break
  d16 bf' a bf g a f g-1 e-3 f d e c-1 c' bf c |
  a bf g a  f g e f d d' c d bf c a bf |
  \break
  % Page 41 - Line 5 (measure 23)
  g16  a  f   g  
  e16  f  d   e 
  cs   a  cs  e
  a    g  e   f |
  d4   a'2 
  \tuplet 3/2 {a8 g f} |
  e8 f16 d ~ d2. |



}

\score {
  \new Staff \violinOne
}

\version "2.24.0"
\language "english"
\include "../common/bars-per-line-engraver.ly"
\include "../common/violin-functions.ly"

\header {
  title = "Manhã De Carnaval"
  composer = "Luiz Bonfá"
  arranger = "As performed by Itzhak Perlman"
  country = "Brazil"
  style = "bossa nova"
}

\include "../common/common-header.ily"

global = {
  \time 4/4
  \key g \minor
}

chordNames = \chordmode {
  \global
  s4 g:m

}

melody = \relative c' {
  \set Score.markFormatter = #format-mark-box-alphabet
 % \override Score.KeySignature.break-align-anchor-alignment = #LEFT
  \override Score.KeySignature.break-align-anchor = #-4
  \global
\mark \default
\partial 4 d4_2

  bf'2_3 ~ \tuplet 3/2 {bf4 a g}
  g2   ~ \tuplet 3/2 {g4 fs a_3}
  d,1_3  ~ d2. d4_2
  bf'2 ~ \tuplet 3/2 {bf4 a g}
  g2   ~ \tuplet 3/2 {g4  f a_3}
  d,1_3  ~ d2 \tuplet 3/2 {d4_1 ef f }
  g4. c,8 c2 ~
  c2 \tri {c4 d ef!}
  f4. bf,8 bf 2 ~
  bf2 \tri {bf4 c d}
  ef4. a,8 a2 ~ a2 \tri {a4 bf c}
  d1 ~
  %% Measure with Ossia - Start
<<
	% measure that runs in parallel of the ossia
	{ d2 r4 d4_2}

	% ossia 1
	\new Staff \with  {
	\remove "Time_signature_engraver"
	firstClef = ##f
	\override StaffSymbol #'staff-space = #(magstep -2)
	}
 	{
	d2 ^"Perlman" r8 d8-2\upbow ( { ef16 d cs d)}
	}
%% Measure with Ossia - End
>>




\mark \default
  bf'2 ~ \tri {bf4 a g}
  g2   ~ \tri {g4 fs a}
  d,1  ~ d2. d4_2

  af'2_3 ~ \tri {af4 g_3 f_2}
 f2_2   ~ \grace { g8  f} ef4._1 d8_1
  g1_4  ~ g2 r4 c,4

  c2 ~ \tri {c4 d ef \glissando}
   a1^"G"_3
  r4 bf, \tri {bf c d}

  	%% Measure with Ossia - Start
	<<
	    % measure that runs in parallel of the ossia
	    { g2. fs4}

	    % ossia 1
	    \new Staff \with  {
	         \remove "Time_signature_engraver"
	         firstClef = ##f
	         \override StaffSymbol #'staff-space = #(magstep -2)
	       }
 	       {
	          g2. ^"Perlman" f16. g32 f16 ef16
	       }
	%% Measure with Ossia - End
	>>

  d1 ~ d2 \tri{d4 fs a}
  g1 ~
  g2  \tri {r4 g a}
\mark \default
  \tri {bf4 c bf} \tri {a4 g a}
  \tri {bf4 c bf} \tri {a4 g a}
  \tri {bf4 c bf} \tri {a4 g f}
  g1
}

words = \lyricmode {
}


  violonDeux = \relative c'' {

  r4
  g2_3 ~ \tuplet 3/2 {g4 f ef}
  e2   ~ \tuplet 3/2 {e4 ds f}
  b,1  ~ b2. b4
  g'2 ~ \tuplet 3/2 {g4 f e}
  e2   ~ \tuplet 3/2 {e4  d f}
  b,1  ~ b2 \tuplet 3/2 {b4 c d }
  e4. a,8 a2 ~
  a2 \tri {a4 b c!}
  d4. g,8 g 2 ~
  g2 \tri {g4 a b}
  c4. fs,8 fs2 ~ fs2 \tri {fs4 g a}
  b1 ~ b2 r4 b4

}



\score {
  <<
    \new ChordNames \chordNames
    \new Staff {    \melody    }
    %\new Staff { \violonDeux }
    \addlyrics { \words }
  >>
\layout {
    \context {
      \Score
      %use the line below to insist on your layout
      %\override NonMusicalPaperColumn.line-break-permission = ##f
      \consists #(bars-per-line-engraver '(4))
    }
  }
  \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 104 4)
       }
     }
}

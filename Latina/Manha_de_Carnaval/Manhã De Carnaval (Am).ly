\version "2.24.0"
\language "english"
\include "../common/bars-per-line-engraver.ly"
\include "../common/violin-functions.ly"

\header {
  title = "Manhã De Carnaval"
  composer = "Luiz Bonfá"
  country = "Brazil"
  style = "bossa nova"
}

\include "../common/common-header.ily"

global = {
  \time 4/4
  \key a \minor
}

chordNames = \chordmode {
  \global
  s8 a2:m b:m

}

melody = \relative c' {
  \set Score.markFormatter = #format-mark-box-alphabet
 % \override Score.KeySignature.break-align-anchor-alignment = #LEFT
  \override Score.KeySignature.break-align-anchor = #-4
  \global
\mark \default
\partial 8 e8_1

  c'4_2 ~ \tuplet 3/2 {c8 b a-0}
  a4-2   ~ \tuplet 3/2 {a8 gs b_3}
  e,2_1  ~ e4. e8_1
  c'4 ~ \tuplet 3/2 {c8 b a}
  a4   ~ \tuplet 3/2 {a8  g b_3}
  e,2_3  ~ e4 \tuplet 3/2 {e8_1 f g }
  a8. d,16 d4-2 ~
  d4 \tri {d8 e f!}
  g8. c,16 c 4 ~
  c4 \tri {c8 d e}
  f8. b,16 b4 ~ b4 \tri {b8 c d}
  e2 ~
  %% Measure with Ossia - Start
<<
  % measure that runs in parallel of the ossia
  { e4 r8 e8_2}

  % ossia 1
  \new Staff \with  {
    \remove "Time_signature_engraver"
    firstClef = ##f
    \override StaffSymbol #'staff-space = #(magstep -2)
  }
    {
      e4 ^"Perlman" r16 e16-2\upbow ( { f32 e ds e)}
    }
%% Measure with Ossia - End
>>

\mark \default
  c'4 ~ \tri {c8 b a}
  a4   ~ \tri {a8 gs b}
  e,2  ~ e4. e8_1

  bf'4^3 ~ \tri {bf8 a_2 g_1}
 g4_3   ~ \grace { a16  g} f8. e16
  a2_2  ~ a4 r8 d,8

  d4 ~ \tri {d8 e-1 f \glissando}
   b2^"G"_3
  r8 c,_1 \tri {c d e}

  	%% Measure with Ossia - Start
	<<
	    % measure that runs in parallel of the ossia
	    { a4. gs8}

	    % ossia 1
	    \new Staff \with  {
	         \remove "Time_signature_engraver"
	         firstClef = ##f
	         \override StaffSymbol #'staff-space = #(magstep -2)
	       }
 	       {
	          a4. ^"Perlman" g32. a64 g32 f32
	       }
	%% Measure with Ossia - End
	>>

  e2 ~ e4 \tri{e8 gs b}
  a2 ~
  a4  \tri {r8 a b}
\mark \default
  \tri {c8 d c} \tri {b8 a b}
  \tri {c8 d c} \tri {b8 a b}
  \tri {c8 d c} \tri {b8 a g}
  a2
}

words = \lyricmode {
}


  violonDeux = \relative c'' {

  r8
  a4_3 ~ \tuplet 3/2 {a8 g f}
  fs4   ~ \tuplet 3/2 {fs8 es g}
  cs,2  ~ cs4. cs8
  a'4 ~ \tuplet 3/2 {a8 g fs}
  fs4   ~ \tuplet 3/2 {fs8  e g}
  cs,2  ~ cs4 \tuplet 3/2 {cs8 d e }
  fs8. b,16 b4 ~
  b4 \tri {b8 cs d!}
  e8. a,16 a 4 ~
  a4 \tri {a8 b cs}
  d8. gs,16 gs4 ~ gs4 \tri {gs8 a b}
  cs2 ~ cs4 r8 cs8

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
    indent = 0
  }
  \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 104 4)
       }
     }
}

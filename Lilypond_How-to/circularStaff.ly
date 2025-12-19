\version "2.19.11"

\score {


  \relative c' {

    \override Staff.StaffSymbol.transparent = ##t
    \override Staff.KeySignature.transparent = ##t
    \override Staff.TimeSignature.transparent = ##t
    \override Staff.BarLine.transparent = ##t
    \override Staff.Clef.transparent = ##t


    % The clef
    \once \override Voice.TextScript.extra-offset = #'(-10.6 . -11.8 )
    s1^\markup { \rotate #90 \musicglyph #"clefs.G" }

    \once \override Voice.TextScript.extra-offset = #'(-17.1 . -8.0 )
    s1^\markup { \rotate #85 \note #"4" #UP }

    \once \override Voice.TextScript.extra-offset = #'(-22.7 . -5.0 )
    s1^\markup { \rotate #60 \note #"4" #UP }

    \once \override Voice.TextScript.extra-offset = #'(-27.9 . -2.8 )
    s1^\markup { \rotate #45 \note #"4" #UP }

    \once \override Voice.TextScript.extra-offset = #'(-33.3 . -1.0 )
    s1^\markup { \rotate #30 \note #"4" #UP }


    \once \override Voice.TextScript.extra-offset = #'(-43.1 . 0.2 )
    s1^\markup { \rotate #40 \beam #3.2 #0 #0.5 }

    \once \override Voice.TextScript.extra-offset = #'(-44.2 . 0.8 )
    s1^\markup { \rotate #0 \note #"4" #UP }
  }
}


circularStaffPS = #"
0.15 setlinewidth
30 0 moveto
20 0 10 0 360 arc
31 0 moveto
20 0 11 0 360 arc
32 0 moveto
20 0 12 0 360 arc
33 0 moveto
20 0 13 0 360 arc
34 0 moveto
20 0 14 0 360 arc
35 0 moveto
20 0 15 0 360 arc
stroke
"


circularStaff =  \markup { \postscript #circularStaffPS }
%\circularStaff

testPS = #"
0.15 setlinewidth
0 0 moveto
20 0 10 0 360 arc
stroke"

test =  \markup { \postscript #testPS }
\test

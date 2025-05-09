\version "2.13.9"

\include "bend.ly"

\pointAndClickOff

\paper {
   indent = 0
   ragged-right = ##f
   ragged-bottom = ##f
   ragged-last-bottom= ##f }

%% the test

test = \relative c'' {
  \bendOn
  % First, some bends to see if they work from the topmost to the lowest string
  c4 ( d )( c2 )
  c4\2 ( d\2 )( c2\2 )
  c4\3 ( des\3 )( c2\3 ) \break
  c,4\4 ( d\4 )( c2\4 )
  c4\5 ( d\5 )( c2\5 )
  c4\6 ( d\6 )( c2\6 ) \break
  % is the bend amount displayed correctly? (should be ½ in both cases)
  c4 ( cis) d ( es )
  % grace notes
  \bendGrace c8(  d4 )( c4 ) r2
  % the distinction between \preBendHold and \preBendRelease is not very
  % elegant here, I hope that there will be a better solution...
  \bendGrace { \preBendHold c8( } d2)  r2
  \bendGrace { \preBendRelease c8( d)( } c2)  r2
  c4 ( es) e\2 ( gis\2 ) %{\break
  % quarter tone bends are not yet supported as they should be, but
  % the bend amount is calculated correctly ;-)
  c,4 ( cih ) c4 ( cisih )
  % I hope that in future releases the tie will recognize automagically
  % that he ties to a note which is bent, but I don't know how (yet).
  \bendGrace c'8 ( \holdBend d2 ) ~ d2 ( c1 )
  c4 ( \shiftBend d) ( e2 )
  \bendOff
  % switching bends off works apparently
  c,4 ( e ) c4 ( f )
  c'4 ( b ) c4 ( a ) %}
}

%{
\markup { First attempt: pointed slurs have a fixed height. }

\score {
  <<
    \new Staff {
      \new Voice {
        \override Voice.Slur #'stencil = #slur::draw-pointed-slur
        \clef "G_8"
        \test
      }
    }
    \new TabStaff {
      \new TabVoice {
        \clef "tab"
        \test
      }
    }
  >>
}

\pageBreak

\markup {Second variant: pointed slurs are drawn tangential to the slur's
starting point and end point.}

\score {
  <<
    \new Staff {
      \new Voice {
      \override Voice.Slur #'stencil = #slur::draw-alternate-pointed-slur
        \clef "G_8"
        \test
      }
    }
    \new TabStaff {
      \new TabVoice {
        \clef "tab"
        \test
      }
    }
  >>
}

\pageBreak

\markup {Third variant: the coordinates of the point are half-way between the
second and the third point of the control points for the slur's bezier curve.}
%}
\score {
  <<
    \new Staff {
      \new Voice {
      \override Voice.Slur #'stencil = #slur::draw-another-alternate-pointed-slur
        \clef "G_8"
        \test
      }
    }
    \new TabStaff {
      \new TabVoice {
        \clef "tab"
        \test
      }
    }
  >>
}
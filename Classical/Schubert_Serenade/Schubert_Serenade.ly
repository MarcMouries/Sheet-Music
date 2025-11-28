\version "2.24"
\language "english"

\header {
  % "Serenade D. 957 No. 4"
  composer = "Franz Schubert"
  country = "Austria"
  title = "Serenade"
  subtitle = "D. 957 No. 4"
  composer = "Franz Schubert"
}


violin = \relative c'' {
  \clef treble
  \key d \minor
  \time 3/4

% rest of 4 measures
\set Score.skipBars = ##t
\once\override MultiMeasureRest.expand-limit = #1
R2. * 4

\tuplet 3/2 {a8_2( bf a)}  d4.-4( a8 )
\tuplet 3/2 {g8_1( a  g)}  d'4.( g,8_1 )
a4.( g8_3) \tuplet 3/2 {g8( f e)}
f2 r4

\break

\once\override MultiMeasureRest.expand-limit = #1
R2. * 2 

% String indication
\once \override TextSpanner.bound-details.left.text = \markup { "Sul D" }
%\once \override TextSpanner.style = #'dashed-line

% Move the tuplet number down
\once \override TupletNumber.Y-offset = #-2

\tuplet 3/2 {a8^2(\startTextSpan bf a)}  f'4.( a,8-2 )
\tuplet 3/2 {g8_1( a  g)}  e'4. -4( d8 )
c4.-2( bf8-1) \tuplet 3/2 {bf8( a g)}
a2 \stopTextSpan r4
\once\override MultiMeasureRest.expand-limit = #1

\break
R2. * 2 
a8.( cs16  ) f4.-3( e8 )
d8.( a16) f4.( d8)
\tuplet 3/2 {   bf'8_3( a bf)} d4.-4( bf8)
a2_2 ~ a4
\tuplet 3/2 {   g8_1( fs_1 g)} bf4.( g8_3)
f!2._2

\break
a8.( cs16  ) f4._3( e8 )
d8.( a16) fs4.( d8)
\tuplet 3/2 {   b'8_3( as b)} d4.-4( b8)
a2._2


}

\score {
  \new Staff \violin
}

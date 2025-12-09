\version "2.19.7"
\language "english"
\include "../../common/violin-functions.ly"

\header {
  title = "Rondo Alla Turca"
  subtitle = "Turkish March"
  composer = "W. A. Mozart"
  country = "Austria"
  piece = "Allegretto"
  mutopiatitle = "Rondo Alla Turca"
  mutopiacomposer = "MozartWA"
  mutopiainstrument = "Piano"
  genre = "Classical"
  copyright = "Public Domain"
  source = "IMSLP"

  maintainer = "Rune Zedeler and Chris Sawer"
  maintainerEmail = "chris@mutopiaproject.org"

 footer = "Mutopia-2007/05/21-108"
 tagline = \markup { \override #'(box-padding . 1.0) \override #'(baseline-skip . 2.7) \box \center-column { \small \line { Sheet music from \with-url #"http://www.MutopiaProject.org" \line { \teeny www. \hspace #-1.0 MutopiaProject \hspace #-1.0 \teeny .org \hspace #0.5 } • \hspace #0.5 \italic Free to download, with the \italic freedom to distribute, modify and perform. } \line { \small \line { Typeset using \with-url #"http://www.LilyPond.org" \line { \teeny www. \hspace #-1.0 LilyPond \hspace #-1.0 \teeny .org } by \maintainer \hspace #-1.0 . \hspace #0.5 Reference: \footer } } \line { \teeny \line { This sheet music has been placed in the public domain by the typesetter, for details see: \hspace #-0.5 \with-url #"http://creativecommons.org/licenses/publicdomain" http://creativecommons.org/licenses/publicdomain } } } }
}



righta = \transpose c c'' {

  \partial 2 b,8-3\p^\sulD ( a, gs, a, |
  c4)-.-4 r d8-3 ^\sulA( c b, c
  e4)-.-4 r f8-4( e ds e )
 | b-3^\sulE (a gs a b a gs a |
  c'2\accent) a4-.-2 c'-.-4 |
  \grace { g!16[( a)] } b4-.-> <fs a>-.-2-4 <e g>-. <fs a>-. |
  \grace { g16[( a)] } b4-.-> <fs a>-.-2-4 <e g>-. <fs a>-. |
  \grace { g16[( a)] } b4-.-> <fs a>-.-1^"shift" <e g-4>-. <ds fs>-.-2-3 |
  e2---2
  \break
}

rightaa = \transpose c c'' {
  \partial 2 b,8\p( a, gs, a, |
  c4)-. r d8( c b, c |
  e4)-. r f8( e ds e |
  b\deprecatedcresc a gs a b a gs a |
  c'2*1/2)\fz s4\p a4-.-2 b-. |
  c'-.\accent b-. a-.-2  gs-.-1 a-.-1 e-. f-.-3 d-. |
  c2-- b,4._3\trill( a,16 b, |
  a,2)--
}

rightb = \transpose c c'' {
   e4[\mp-.-0 <d f>-.] |
  <e g>-.-2-3 <e g>-. a8-3( g f e) |
  << { d2\accent-3 } \\ { b,4-2( g,) } >>

  <c e>4-. <d! f!>-. |
  <e g>-. <e g>-. a8-3( g f e)

\break
  <b, d>2\accent---2-4 <a, c>4-.-1-3 <b, d> |

  <c e>-.-1-3 <c e>-. f8-4( e d c) |
  << { b,2\accent-4 } \\ { gs,4-2( e,) } >> <a, c>4-. <b, d>-. |
  <c e>-. <c e>-. f8( e d c) |
  <gs, b,>2\accent---2-4
}

rightc = \relative c''' {
  <a-1 a,>4-.\f <b b,>-. |
  <cs cs,>2\accent <a a,>4-. <b b,>-. <cs cs,>-.\accent <b b,>-. <a a,>-. <gs-4 gs,>-. |
  <fs fs,>-. <gs gs,>-. <a a,>-. <b b,>-. <gs gs,>-2( <e e,>)-. <a-1 a,>4-. <b b,>-. |
  <cs cs,>2\accent <a a,>4-. <b b,>-. <cs cs,>-.\accent <b b,>-. <a a,>-. <gs-4 gs,>-. |
  <fs fs,>-. <b b,>-. <gs gs,>-. <e e,>-. |
  <a-1 a,>2
}

rightco = \relative c'' {
  a8\f( a' b, b' |
  cs,\accent cs') r4 a,8( a' b, b' cs, cs' b, b' a, a' gs, gs') |
  fs,( fs' gs, gs' a, a' b, b' gs, gs' e, e') a,8( a' b, b' |
  cs,\accent cs') r4 a,8( a' b, b' cs, cs' b, b' a, a' gs, gs') |
  fs,( fs' b, b' gs, gs' e, e' |
}

rightcoa = \transpose c c' {
  <a a'>2)
}

rightd = \relative c''' {
  cs8-3\p d cs b a b a gs-2 fs a gs fs |
  es-1 fs gs es cs-3 ds es-1 cs |
  fs-2 \< es-1 fs-1 gs a gs a-1 b \! |
  cs \> bs cs bs cs d cs b \! |
  a b a gs-2 fs a gs fs |
  e! fs gs e cs-2 ds e cs |
  ds-3 e fs ds bs-1 cs ds! bs |
  cs2--
}

righte = \relative c''' {
  e,8-4(\f\upbow   d! cs b!  )
  a( b cs d) e( fs gs a) |
  a\accent-3( gs fs e)
  e-4\upbow( d cs b) |
  a-0 (b cs d) e( fs gs a) |
  as4\upbow\accent-3( b-.-4) e,8-0\upbow d cs b |
  a( b cs d e fs gs a) |
  a\accent( gs fs e) e-4( d cs b)
  cs e a,( cs-2 b d gs,-2 b-4 |
  a2)-- cs'8\p( d cs b a b a gs fs a gs fs |
  es fs gs es cs ds es cs) |
  fs( \< es fs gs a gs a b\! |
  cs-3 bs cs bs cs\deprecatedcresc bs cs as-1 |
  d)-4( \> cs d cs d cs d cs |
  d cs b a gs-2 a b gs\! |
  a\p b cs fs,-2 es fs gs es fs2)--
}

strum = \transpose c c { <<
  { cs'1\arpeggio\accent } \\
  { <cs e a>2\arpeggio }
>>
}

rightf = \transpose c c'' {
  << { cs'4. cs'8} \\ { cs2 } >> |
  << \strum \\ s2\f >> |
  \strum |
  d'8-4( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  <d' a fs>1\accent |
  \repeat unfold 4 { \grace d'4( <cs' a e>4)-. } |
  << { b2.-3( e'4)-. } \\ { <gs e>1 } >> |
  << \strum \\ s2\f >> |
  \strum |
  d'8( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  <d' a fs>1\accent |
  \grace d'4( <cs' a e>1)-. |
  \repeat unfold 4 { \grace cs'4( <b gs e>4)-. } |

  a2\p-- \grace { e16[( a)] } cs'4.-.-4 cs'8 |
  \repeat unfold 2 { \grace { e16[( a)] } cs'1\accent } |
  d'8( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  d'1\accent |
  \repeat unfold 4 { \grace { d'4( } cs'4)-. } |
  b2.-2( e'4)-. |
  << \strum \\ s2\f >> |
  \strum |
  d'8( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  <d' a fs>1\accent |
  \grace { d'4( } <cs' a e>1)-. |
  \repeat unfold 4 { \grace { cs'4( } <b gs e>4)-. } |
  <a, cs e a-->2. <cs cs'>4-. |
  <a, a-->2. <e e'>4-. |
  <a, a-->2. <cs cs'>4-. |
  <a, a>-.\f <cs cs'>4-. <a, a>-. <e e'>4-. |
  <a, a>2-. <a, cs e a >2-.(\ff |
  <a, cs e a >2)-. r2
}


stra = {
  \grace { a,16[( cs  e)] }
  a4-.-> a-.
}

strd = {
  \grace { d,16[( fs,  a,)] }
  d4-.-> d-.
}

strdis = {
  \grace { ds,16[( fs,  a,)] }
  ds4-.-> ds-.
}

stre = {
  \grace { e,16[( gs,  b,)] }
 e4-.-> e-.
}

stral = { \stra a4-. a-. }
strdl = { \strd d4-. d-. }
strel = { \stre e4-. e-. }


right = {
  \clef G
  \key a \minor
  \mark \default \repeat volta 2 { \righta }
  \mark \default \repeat volta 2 {
    \rightb
    \rightaa
  }
  \break
  \key a \major
  \mark \default \repeat volta 2 { \rightc } \break
  \mark \default \repeat volta 2 { \rightd } \break

\mark \default \repeat volta 2 { \righte } \break
%{

  \repeat volta 2 { \rightc } \break
  \key a \minor
  \repeat volta 2 { \righta }
  \repeat volta 2 { \rightb \rightaa }
  \key a \major
  \repeat volta 2 { \rightco }
     \alternative {
       { \partial 4 \rightcoa }
       { \grace { s32*3 } \rightcoa }
  }
  \rightf
  %}
  \bar "|."
}


\score {
  \new PianoStaff
  <<
    \new Staff {
      \time 2/4
      \right
    }
  %  \new Staff {      \left  }
  >>
  \layout {indent= 0.5\cm}
  %\midi {}
}
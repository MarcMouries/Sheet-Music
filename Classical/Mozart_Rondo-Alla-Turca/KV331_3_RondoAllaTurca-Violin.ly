\version "2.19.80"
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
 tagline = \markup { \override #'(box-padding . 1.0) \override #'(baseline-skip . 2.7) \box \center-column { \small \line { Sheet music from \with-url "http://www.MutopiaProject.org" \line { \teeny www. \hspace #-1.0 MutopiaProject \hspace #-1.0 \teeny .org \hspace #0.5 } • \hspace #0.5 \italic Free to download, with the \italic freedom to distribute, modify and perform. } \line { \small \line { Typeset using \with-url "http://www.LilyPond.org" \line { \teeny www. \hspace #-1.0 LilyPond \hspace #-1.0 \teeny .org } by \maintainer \hspace #-1.0 . \hspace #0.5 Reference: \footer } } \line { \teeny \line { This sheet music has been placed in the public domain by the typesetter, for details see: \hspace #-0.5 \with-url "http://creativecommons.org/licenses/publicdomain" http://creativecommons.org/licenses/publicdomain } } } }
}


#(set-global-staff-size 22)



righta = \transpose c \targetKey'' {

  \partial 4 b,16-3\p^\sulD ( a, gs, a, |
  c8)-.-4 r d16-3 ^\sulA( c b, c
  e8)-.-4 r f16-4( e ds e )
 | b-3^\sulE (a gs a b a gs a |
  c'4\accent) a8-.-2 c'-.-4 |
  \grace { g!32[( a)] } b8-.-> <fs a>-.-2-4 <e g>-. <fs a>-. |
  \grace { g32[( a)] } b8-.-> <fs a>-.-2-4 <e g>-. <fs a>-. |
  \grace { g32[( a)] } b8-.-> <fs a>-.-1^"shift" <e g-4>-. <ds fs>-.-2-3 |
  e4---2
  \break
}

rightaa = \transpose c \targetKey'' {
  \partial 4 b,16\p( a, gs, a, |
  c8)-. r d16( c b, c |
  e8)-. r f16( e ds e |
  b\deprecatedcresc a gs a b a gs a |
  c'4*1/2)\fz s8\p a8-.-2 b-. |
  c'-.\accent b-. a-.-2  gs-.-1 a-.-1 e-. f-.-3 d-. |
  c4-- b,8._3\trill( a,32 b, |
  a,4)--
}

rightb = \transpose c \targetKey'' {
   e8[\mp-.-0 <d f>-.] |
  <e g>-.-2-3 <e g>-. a16-3( g f e) |
  << { d4\accent-3 } \\ { b,8-2( g,) } >>

  <c e>8-. <d! f!>-. |
  <e g>-. <e g>-. a16-3( g f e)

\break
  <b, d>4\accent---2-4 <a, c>8-.-1-3 <b, d> |

  <c e>-.-1-3 <c e>-. f16-4( e d c) |
  << { b,4\accent-4 } \\ { gs,8-2( e,) } >> <a, c>8-. <b, d>-. |
  <c e>-. <c e>-. f16( e d c) |
  <gs, b,>4\accent---2-4
}

rightc = \relative c''' {
  <a-1 a,>8-.\f <b b,>-. |
  <cs cs,>4\accent <a a,>8-. <b b,>-. <cs cs,>-.\accent <b b,>-. <a a,>-. <gs-4 gs,>-. |
  <fs fs,>-. <gs gs,>-. <a a,>-. <b b,>-. <gs gs,>-2( <e e,>)-. <a-1 a,>8-. <b b,>-. |
  <cs cs,>4\accent <a a,>8-. <b b,>-. <cs cs,>-.\accent <b b,>-. <a a,>-. <gs-4 gs,>-. |
  <fs fs,>-. <b b,>-. <gs gs,>-. <e e,>-. |
  <a-1 a,>4
}

rightco = \relative c'' {
  a16\f( a' b, b' |
  cs,\accent cs') r8 a,16( a' b, b' cs, cs' b, b' a, a' gs, gs') |
  fs,( fs' gs, gs' a, a' b, b' gs, gs' e, e') a,16( a' b, b' |
  cs,\accent cs') r8 a,16( a' b, b' cs, cs' b, b' a, a' gs, gs') |
  fs,( fs' b, b' gs, gs' e, e' |
}

rightcoa = \transpose c \targetKey' {
  <a a'>4)
}

rightd = \relative c''' {
  cs16-3\p d cs b a b a gs-2 fs a gs fs |
  es-1 fs gs es cs-3 ds es-1 cs |
  fs-2 \< es-1 fs-1 gs a gs a-1 b \! |
  cs \> bs cs bs cs d cs b \! |
  a b a gs-2 fs a gs fs |
  e! fs gs e cs-2 ds e cs |
  ds-3 e fs ds bs-1 cs ds! bs |
  cs4--
}

righte = \relative c''' {
  e,16-4(\f\upbow   d! cs b!  )
  a( b cs d) e( fs gs a) |
  a\accent-3( gs fs e)
  e-4\upbow( d cs b) |
  a-0 (b cs d) e( fs gs a) |
  as8\upbow\accent-3( b-.-4) e,16-0\upbow d cs b |
  a( b cs d e fs gs a) |
  a\accent( gs fs e) e-4( d cs b)
  cs e a,( cs-2 b d gs,-2 b-4 |
  a4)-- cs'16\p( d cs b a b a gs fs a gs fs |
  es fs gs es cs ds es cs) |
  fs( \< es fs gs a gs a b\! |
  cs-3 bs cs bs cs\deprecatedcresc bs cs as-1 |
  d)-4( \> cs d cs d cs d cs |
  d cs b a gs-2 a b gs\! |
  a\p b cs fs,-2 es fs gs es fs4)--
}

strum = \transpose c \targetKey { <<
  { cs'2\arpeggio\accent } \\
  { <cs e a>4\arpeggio }
>>
}

rightf = \transpose c \targetKey'' {
  << { cs'8. cs'16} \\ { cs4 } >> |
  << \strum \\ s4\f >> |
  \strum |
  d'16-4( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  <d' a fs>2\accent |
  \repeat unfold 4 { \grace d'8( <cs' a e>8)-. } |
  << { b4.-3( e'8)-. } \\ { <gs e>2 } >> |
  << \strum \\ s4\f >> |
  \strum |
  d'16( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  <d' a fs>2\accent |
  \grace d'8( <cs' a e>2)-. |
  \repeat unfold 4 { \grace cs'8( <b gs e>8)-. } |

  a4\p-- \grace { e32[( a)] } cs'8.-.-4 cs'16 |
  \repeat unfold 2 { \grace { e32[( a)] } cs'2\accent } |
  d'16( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  d'2\accent |
  \repeat unfold 4 { \grace { d'8( } cs'8)-. } |
  b4.-2( e'8)-. |
  << \strum \\ s4\f >> |
  \strum |
  d'16( cs')-. b-. cs'-. d'( cs')-. b-. cs' |
  <d' a fs>2\accent |
  \grace { d'8( } <cs' a e>2)-. |
  \repeat unfold 4 { \grace { cs'8( } <b gs e>8)-. } |
  <a, cs e a-->4. <cs cs'>8-. |
  <a, a-->4. <e e'>8-. |
  <a, a-->4. <cs cs'>8-. |
  <a, a>-.\f <cs cs'>8-. <a, a>-. <e e'>8-. |
  <a, a>4-. <a, cs e a >4-.(\ff |
  <a, cs e a >4)-. r4
}


stra = {
  \grace { a,32[( cs  e)] }
  a8-.-> a-.
}

strd = {
  \grace { d,32[( fs,  a,)] }
  d8-.-> d-.
}

strdis = {
  \grace { ds,32[( fs,  a,)] }
  ds8-.-> ds-.
}

stre = {
  \grace { e,32[( gs,  b,)] }
 e8-.-> e-.
}

stral = { \stra a8-. a-. }
strdl = { \strd d8-. d-. }
strel = { \stre e8-. e-. }


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



targetKey = c

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

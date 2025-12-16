\version "2.24.0"
\language "english"

\header {
  title = "In the Hall of the Mountain King"
  subtitle = "In der Halle des BergkÃ¶nigs"
  subsubtitle = "(From Peer Gynt Suite I)"
  instrument = "Piano"
  composer = "Edvard Grieg"
  arranger = "Edvard Grieg"
  opus = "op. 46, no. 4"
  mutopiacomposer = "GriegE"
  mutopiaopus = "Op. 46, No. 4"
  mutopiainstrument = "Piano"
  date= "1874"
  source = "The University Society, 1918"
  style = "Classical"
  copyright = "Public Domain"
  maintainer = "Coyau"
  moreInfo = "scan: http://imslp.org/wiki/Special:ReverseLookup/581"
  %tagline = ##f

 footer = "Mutopia-2013/12/07-1888"
 tagline = \markup { \override #'(box-padding . 1.0) \override #'(baseline-skip . 2.7) \box \center-column { \abs-fontsize #10 \line { Sheet music from \with-url "http://www.MutopiaProject.org" \line { \concat { \abs-fontsize #8 www. \abs-fontsize #11 MutopiaProject \abs-fontsize #8 .org } \hspace #0.5 } â€¢ \hspace #0.5 \italic Free to download, with the \italic freedom to distribute, modify and perform. } \line { \abs-fontsize #10 \line { Typeset using \with-url "http://www.LilyPond.org" \line { \concat { \abs-fontsize #8 www. \abs-fontsize #11 LilyPond \abs-fontsize #8 .org }} by \concat { \maintainer . } \hspace #0.5 Reference: \footer } } \line { \abs-fontsize #8 \line { This sheet music has been placed in the public domain by the typesetter, for details \concat { see: \hspace #0.3 \with-url "http://creativecommons.org/licenses/publicdomain" http://creativecommons.org/licenses/publicdomain } } } } }
}

global = {
  \key b \minor
  \time 4/4
  \tempo "Alla marcia molto marcato" 4=138
}

rightOne = \relative c''' {
  \global
 % \clef bass
  \stemNeutral
  <fs,, fs'>1\p\fermata->
  b,8-.\pp cs-._\markup {\italic {e sempre staccato}} d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  \break
  b8-. cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. <a, a'>2->
  \break
  fs8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs8-.-> as-. cs4-.
  fs,8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs2->
  \break
  fs8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs8-.-> as-. cs4-.
  fs,8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. <cs, cs'>2->
  \break
  b,8\pp-. cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  \pageBreak
  b8-. cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. <a, a'>2->
  \break
  \clef treble
  b'8-. cs-. <fs, d'>-. e'-. fs-.-> d-. <fs, fs'>4-.
  es'8-.-> cs-. <es, es'>4-. e'8-.->  c-. <e, e'>4-.
  b'8-. cs-. <fs, d'>-. e'-. fs-. d-. fs-. b-.
  a8-. fs-. <a, d>-. fs'-. a2->
  \break
  \stemUp
  b8-. cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-. d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  \break
  fs,8-.\cresc gs-. as-. b-. cs-.-> as-. cs4
  d8-.-> as-. d4 cs8-.-> as-. cs4
  fs,8-. gs-. as-. b-. cs-.-> as-. cs4
  d8-.-> as-. d4 cs2->
  \break
  \stemNeutral
  fs8-. gs-. <fs as>-. b-. cs-.-> as-. <fs as cs>4-.
  d'8-.-> as-. < fs as d>4-. cs'8-.-> as-. <fs as cs>4-.
  fs8-. gs-. <fs as>-. b-. cs-.-> as-. <fs as cs>4-.
  d'8-.-> as-. <fs as d>4-. \stemUp cs'2
  \pageBreak
  \stemNeutral
  b,,8-.\mf cs-.\cresc <fs, d'>-. e'-. fs-.-> d-. <fs, fs'>4-.
  es'8-.-> cs-. <fs, es'>4-. e'8-.-> c-. <fs, es'>4-.
  b8-. cs-. <fs, d'>-. e'-. fs-. d-. <b fs'>-. b'-.
  \break
  a-. fs-. <a, e'>-. fs'-. \stemUp a2->
  b8-. cs-. d-. e-. fs-.-> d-. fs4
  es8-.-> cs-. es4-. e8-. c-. e4
  \break
  b8-. cs-. d-. e-. fs-. d-. fs-. b-.
  fs-. d-. fs-. b-. b,2->
  \tempo "PiÃ¹ vivo" 4=154
  \ottava #1
  b'8-.->\ff cs-. d-. e-. fs-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  \break
  b8-. cs-. d-. e-. fs-. d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  b,8-> cs-. d-. e-. fs-> d-. fs4-.
  es8-> cs-. es4-. e8-> c-. e4-.
  \break
  b8-. cs-. d-. e-. fs-. d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  fs8-._\markup {\italic { sempre stretto sin al fine } } gs-. as-. b-. cs-> as-. cs4->
  <d, fs d'>8-> as'-. <d, fs d'>4->
  \stemNeutral
  <cs fs cs'>8-> as'-. <cs, fs cs'>4->
  \break
  \stemNeutral
  fs8-. <fs g>-. <fs as>-. <fs b>-. <cs fs cs'>8-> <cs fs as>-. <cs fs cs'>4->
  <d fs d'>8-> <d fs as>-. <d fs d'>4-> <cs fs cs'>2->
  \stemUp
  fs8-. gs-. as-. b-. cs-> as-. cs4->
  \stemNeutral
  <ds, fs ds'>8 as'-. <ds, fs ds'>4-> <cs fs cs'>8-> as'-. <cs, fs cs'>4->
  \pageBreak
  fs8-. <fs g>-. <fs as>-. <fs b>-. <cs fs cs'>8-> <cs fs as>-. <cs fs cs'>4->
  <d fs d'>8-> <d fs as>-. <d fs d'>4-> <cs fs cs'>2->
  \stemUp
  b8-. cs-. d-. e-. fs-> d-. fs4->
  es8-> cs-. es4-. e8-> c-. e4-.
  \break
  b8-. cs-. d-. e-. fs-. b,-. fs'-. b-.
  a-. fs-. d-. fs-. a2->
  \stemNeutral
  b,8-. <b cs>-. <b d>-. <b e>-. <b fs'>-> <b d>-. <b d fs>4-.
  <b es>8-> <b cs>-. <b cs es>4-. <b e>8-> <b c>-. <b c e>4-.
  \break
  b8-. <b cs>-. <b d>-. <b e>-. <b fs'>-. <b d>-.  <b fs'>-. <b b'>-.
  <b fs'>-. <b d>-.  <b fs'>-. <b b'>-. b2->
  r4 \appoggiatura { gs'16[ a as] } <d, b'>4-.\sfz r2
  r4 \appoggiatura { gs16[ a as] } <d, b'>4\sfz-.\ottava #0 r2
  \break
  b,8-. cs-. d-. e-. fs-. d-. fs-. b-.
  as-. fs-. as-. cs-. b2->
  r4 \ottava #1 \appoggiatura { gs'16[ a as] } <d, b'>4-.\sfz r2
  r4 \appoggiatura { gs16[ a as] } <d, b'>4\sfz-. r2
  b8-. cs-. d-. e-. fs-. d-. fs-. b-.
  \break
  as-. fs-. as-. cs-. b2->
  r4 \appoggiatura { gs16[ a as] } <d, b'>4-.\sfz r2
  r4 \appoggiatura { gs16[ a as] } <d, b'>4\sfz-. r2
  r4 \appoggiatura { gs16[ a as] } <d, b'>4\pp \appoggiatura { gs16[ a as] } <d, b'>4 \appoggiatura { gs16[ a as] } <d, b'>4
  \appoggiatura { gs16[ a as] } <d, b'>4\cresc \appoggiatura { gs16[ a as] } <d, b'>4 \appoggiatura { gs16[ a as] } <d, b'>4 \appoggiatura { gs16[ a as] } <d, b'>4 \ottava #0
  r1
  r1
  r4\ff \ottava #1 \appoggiatura { gs16[ a as] } <d, b'>4\ottava#0 r2 \bar "|."
}

rightTwo = \relative c'' {
  \global
  \stemDown
  s1*28
  s2 r4 <a, d>4

  r4 fs' r fs
  r fs r fs
  r fs r2
  r4 a r <a d>

  r fs r < fs as>
  r <fs as> r <fs as>
  r fs r <fs as>
  r <fs as> r <fs as>

  s1*3
  s2 r4 <fs' as>

  s1*3

  s2 r4 <a,, e'>
  r fs' r fs
  r fs r fs

  s2 r4 <b d>
  r <b d> s2
  b'2 b
  b b

  b b
  <a d> <a d>
  b b
  b b

  b b
  <a d> <a d>
  fs' <cs fs>4 <cs fs>
  s1

  s1*2
  fs2 <cs fs>4 < cs fs>
  s1

  s1*2
  b2 b
  b b

  b2 b
  <a d> <a d>
  s1*2

  s1*17
}

left = \relative c' {
  \global
  r1\fermata
  b,,,4-.\pp fs'-. b,-. fs'-.
  b,4-. fs'-. b,-. fs'-.
  b,4-. fs'-. b,-. fs'-.
  d4-. a'-. d,-. a'-.

  b,4-. fs'-. b,-. fs'-.
  b,4-. fs'-. b,-. fs'-.
  b,4-. fs'-. b,-. fs'-.
  d4-. a'-. d,-. a'-.

  fs cs' fs, cs'
  d, as' fs cs'
  fs, cs' fs, cs'
  d, as' fs cs'

  fs, cs' fs, cs'
  d, as' fs cs'
  fs, cs' fs, cs'
  d, as' fs cs'

  b,4-. fs'-. b,-. fs'-.
  b,4-. fs'-. b,-. fs'-.
  b,4-. fs'-. b,-. fs'-.
  d4-. a'-. d,-. a'-.

  b,4-. fs'-. b,-. fs'-.
  b,4-. fs'-. b,-. fs'-.
  b,4-.  b'-. a-. g-.
  fs4-. e-. cs-. b-.

  \set Staff.pedalSustainStyle = #'mixed
  b\sustainOn <fs'' d'>16(\sustainOff es fs8) b,4-.\sustainOn <fs' d'>16( es fs8)
  b,4-.\sustainOff\sustainOn <fs' cs'>16(\sustainOff es fs8) b,4-.\sustainOn <fs' c'>16( es fs8)
  b,4-.\sustainOff\sustainOn <fs' d'>16(\sustainOff es fs8) b,4-.\sustainOn <fs' d'>16( es fs8)
  d4-.\sustainOff\sustainOn <a' fs'>16(\sustainOff gs a8) d,4-.\sustainOn <a' fs'>16( gs a8)

  b,4-.\sustainOff\sustainOn <fs' d'>16(\sustainOff es fs8) b,4-.\sustainOn <fs' d'>16( es fs8)
  b,4-.\sustainOff\sustainOn < fs' cs'>16(\sustainOff es fs8) b,4-.\sustainOn <fs' d'>16( es fs8)
  b,4-.\sustainOff\sustainOn < fs' d'>16(\sustainOff es fs8) b,4-.\sustainOn < fs' d'>16( es fs8)
  d4-.\sustainOff\sustainOn <a' fs'>16(\sustainOff gs a8) d,4-.\sustainOn <a' fs'>16( gs a8)

  fs4-.\sustainOff\sustainOn <cs' as'>16(\sustainOff bs cs8) fs,4-.\sustainOn <cs' as'>16( bs cs8)
  d,4-.->\sustainOff\sustainOn <d' as'>16(\sustainOff cs d8) fs,4-.\sustainOn <cs' as'>16( bs cs8)
  fs,4-.\sustainOff\sustainOn <cs' as'>16( bs cs8)  fs,4-.\sustainOn <cs' as'>16( bs cs8)
  d,4-.->\sustainOff\sustainOn <d' as'>16(\sustainOff cs d8) fs,4-.\sustainOn <cs' as'>16( bs cs8)

  fs,4-.\sustainOff\sustainOn <cs' as'>16(\sustainOff bs cs8) fs,4-.\sustainOn <cs' as'>16( bs cs8)
  d,4-.->\sustainOff\sustainOn <d' as'>16(\sustainOff cs d8) fs,4-.\sustainOn <cs' as'>16( bs cs8)
  fs,4-.\sustainOff\sustainOn <cs' as'>16( bs cs8)  fs,4-.\sustainOn <cs' as'>16( bs cs8)
  d,4-.->\sustainOff\sustainOn <d' as'>16(\sustainOff cs d8) fs,4-.\sustainOn <cs' as'>16( bs cs8)

  \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] } \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] }
  \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { cs' es, fs] } \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { c' es, fs] }
  \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] } \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] }

  \tuplet 3/2 { d8[\sustainOff\sustainOn gs a } \tuplet 3/2 { fs' gs, a] } \tuplet 3/2 { d,8[\sustainOff\sustainOn gs a } \tuplet 3/2 { fs' gs, a] }
  \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] } \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] }
  \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] } \tuplet 3/2 { b,8[\sustainOff\sustainOn es fs } \tuplet 3/2 { d' es, fs] }

  \tuplet 3/2 { b,8\sustainOff\sustainOn es fs } <b b'>4-.\sustainOff <a b a'>-. <g b g'>-.
  <fs b fs'> <e b' e>-> <d b' d>-> <cs b' cs>->
  <b b'>8->\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.

  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <d d'>8->\sustainOff\sustainOn cs'-. b-. a-. <d, d'>8->\sustainOff\sustainOn cs'-. b-. a-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.

  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <fs fs'>8->\sustainOff\sustainOn e'-. d-. cs-. <fs, fs'>8->\sustainOff\sustainOn e'-. d-. cs-.
  <d, d'>8->\sustainOff\sustainOn cs'-. d-. e-. <fs, fs'>8->\sustainOff\sustainOn e'-. d-. cs-.

  <fs, fs'>8->\sustainOff\sustainOn e'-. d-. cs-. <fs, fs'>8->\sustainOff\sustainOn e'-. d-. cs-.
  <d, d'>8->\sustainOff\sustainOn cs'-. d-. e-. <fs, fs'>8->\sustainOff\sustainOn e'-. d-. cs-.
  <fs, fs'>8->\sustainOff\sustainOn es'-. ds-. cs-. <fs, fs'>8->\sustainOff\sustainOn es'-. ds-. cs-.
  <ds, ds'>8->\sustainOff\sustainOn cs'-. ds-. es-. <fs, fs'>8->\sustainOff\sustainOn es'-. ds-. cs-.

  <fs, fs'>8->\sustainOff\sustainOn es'-. ds-. cs-. <fs, fs'>8->\sustainOff\sustainOn es'-. ds-. cs-.
  <ds, ds'>8->\sustainOff\sustainOn cs'-. ds-. es-. <fs, fs'>8->\sustainOff\sustainOn es'-. ds-. cs-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.

  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <d d'>8->\sustainOff\sustainOn cs'-. a-. g-. <d d'>8->\sustainOff\sustainOn cs'-. a-. g-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.

  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-. <b, b'>8->\sustainOff\sustainOn a'-. g-. fs-.
  <b b,>4->\sustainOff\sustainOn <d es gs b>-.\sustainOff r2
  <b b,>4->\sustainOn <d es gs b>-.\sustainOff r2

  <g, g'>4->\sustainOn <d' g b> <fs, fs'>->\sustainOff\sustainOn <d' fs b>
  <fs, fs,>->\sustainOff\sustainOn <cs' fs as> <b b,>->\sustainOff\sustainOn <d fs b>
  <b b,>4->\sustainOff\sustainOn <d es gs b>-.\sustainOff r2
  <b b,>4->\sustainOn <d es gs b>-.\sustainOff r2
  <g g,>4->\sustainOn <d g b> <fs fs,>->\sustainOff\sustainOn <d fs b>

  <fs, fs,>->\sustainOff\sustainOn <cs' fs as> <b b,>->\sustainOff\sustainOn <d fs b>
  <b b,>4->\sustainOff\sustainOn <d es gs b>-.\sustainOff r2
  <b b,>4->\sustainOn <d es gs b>-.\sustainOff r2
  <b b,>4->\sustainOn <d es gs b>-.\sustainOff <d es gs b>-. <d es gs b>-.


  \set Staff.pedalSustainStyle = #'text
  <d es gs b>-. <d es gs b>-. <d es gs b>-. <d es gs b>-.
  r2 \repeat tremolo 4 {b,16\sustainOn b'}
  \repeat tremolo 4 {b,16\< b'} \repeat tremolo 4 {b,16 b'\!}
  <b, b,>4\ff <b' d fs b>-.\sustainOff r2
}

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "right" \with {
      printPartCombineTexts = ##f
    } {
      \partCombine \rightOne \rightTwo
    }
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
}

\include "articulate.ly"
\score {
  \unfoldRepeats \articulate
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "right" \with {
      printPartCombineTexts = ##f
    } {
      \partCombine \rightOne \rightTwo
    }
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \midi { }
}

%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}

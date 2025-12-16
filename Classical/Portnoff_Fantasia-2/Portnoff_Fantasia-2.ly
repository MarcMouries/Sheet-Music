%%% -*- coding: utf-8 -*-
%%%
%%% Copyright © 2019 Philipp Büttgenbach
%%%
%%% This work is licensed under the Creative Commons
%%% Attribution-ShareAlike 4.0 International License.  To view a copy of
%%% this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
%%%

\version "2.24.0"

\include "mylib.ily"

allargando = \markup {\italic "allargando"}
cadenzaAdLib = \markup {\italic #"Cadenza ad lib."}
espressivoTxt = \markup {\italic "espressivo"}
pMaEspressivo = \markup {\dynamic "p" \italic "ma espressivo"}
pocoRit = \markup {\italic #"poco rit."}
simile = \markup {\italic #"simile"}
tenutoTxt = \markup {\italic "tenuto"}

titleMovementI = #""

globalMovementI = {
  \time 4/4
  \tempo "Andante espressivo" 4=72
  \key d \minor
}

violinMovementI = \relative g {
  a4_\espressivoTxt\glissando( cis8-1 d) e4( cis8\glissando a-1) |
  d4-4 d8-0( e) f4 e8( d) | e4 e8( f) g4 f8( e) | a8-2( d,-0) d-- d-- d2
  \repeat volta 2 {
    g4 g8( bes) d4 c8( bes) | d-1( a-0) a-2 a a4 g8 f-2 |
    a-4( e) e-- f-- g4 f8( e) | a-2( d,-0) d-2 d d2
  }
  a'4( cis8 d-1) e4( cis8-2 a) | d4-1 d8( e) f4 e8( d) |
  e4 e8( f) g4 f8( e) | a8\flageolet( d,-1) d-- d-- d4. d8-3
  \repeat volta 2 {
    g4-2\< g8( bes\!) d4-2\> c8( bes\!) |
    d8\>( a\!) a--( a--) a4 g8-2( f) |
    a8-1\>( e-0\!) e---2 f-- g4 f8( e) |
    a8\flageolet( d,-1) d-- d-- d2\fermata
  }
  \cadenzaOn
  a,4_\fermata^\cadenzaAdLib cis8[( d]) e[( cis) e f] g[( e) g a] \bar ""
  bes[\< a cis d] e-4[ cis\! e-0 g] bes4\fermata\> a\fermata\!
  \cadenzaOff \bar "||" \time 2/4 \tempo "Allegretto" 4=112
  \repeat volta 2 {
    d,8-.-3\p d-. d-. d-. | cis4-> a-> | e'8-.-2 e-. e-. e-. | f4-> d->
  }
  \repeat unfold 4 a'8-. | bes4-> g->-2 | \repeat unfold 4 g8 | a4
  \once \override Hairpin.to-barline = ##f
  f\<(
  \repeat volta 2 {
    a8-1\!) a-. a-. a-. | g4 e | a8 g f e | d2
  }
  \repeat volta 2 {
    <d f,>8\downbow a,16\downbow a a8 <d' f,> |
    <cis e,> a, <a' e> a, |
    <a' e'>8\downbow a,16\downbow a a8 <a' e'> | <a f'> d, d' d,
  }
  \repeat volta 2 {
    <a'' c,>8\downbow d,,16\downbow d d8 <c' a'> |
    <d bes'> d, <bes' g'> d, |
    <bes' g'>8\downbow c,16\downbow c c8 <bes' g'> |
    <c a'> f, <c' f> f, |
    a'8\downbow <a, d,>16\downbow <a d,> <a d,>8 a' |
     <g bes,>8 g,, <bes' e> g, | <a' a'> <a g'> <a f'> <a e'> | <d d,>2
  }
  \repeat volta 2 {
    d16--\f\downbow a-- f-- a-- d-- a-- d-- a-- |
    cis a e a \repeat unfold 2 {cis a} |
    e'-4 a, g a \repeat unfold 2 {e' a,} |
    f'-4 a,-0 f a \repeat unfold 2 {d a} |
  }
  \repeat volta 2 {
    a'16( fis-1) d fis a( fis) d fis | bes( g-2) d g bes( g bes a) |
    \repeat percent 2 { g( e) c e } | a( f-1) c f a( f a g) |
    a( f) d f \repeat unfold 2 {a( f)} |
    g( e) bes e \repeat unfold 2 {g( e)} |
    a( a,) g' a, f' a, e' a,
  }
  \alternative {
    {d a e' a, f' a, g'( a,)} {<d d,>2}
  }
  \bar "|."
}

violinMovementIViolin = \new Voice {
  \cueDuring "pianoUpMovementI" #DOWN R1*2
  \violinMovementI
}
violinMovementIPiano = \new Voice {
  R1*2 | \violinMovementI
}

pianoUpMovementI = \new Voice \relative d'' {
  <d f, d>2\f <cis f, cis> | <gis d gis,>1\> |
  r8\p <a e cis>\arpeggio <cis a e>\arpeggio <d a f>\arpeggio r8 <e cis a>\arpeggio <cis a e>\arpeggio <a e cis>\arpeggio |
  r8 <a f d>\arpeggio <d a f>\arpeggio <e cis a>\arpeggio r8 <f d a>\arpeggio <e cis a>\arpeggio <d a f>\arpeggio |
  r8 <bes g e>\arpeggio <e bes g>\arpeggio <f bes, g>\arpeggio r8 <g cis, bes> <f cis a> <e cis g> |
  r8 <a, f d> <d a f> <f d a> <a f d> <f d a> <d a f> <a f d>
  \repeat volta 2 {
    r8 <d, bes g>\arpeggio <g d bes>\arpeggio <bes g d>\arpeggio r8 <d bes g>\arpeggio <c a d,>\arpeggio <bes g d>\arpeggio |
    r8 <a f d> <d a f> <f d a> r8 <a f d> <g cis, bes> <f d a> | r8 <a e cis a> <e cis g> <f cis a> r8 <g cis, bes> <f cis a> <e cis g> |
    r8 <a, f d> <d a f> <a f d> <d a f>2
  }
  \repeat unfold 2 {r16 a,( cis e a e cis a)} |
  \repeat unfold 2 {r16 a( d f a f d a)} |
  r16 bes( d e bes' e, d bes) r16 a( cis g' a g cis, a) |
  \repeat unfold 2 { r16 a( d f a f d a) }
  \repeat volta 2 {
    r16 bes( d g bes g d bes) r16 d( g bes d bes g d) |
    r16 d( f a d a f d) r16 a( d f a f d a) |
    \repeat unfold 2 {r16 a( cis g' a g cis, a)} |
    r16 a( d f a f d a~) <a d f>2\fermata
  }
  \cadenzaOn <cis e a>4\fermata s4*11 \cadenzaOff \bar "||" \time 2/4
  \repeat volta 2 {
    r8\p <a' f>-. r <a d,> | r <a cis,> r <a e cis> |
    \repeat unfold 2 {r <a g e>} | \repeat unfold 2 {r8 <a f d>}
  }
  \repeat unfold 2 {r8 <a d, c>} | \repeat unfold 2 {r8 <g d bes>} |
  \repeat unfold 2 {r8 <g c, bes>} | \repeat unfold 2 {r8 <f c a>} |
  \repeat volta 2 {
    \repeat unfold 2 {r8 <a f d>} | r8 <bes g d> r <bes e, d> |
    \repeat unfold 2 {r8 <a g cis,>} | <a f d>2
  }
  \repeat volta 2 {
    \change Staff = "down" \voiceOne
    <d, a f>8 r r <d a f> | <cis a e> r <a e> r
    \repeat unfold 2 {<a cis e>8 r} |
    <a d f> r  <f a d> r
    \change Staff = "up" \oneVoice
  }
  \repeat volta 2 {
    <a' fis d>8 r r <a fis d> | <bes g d> r <g d bes> r |
    <g e c> r r <g e c> | <a f c> r r <f c a> | <a d, a> r r <a d, a> |
    <bes d, bes> r <g d bes> r | <a f d> r r <a g cis,> | <a f d>2
  }
  \repeat volta 2 {
    << {\voiceOne r8\f <a f> r <a f> | r <a e> r <e cis> |
        r <g a> r <g a> | r <a d> r <a f>}
       \new Voice {\voiceTwo d,8 d d d | cis4 a | e'8 e e e | f4 d} >>
  }
  \repeat volta 2 {
    << {\voiceOne r8 <d' c> r <d c> | r <d g> r <d bes> |
        r <c bes> r <c bes> | r <c f> r <c a > | a a a a | g4 e }
       \new Voice {\voiceTwo a8 a a a | bes4 g | g8 g g g | a4 f |
                   r8 <f d> r <f d> | r <d bes> r <d bes>} >>
    \oneVoice
    \once \override TextSpanner.bound-details.left.text = \pocoRit
    \once \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
    \textSpannerDown
    <f a>8 \startTextSpan <e g> <d f> <cis e>
  }
  \alternative {
    { d8 <e cis> <f d> <g e> \stopTextSpan } { <f d>2_\rit }
  }
  \bar "|."
}

\addQuote "pianoUpMovementI" \pianoUpMovementI

pianoDownMovementI = \new Voice \relative b {
  bes2 a4. f8 | << {\voiceOne f2 e} \new Voice {\voiceTwo bes1} >> \oneVoice |
  a,2 a' | d, a' | g a | d, d' |
  \repeat volta 2 { g,2 g' | d d' | a a, | d d, }
  a' g' | f d | g, a | d, d'
  \repeat volta 2 { g, g' | f d | e a, | d d,\fermata }
  \cadenzaOn a'4\fermata s4*11 \cadenzaOff \bar "||" \time 2/4
  \repeat volta 2 {
    d8 a' f a | e a a, a' | cis, a' a, a' | d,4 a'
  }
  fis4 d | g f | e c | f e |
  \repeat volta 2 {
    d8 r f r | e r g r | a r a, r | d a d,4
  }
  \repeat volta 2 {
    \voiceTwo d'8 r r d | a r a r | <a a,> r r a, |
    d r d r \oneVoice
  }
  \repeat volta 2 {
    d'8 r r d | g r g, r | c r r c | f r r f, | f' r r f |
    g r g, r | a r r a | d2
  }
  \repeat volta 2 {
    d8 a' f a | e a a, a' | cis, a' a, a' | d, a' f a
  }
  \repeat volta 2 {
    fis d' d, d' | g, d' f, d' | e, c' c, c' | f, c' e, c' |
    d, r f r | e r g r | <a a,> a a, a'
  }
  \alternative {
    {d,8 r r4} {d8 a d,4}
  }
  \bar "|."
}

%%% ------------

\header {
  arranger = ##f
  composer = "Leo Portnoff"
  copyright = \copyrightText
  tagline = ##f
  enteredby = "Philipp Büttgenbach"
  opus = "Fantasia 2"
  source = "http://imslp.org/"
  title = "Russian Fantasia No. 2"
}

\paper {
  #(set-paper-size "c4")
  binding-offset = 4\mm
  page-breaking = #ly:page-turn-breaking
  two-sided = ##t
}

define(`PianoMovement', `\score {
    <<
      \new Staff \with {
        fontSize = #-3
        \override StaffSymbol.staff-space = #(magstep -3)
      } { \globalMovement$1 \violinMovement$1Piano }
      \new PianoStaff <<
        \new Staff = "up" \with {
          \accidentalStyle modern-cautionary
        } {
          \globalMovement$1 \pianoUpMovement$1
        }
        \new Staff = "down" \with {
          \accidentalStyle modern-cautionary
        } {
          \globalMovement$1 \clef bass \pianoDownMovement$1
        }
      >>
    >>
    \layout {
%%      indent = #0
    }
    \header {
      piece = \titleMovement$1
    }
  }')

\book {
  \bookOutputName "Portnoff_Fantasia-2_Piano"

  PianoMovement(`I')
}

define(`ViolinMovement', `
  \score {
    \new Staff \with {
      \accidentalStyle modern-cautionary
    } {
      \compressEmptyMeasures
      \globalMovement$1 \violinMovement$1Violin
    }
    \layout {
%%      indent = #0
    }
    \header {
      piece = \titleMovement$1
    }
  }')

\book {
  \bookOutputName "Portnoff_Fantasia-2_Violin"
  ViolinMovement(`I')
}

\include "articulate.ly"

\book {
  \bookOutputName "Portnoff_Fantasia-2"
  \score {
    \articulate \unfoldRepeats
    \new StaffGroup <<
      \new Staff \with {
        midiInstrument = #"violin"
      } { \globalMovementI   \violinMovementIPiano
        }
      \new PianoStaff \with {
        midiInstrument = #"acoustic grand"
      } <<
        \new Staff = "up" {
          \globalMovementI \pianoUpMovementI
        }
        \new Staff = "down" {
          \globalMovementI \pianoDownMovementI
        }
      >>
    >>
    \midi{}
  }
}

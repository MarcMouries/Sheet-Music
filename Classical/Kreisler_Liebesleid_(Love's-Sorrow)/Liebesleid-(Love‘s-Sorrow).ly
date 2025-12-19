\version "2.19.25"
\language "english"
\include "../common/violin-functions.ly"
\include "../common/markups.ly"

%#(set-global-staff-size 20)
\paper{
 % ragged-bottom=##t
 % ragged-last-bottom=##t
}

conPassione  = \markup {  \italic "con passione" }
grazioso     = \markup {  \italic "grazioso" }
express      = \markup {  \italic "express."  }
pocoRit      = \markup {  \italic "poco rit." }

pianoConSentimento = \markup { \halign #1.4  \dynamic "p" \italic "con sentimento" }
pocomenomosso      = \markup { \halign #-0.5 \italic "poco meno mosso" }
perdendosi         = \markup { \halign #-0.5 \italic "perdendosi" }


\header {
  title = "Liebesleid"
  subtitle = "Love's Sorrow"

  instrument = "Violin"
  composer = "Fritz Kreisler"
  % Remove default LilyPond tagline
  tagline = ##f

  poet =
  \markup {
    \hbracket {
    \override #'(baseline-skip . 2.2)
    \left-column {
      \abs-fontsize #8 \sans \bold
      \with-url #"http://www.MutopiaProject.org" {
	"Violin"
	"Scores"
      }
    }
    }
    \override #'(baseline-skip . 0)

    \column {
      \with-color #grey
      \filled-box #'( 0 . 0.6 ) #'(-2.5 . 1.4) #0.2
    }
    \hbracket {
    \override #'(baseline-skip . 2.2)
    \column {
      \abs-fontsize #8 \sans  \smallCaps \concat{"Marc" }
      \abs-fontsize #8 \sans \concat {  "2015"}
  }}}

}

breakPDF = {}
myBreak = { \break}

\paper {
  #(set-paper-size "letter")
}



global = {
  \key a \minor
  \numericTimeSignature
  \time 3/4
  \partial 4
  %\tempo "Tempo di Ländler"
}

partA = \relative c' {
    e4\upbow
  a2-2 e'4 ~
  e4 e4..( e16)
  \grace {e16( f} e4)(\( d8) r8 e-.\) r
  f2.
\myBreak
  g,2 d'4-3^\sulD ~

  d d4..-2^\sulA( d16-.)
\break
  \grace {d16( e} d4)(\( c8) r8 d-.\) r
  e2.
\myBreak
  f,2-1 c'4-2^\sulD ~ c4 c4..( c16-.)
  \grace {c16( d} c4)(\( bf8) r8 c-.\) r
  d2.(
\myBreak
  e,4..) a16-.(\ub fs4) ~
  fs8. a16\ub( gs4-.)( e4-.\ub)
  a2. ~
  a4
}

violin = \relative c' {

  \override Score.RehearsalMark.break-align-symbols = #'(clef)
  \override Score.RehearsalMark #'extra-offset = #'(-1 . 0)


  \set fingeringOrientations = #'(left)

  \global

% START %%%%%%%%%%%%%\partA
%\sectionLetter "A"
\mark \markup { \box \bold "A" }

    e4\upbow_\pianoConSentimento^\markup \bold "Tempo di Ländler"
  a2-2 e'4 ~
  e4 e4..( e16-.)
  \grace {e16( f} e4)(\( d8) r8 e-.\) r
  f2.\accent
  g,2 d'4-3^\sulD ~

  d <d-2>4..^\sulA_"no slur"( d16-.)
%\breakPDF
  \grace {d16( e} d4)(\( c8) r8 d-.\) r

\myBreak
  e2.\accent
  f,2-1 <c'-2>4^\sulD ~ c4 c4..( c16-.)
  \grace {c16( d} c4)(\( bf8) r8 c-.\) r
  d2.->(
  e,4..^>) a16-.(\ub fs4^\accent) ~
\breakPDF
  fs8. a16\ub( gs4-.^\accent)( e4-.\ub)
  a2.^\accent ~
  \myBreak
\mark \markup { \box \bold "A'" }

  a4 r4
% END %%%%%%%%%%%%%\partA

%\sectionLetter "A'"

% START %%%%%%%%%%%%%\partA
    e4\upbow
  a2-2 e'4 ~
  e4 e4.( e8-.)
  \grace {e16( f} e4)(\( d8) r8 e-.\) r
  f2.\accent
  g,2 d'4-3^\sulD ~
\breakPDF
  d <d-2>4..^\sulA( d16-.)
  \grace {d16( e} d4)(\( c8) r8 d-.\) r
\myBreak
  e2.\accent
  f,2-1 <c'-2>4^\sulD ~ c4 c4.( c8-.)
  \grace {c16( d} c4)(\( bf8) r8 c-.\) r
  d2.^\accent(
\breakPDF
  e,4.^\accent) a8-.(\ub fs4^\accent) ~
  fs8. a16\ub( gs4-.^\accent)( e4-.\ub)
  a2. ~
\myBreak
\mark \markup { \box \bold B }
  a4
% END %%%%%%%%%%%%%\partA
\stemDown

% START %%%%%%%%%%%%%\partB
%\sectionLetter "B"
r8  a8-0\ub_\express bf-1 b-1
  c2.-2\< <a'-0>2.^\sulA   g2.( \!
g4) r8
  <c,-2>8^\sulA\downbow c b bf2.
  \stemNeutral
  f'2.-3 e2. ~ e2.\>
  d4_\grazioso \!
  r4
  \tieDown
  <d-2>4\db  (
  ~
  d8 d-.) e4. f8
  c4 r4 c4-2 ( ~
\breakPDF
  c8 c8-.) d4. e8
  b4 r4 b4( ~
  b8 e,8-. ) e4-. ( b'4-3-. )
  a2. ~

\myBreak

  a4 r4
% END %%%%%%%%%%%%% \part B

% START %%%%%%%%%%%%%\part C
%\sectionLetter "C"

  c4_2\ub (
  a'4-3)_\conPassione r4
  \tieDown
  a4-2 (  ~
  a8 a-.) b4. c8-4
\breakPDF
  \tieNeutral
  g4 r g\ub ~
  g4 r \tieDown
  a,-0 (
  f'-3^\sulA_\dim) r f4-2\db( ~ f8
  f8-.) g4. a8
  \tieNeutral
  e2.-2 ~ e2.\>_\pocoRit
  \tieDown
  d4 \! r
   <d-2>4\db^\grazioso( ~ d8 d8-.) e4. f8-.
\breakPDF
\tieDown
  c4 r c4-2 ( ~ c8 c8-.) d4. e8
  %\stemUp

  b4 r b4 ~  (
  b8 e,8-.) e4-.  \stemDown b'4-3-.
  \stemNeutral
  a2. ~
\myBreak
\mark \markup { \box \bold C }

  a4 r4
%\sectionLetter "D'"

  e4\fermata (
% END %%%%%%%%%%%%%\part C


% START %% PART D %%%%

\key a \major
    e'4..-2^\pocomenomosso fs16-.) e4 ~ \accent (
\breakPDF
\tieDown
    e8. fs16-.) e4..->( cs16-1)
  \tieNeutral
    d2.\open ~
\override Fingering #'avoid-slur = #'inside
    d2 e,4-1 (
\tieDown
    d'4..-2  e16-.)  d4~ (
    d8. e16 ) d4..( b16-1)
    cs2.~
    cs2 e,4(
    cs'4..-2^\sulD d16-.)  cs4\accent  ~
\breakPDF

\override Fingering #'avoid-slur = #'outside

    cs8. d16-.  cs4.._3->( as16-1)
    \tieDown
  b2. ~ (
  b8. cs16-.)  fs,4..-1->( cs'16-3-. )
  b2. ~ (
  b8. cs16-.)  e,4..-1\accent ( cs'16-.-4 )
\tieNeutral
% 80
  a4..( cs16-. ) e4\accent  ~


  e2
\shape #'(
           (( -0.4 . 2.5) (0 . 3.5) (0 . 3.5) (0.5 . 3.4))
           ((1 . 0) (1 . 0.5) (1 . 0.5) (0 . 0))
         ) Slur
  e,4 -1(
\pageBreak
\tieDown
\override Fingering #'avoid-slur = #'inside

  e'4..-2 fs16-.)  e4-> ~ (      | % 81
  \override Fingering #'avoid-slur = #'outside

  e8. fs16-. ) e4..->( cs16-1-.)      | % 82
\tieNeutral
  d4 r
        \shape #'((-0.5 . 0.7) (0 . 1.2) (0 . 1.2) (0.5 . 0.7)) Tie

  d~->\ub       | % 83
  d2
          \shape #'((0 . 0) (0 . 1.0) (0 . 1.0) (0 . 0)) Slur

  e,4-1(      | % 84
\tieDown
\override Fingering #'avoid-slur = #'inside
  d'4..-2 e16-.)  d4-> ~ (
  d8. e16-.)
  \override Fingering #'avoid-slur = #'outside

  d4..\accent( b16-1-.)
\tieNeutral
cs4 r cs\ub ~ ->
\breakPDF
  cs2 e,4(
  \override Fingering #'avoid-slur = #'inside

  cs'4..-2^\sulD d16-.)  cs4~\accent
  \override Fingering #'avoid-slur = #'outside

  cs8. d16-. cs4..\accent( as16-1)
  \tieDown
  b2.~(
  b8. cs16-.)  e,4..-1_>( cs'16-.-3 )
  b2.~(

\override TextSpanner.bound-details.left.text = "poco rit."
\textSpannerDown
b8. \startTextSpan
  cs16-.)  e,4..-1^>( cs'16-.-4 )
\breakPDF
  a2.~
  \myBreak
  \mark \markup { \box \bold A }


  a4
\stopTextSpan
r
% END %% PART D %%%%
%\sectionLetter "A"


  \tieNeutral
% START %%%%%%%%%%%%%\partA

    e4\upbow
  \key a \minor

a2-2^\markup \bold "tempo I" e'4 ~
  e4 e4..( e16)
  \grace {e16( f} e4)(\( d8) r8 e-.\) r
  f2.\accent
  g,2 d'4-3^\sulD ~
\breakPDF
  d <d-2>4..^\sulA( d16-.)
  \grace {d16( e} d4)(\( c8) r8 d-.\) r
\myBreak
  e2.\accent
  f,2-1 <c'-2>4^\sulD ~ c4 c4..( c16-.)
  \grace {c16( d} c4)(\( bf8) r8 c-.\) r
  d2.^>(
\breakPDF
  e,4..\accent) a16-.(\ub fs4^\accent) ~
  fs8. a16\ub( gs4-.)( e4-.\ub)
  a2. ~

  \myBreak
   \mark \markup { \box \bold C }

  a4 r
% END %%%%%%%%%%%%%\partA


% START %%%%%%%%%%%%%\part C
%\sectionLetter "C"
%\once \override Score.RehearsalMark.self-alignment-X = #LEFT

  c4_2\ub (
  a'4-3)_\conPassione r4
  \tieDown
  a4-2 (  ~
  a8 a-.) b4. c8-4
  \tieNeutral
  g4 r g\ub ~
  g4 r \tieDown
  a,-0 (
\breakPDF
  <f'-3>^\sulA_\dim) r <f-2>4\db( ~ f8
  f8-.) g4. a8
  \tieNeutral
  e2.-2 ~ e2._\pocoRit
  \tieDown
  d4 r
   <d-2>4\db
   ^\markup { \halign #-1.6  \italic "grazioso" }

   ( ~ d8 d8-.) e4. f8
\tieDown
  c4 r c4-2 ( ~ c8 c8-.) d4. e8
\breakPDF

  b4 r b4 ~  (
  b8 e,8-.) e4-.  \stemDown b'4-3-.
  \stemNeutral
  a2. ~
\myBreak
  \mark \markup { \box \bold D }
  a4 r4
%\sectionLetter "D"

  e4\fermata (
% END %%%%%%%%%%%%%\part C


% START %% PART D %%%%

\key a \major
  \override Fingering #'avoid-slur = #'inside
    e'4..-2^\pocomenomosso\pp fs16-.) e4 ~ \accent (
\tieDown
  \override Fingering #'avoid-slur = #'outside

    e8. fs16-.) e4..^>( cs16-1-.)
  \tieNeutral
    d4 r d4\ub^> ~
\breakPDF

    d2
              \shape #'((-0.2 . -0.3) (0 . 1.0) (0 . 1.0) (0 . 0)) Slur

    e,4-1 (
  \override Fingering #'avoid-slur = #'inside
\tieDown
d'4..-2 e16-.)  d4~ ^>(
  \override Fingering #'avoid-slur = #'outside

    d8. e16-. ) d4..^>( b16-1)
\tieNeutral
    cs4 r
    cs4 ~ \ub ^>
    cs2 e,4(
  \override Fingering #'avoid-slur = #'inside

    cs'4..-2^\sulD d16-.)  cs4\accent  ~
  \override Fingering #'avoid-slur = #'outside

    cs8. d16-.  cs4..^>( as16-1)
\breakPDF

    \tieDown
  b2. ~ (
  b8. cs16-.)  fs,4..-1_>( cs'16-3-. )
  b2. ~ (
  b8. cs16-.)  e,4..-1\accent ( cs'16-.-4 )
\tieNeutral
  a4..( cs16-. ) e4\accent  ~
  e2 e,4 -1(
\tieDown
  \override Fingering #'avoid-slur = #'inside

  e'4..-2 fs16-.)  e4^> ~ (      | %
    \override Fingering #'avoid-slur = #'outside

  e8. fs16 ) e4..^>( a16-0-.)      | %
\tieNeutral
  d,4-0 r <d-3> ~->\ub
  d2 e,4-1(
\tieDown
    \override Fingering #'avoid-slur = #'inside

  d'4..-1 e16-.)  d4^>~(
  d8. e16-.)  d4..\accent( gs16)
\tieNeutral
cs,4-1 r <cs-2>\ub ~->

  cs2 e,4(
\breakPDF
  cs'4..-2^\sulD d16-.)  cs4~\accent
  cs8. d16-. cs4..\accent( fs16)

  b,2.-2 ~
  b8. cs16-.(  a4..^> cs16-. )
  b2.^> ~
  b8.
  cs16-.(  a4..^>)  b16-. (
  a2^> ~
% END %% PART D %%%%  D + some notes higher

   a8. ) cs16 (

\breakPDF
   \tieDown
    b2^> ~ b8. ) cs16 (
    a2^> ~ a8. ) cs16 (
    b2^> ~ b8. ) cs16 (
    a2._>  ~     )
 \startTrillSpan
\set fingeringOrientations = #'(left)
       a2.~
    \once \override Script.Y-offset = #1
    \once \override Script.X-offset = #0.1
    <a-2>2.~\upbow _\perdendosi

     \shape #'((0.5 . -1.5) (0 . -2.0) (0 . -2.2) (-0.8 . -2.2)) Slur

    a2

    ~


    ( a8
        \stopTrillSpan
        gs16 a
    a'8-0^\sulD)  r r4 r \bar "|."
}% end of last bar in partorvoice


APnovoiceBA = \relative c'{
    \set Staff.instrumentName = #"Piano"
    \set Staff.shortInstrumentName = #"Pno."
    \clef treble
    %staffkeysig
    \key c \major
    %bartimesig:
    \time 3/4
    \partial 4*1
    r4     r \p <e, a c> <a c e>      | % 1
    r <a c e> <c e a>      | % 2
    r <d f a> <f a d>      | % 3
    r <d f a> <c f a>      | % 4
    r <g d' f> <d' f g>      | % 5
    r <d f g> <b f' g>      | % 6
    r <g c e> <c e g>      | % 7
    r <c e g> <b e g>      | % 8
    r <f c' f> <c' f a>      | % 9
    r <c e g> <c e a>      | % 10
    r <f, bf d> <d' f a>      | % 11
    r <f, a d> <a d f>      | % 12
    r <e a c> <c' e>      | % 13
    r <b d e> <b d e>      | % 14
    r <a c e a>2~      | % 15
    <a c e a>4 r r      | % 16
    <c a'>2.      | % 17
    <b gs'>2 <bf g'>4      | % 18
    <a f'>2.      | % 19
    r4 <f' a> <a c>      | % 20
    <g b>2.      | % 21
    <f a>2.      | % 22
    <e g>2.      | % 23
    r4 <e g> <g b>      | % 24
    <f a>2.      | % 25
    <e g>2.      | % 26
    <d f>2.      | % 27
    r4 <d f> <f a>      | % 28
    <c e>2 <c e>4~->       | % 29
    <c e> <b d e>2->       | % 30
    <a c e>2.~      | % 31
    <a c e>4 r _\markup{"espressivo"} _\markup{"espressivo"} r      | % 32
    <a' c>2( \< c,4)      | % 33
    r \! c'4.-> ( b8)      | % 34
    d2( c4~)      | % 35
    c r r      | % 36
    <f, bf>2( bf,4)      | % 37
    r <f' a>4.-> ( <b, gs'>8)      | % 38
    b'2 \> a4~      | % 39
    a \! <b, gs'>( <bf g'>)      | % 40
    r <a d f>8-.  r <d f a>-.  r      | % 41
    r4 <d f a>8-.  r <f a d>-.  r      | % 42
    r4 <c e g>8-.  r <c e a>-.  r      | % 43
    r4 <c fs a>8-.  r <fs a c>-.  r      | % 44
    r4 <a, d f>8 r <d f a> r      | % 45
    r4 <gs, d' e>8-.  r <d' e b'>-.  r      | % 46
    <c e a>2.~      | % 47
    <c e a>4 r r      | % 48
    c'2.      | % 49
    r4 \< <a c> <gs b>      | % 50
    d'2 \! \> c4~      | % 51
    c \! g( fs) _\markup{"diminuendo"}      | % 52
    bf2.      | % 53
    r4 <f a> <b, gs'>      | % 54
    b'2( ^\markup {\italic\bold  "poco rit"} a4)      | % 55
    a <b, gs'>( <bf g'>)      | % 56
    <a d fs>2.->  \p      | % 57
    <a d f>2.->       | % 58
    <a c e>2->  <c e a>4~      | % 59
    <c e a> <b gs'> <bf g'>->       | % 60
    <ds fs>2-> ( <d f>4-> )      | % 61
    <gs, d' e>2.->       | % 62
    <a c e a>2.~      | % 63
    <a c e a>4 r r \fermata      | % 64
    %barkeysig:
    \key a \major
    <a cs e>2.~      | % 65
    <a cs e>4 <a cs e>2
    \bar "||"     | % 66
    <gs d' e>4 fs''16 <gs, d' e>4~      | % 67
    <gs d' e>8. fs'16 <gs, d' e>4 r      | % 68
    <gs, d' e>2.~      | % 69
    <gs d' e>4 <gs d' e>2      | % 70
    <a cs e>4 fs''16 <a, cs e>4~      | % 71
    <a cs e>8. fs'16( <a, cs e>4) r      | % 72
    <cs, e>2.~->       | % 73
    <cs e>2.      | % 74
    r4 r8. gs''16 <b, d fs>4      | % 75
    <a, d fs>2.      | % 76
    r4 r8. fs''16 <gs, d' e>4~      | % 77
    <gs d' e>8 r r4 r      | % 78
    r r8. <e a>16 <a cs>4~      | % 79
    <a cs>8. <cs e a>16 <e a cs>8 r r4      | % 80
    <a,, cs e>2->  <gs cs e>4~      | % 81
    <gs cs e> <fs cs' e>2->       | % 82
    <fs b d>->  \tuplet 3/2{fs'8( a) fs  }      | % 83
    gs2. \fz      | % 84
    <b, d fs>2 <a d fs>4~->       | % 85
    <a d fs> <gs d' fs>2->       | % 86
    <a cs e>->  \tuplet 3/2{e'8( gs) e  }      | % 87
    fs2.      | % 88
    <a, cs e>2->  <gs cs e>4~->       | % 89
    <gs cs e> <g as cs e>2->       | % 90
    r4 r8. gs''16 <b, d fs>4~      | % 91
    <b d fs>8 r r4 r      | % 92
    r r8. fs'16 <gs, d' e>4~      | % 93
    <gs d' e>8 ^\markup {\upright  ""} ^\markup {\italic\bold  "poco rit"} r r4 r      | % 94
    r <a cs>8 r <a cs e> r      | % 95
    <a cs a'> r r4 r      | % 96
    %barkeysig:
    \key c \major
    <c, e a>2->  ^\markup {\upright \bold  "Tempo I"} <b e gs>4~->       | % 97
    <b e g> <bf cs g'>2->
    \bar "||"     | % 98
    <a d f>2->  <f' a d>4~->       | % 99
    <f a d> \< \> <f a cs>->  <f a c>->       | % 100
    <f g b>2->  \! \! <b, f' a>4~      | % 101
    <b f' a> <b f' af>2->       | % 102
    <c e g>->  \< <e g c>4~      | % 103
    <e g c> \! <e g b>->  <e g bf>->       | % 104
    <c f a>2 <c e g>4~      | % 105
    <c e g> <c e g>2      | % 106
    <d f> <d f bf>4~      | % 107
    <d f bf> <c f a>( <b fs' g>)      | % 108
    <c e a>2 <c e>4~      | % 109
    <c e> <b d e>2      | % 110
    <c e g>2.~      | % 111
    <c e g>4 r r      | % 112
    c'2. ^\markup {\italic\bold  "con passione"}      | % 113
    r4 <a c> <gs b>      | % 114
    d'2 c4~      | % 115
    c g fs _\markup{"diminuendo"}      | % 116
    bf2.      | % 117
    r4 <f a>( <b, gs'>)      | % 118
    b'2( ^\markup {\italic\bold  "poco rit"} a4)      | % 119
    a \> <b, gs'>( <bf g'>)      | % 120
    <a d fs>2.->  \! \p ^\markup {\upright \bold  "a tempo"}      | % 121
    <a d f>2.->       | % 122
    <a c e>2->  <c e a>4~->       | % 123
    <c e a> <b gs'>->  <bf g'>->       | % 124
    <ds fs>2-> ( <d f>4-> )      | % 125
    <gs, d' e>2.      | % 126
    <a c e>2.~      | % 127
    <a c e>4 r r \fermata      | % 128
    %barkeysig:
    \key a \major
    <a cs e>2.~      | % 129
    <a cs e>4 <a cs e>2      | % 130
    <gs d' e> \tuplet 3/2{fs'8( a) fs  }      | % 131
    gs2.      | % 132
    <gs, d' e>2.~      | % 133
    <gs cs e>4 <gs cs e>2      | % 134
    <cs e> \tuplet 3/2{e8 gs e  }      | % 135
    fs2.      | % 136
    <a, cs e>2.~      | % 137
    <a cs e>4 <gs cs e>2      | % 138
    r4 r8. gs''16 <b, d fs>4~      | % 139
    <b d fs> <d, e>2->       | % 140
    r4 r8. fs'16 <b, d e>4~      | % 141
    e8 r <d, e>2      | % 142
    <a cs e>2.~      | % 143
    <a cs e>2.      | % 144
    <cs e a>2->  <cs e gs>4~->       | % 145
    <cs e gs> <cs e fs>2->       | % 146
    <b d fs>4->  fs'16 <d a'>4~->       | % 147
    <d a'>8. fs16( <d e gs>4-> ) e16      | % 148
    <b d fs>2 <a d fs>4~      | % 149
    <a d fs> <gs d' fs>2->       | % 150
    <a cs e>4 e'16 <cs gs'>4~      | % 151
    <cs gs'>8. e16( <a, cs fs>4-> ) d16      | % 152
    <a cs e>2->  <gs cs e>4~->       | % 153
    <gs cs e> <fs cs' e>2->       | % 154
    r8. fs''16( e4~) e8 r      | % 155
    r4 <d, e>2      | % 156
    r8. fs'16 e4~ e8 r      | % 157
    r r <d, e>2      | % 158
    r4 <e' e'>~ <e e'>8 r      | % 159
    r4 <e e'>~ <e e'>8 r      | % 160
    r4 <e e'>~ <e e'>8 r      | % 161
    r4 a,2~      | % 162
    a8 r cs2      | % 163
    a8 r a2~      | % 164
    a8 r a2~      | % 165
    a8 r r4 r \bar "|."
}% end of Violin Part

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } \violin
  \layout {indent=0\cm }
 % \midi { }
}

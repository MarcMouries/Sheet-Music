\language "english"
%=============================================
%   created by MuseScore Version: 1.3
%          December 15, 2014
%=============================================
\version "2.19.11"
\header {
  title = "Besame mucho"
}

ASvoiceAA = \relative c'{

  \key f \major
  %bartimesig:
  \time 4/4
  d2 d8 f a d      | % 1
  cs2 cs8 bf g ef      | % 2
  d2 ds8 e f a     
  \repeat volta 2 {
    | % 3
    gs2 f4 e      | % 4
    d d8 d d2~      | % 5
    d \tuplet 3/2{d4 e f  }      | % 6
    a2 g~      | % 7
    g1      | % 8
    \tuplet 3/2{g4 g g  } \tuplet 3/2{a a a  }      | % 9
    \tuplet 3/2{bf bf bf  } \tuplet 3/2{cs d e  }      | % 10
    a,1~      | % 11
    a2. r4      | % 12
    d1~      | % 13
    d2 c4 bf      | % 14
    a2 g~      | % 15
    g1      | % 16
    \tuplet 3/2{d'4 a f  } \tuplet 3/2{a f d  }      | % 17
    \tuplet 3/2{f e d  } \tuplet 3/2{e d cs  }      | % 18
    d1~      | % 19
    d2. r4      | % 20
    g g8 g \tuplet 3/2{g4 f e  }      | % 21
    f4 f8 f \tuplet 3/2{f4 e d  }      | % 22
    e8 e4. e8 e f g      | % 23
    a1      | % 24
    g4 g8 g \tuplet 3/2{g4 f e  }      | % 25
    f4 f8 f \tuplet 3/2{f4 e d  }      | % 26
    \tuplet 3/2{e e e  } \tuplet 3/2{f f f  }      | % 27
    e2. r4      | % 28
    d d8 d d2~      | % 29
    d \tuplet 3/2{d4 e f  }      | % 30
    a2 g~      | % 31
    g2. r4      | % 32
    \tuplet 3/2{g4 g g  } \tuplet 3/2{a a a  }      | % 33
    \tuplet 3/2{bf bf bf  } \tuplet 3/2{cs d e  }      | % 34
    a,1~      | % 35
    a2. r4      | % 36
    d1~      | % 37
    d2 c4 a      | % 38
    a2 g~      | % 39
    g2. r4      | % 40
    \tuplet 3/2{d'4 a f  } \tuplet 3/2{a f d  }
  } % end of repeat except alternate endings
  \alternative{
    {
      | % 41
      \tuplet 3/2{f4 e d  } \tuplet 3/2{e d cs  }
    } %close alt1
    {
      | % 42
      d1~
    }
  } %close alternatives
  {
    | % 43
    d2~ d4 r
  }
} %close alternatives
e1~
e2~ e4 r \bar "|."
}% end of last bar in partorvoice



AAvoiceBA = \relative c'{
  \set Staff.instrumentName = #"Alto"
  \set Staff.shortInstrumentName = #"A."
  \clef treble
  %staffkeysig
  \key f \major
  %barkeysig:
  \key f \major
  %bartimesig:
  \time 4/4
  r4 a a2      | % 1
  r4 cs cs2      | % 2
  r4 a a2     \repeat volta 2 {
    %startrep
    | % 3
    r4 d cs2      | % 4
    a4 a8 bf bf2      | % 5
    a \tuplet 3/2{a4 a a  }      | % 6
    d2 d~      | % 7
    d1      | % 8
    \tuplet 3/2{d4 d d  } \tuplet 3/2{ef ef ef  }      | % 9
    \tuplet 3/2{d d d  } \tuplet 3/2{e f g  }      | % 10
    f2 g      | % 11
    f2. r4      | % 12
    fs2~ fs4 g      | % 13
    a2 fs      | % 14
    g d~      | % 15
    d2. r4      | % 16
    \tuplet 3/2{f4 f d  } \tuplet 3/2{f e a,  }      | % 17
    \tuplet 3/2{b b b  } \tuplet 3/2{cs cs cs  }      | % 18
    a2 bf      | % 19
    a2. r4      | % 20
    d d8 d \tuplet 3/2{d4 d cs  }      | % 21
    d4 d8 d \tuplet 3/2{d4 d d  }      | % 22
    cs8 cs4. d8 d d e      | % 23
    f2 ef      | % 24
    d4 d8 d \tuplet 3/2{d4 d cs  }      | % 25
    d4 d8 d \tuplet 3/2{d4 d d  }      | % 26
    \tuplet 3/2{d d d  } \tuplet 3/2{d d d  }      | % 27
    cs2. r4      | % 28
    r r bf8 bf4.      | % 29
    a1      | % 30
    bf2 \tuplet 3/2{d4 d d  }      | % 31
    cs2 cs      | % 32
    \tuplet 3/2{d4 d d  } \tuplet 3/2{ef ef ef  }      | % 33
    \tuplet 3/2{d d d  } \tuplet 3/2{e f g  }      | % 34
    f2 g      | % 35
    f2. r4      | % 36
    fs2 fs4 g      | % 37
    a2 fs      | % 38
    g d~      | % 39
    d2. r4      | % 40
    \tuplet 3/2{f4 f d  } \tuplet 3/2{f d a  }
  } % end of repeat except alternate endings
  \alternative{
    {
      | % 41
      \tuplet 3/2{b4 b b  } \tuplet 3/2{cs cs cs  }
    } %close alt1
    {
      | % 42
      d1
    }
  } %close alternatives
  {
    | % 43
    bf2 a
  }
} %close alternatives
| % 44
e2 c \bar "|."     | % 45
b2~ b4 r \bar "|."
}% end of last bar in partorvoice



ATvoiceCA = \relative c{
  \set Staff.instrumentName = #"Tenor"
  \set Staff.shortInstrumentName = #"T."
  \clef "treble_8"
  %staffkeysig
  \key f \major
  %barkeysig:
  \key f \major
  %bartimesig:
  \time 4/4
  r4 f f2      | % 1
  r4 f f2      | % 2
  r4 f f2     \repeat volta 2 {
    %startrep
    | % 3
    r4 g g2      | % 4
    f4 f8 g g2      | % 5
    f \tuplet 3/2{f4 g a  }      | % 6
    bf4 c bf2~      | % 7
    bf1      | % 8
    \tuplet 3/2{bf4 bf bf  } \tuplet 3/2{c c c  }      | % 9
    \tuplet 3/2{bf bf bf  } \tuplet 3/2{a b cs  }      | % 10
    d2 cs      | % 11
    d2. r4      | % 12
    c1~      | % 13
    c2 a4 bf      | % 14
    bf c bf2~      | % 15
    bf4 bf a g      | % 16
    \tuplet 3/2{a4 a a  } \tuplet 3/2{d a f  }      | % 17
    \tuplet 3/2{gs gs gs  } \tuplet 3/2{g g g  }      | % 18
    f2 g      | % 19
    f2. r4      | % 20
    g g8 g \tuplet 3/2{bf4 a g  }      | % 21
    f4 f8 f \tuplet 3/2{f4 g a  }      | % 22
    a8 a4. bf8 bf bf bf      | % 23
    a2 <fs c'>      | % 24
    <g bf>4 <g bf>8 <g bf> \tuplet 3/2{bf4 a g  }      | % 25
    f4 f8 f \tuplet 3/2{f4 f a  }      | % 26
    \tuplet 3/2{gs gs gs  } \tuplet 3/2{gs gs gs  }      | % 27
    a4. g8 bf4 a      | % 28
    f r g8 g4.      | % 29
    f1      | % 30
    g2 \tuplet 3/2{bf4 bf bf  }      | % 31
    bf2 a      | % 32
    \tuplet 3/2{bf4 bf bf  } \tuplet 3/2{c c c  }      | % 33
    \tuplet 3/2{bf bf bf  } \tuplet 3/2{a b cs  }      | % 34
    d2 cs      | % 35
    d2. r4      | % 36
    c1~      | % 37
    c2 a4 bf      | % 38
    bf c bf2~      | % 39
    bf4 bf a g      | % 40
    \tuplet 3/2{a4 a a  } \tuplet 3/2{d a f  }
  } % end of repeat except alternate endings
  \alternative{
    {
      | % 41
      \tuplet 3/2{gs4 gs gs  } \tuplet 3/2{g g g  }
    } %close alt1
    {
      | % 42
      <f a>1~
    }
  } %close alternatives
  {
    | % 43
    <f af>2 g
  }
} %close alternatives
| % 44
b2 a \bar "|."     | % 45
g2~ g4 r \bar "|."
}% end of last bar in partorvoice



ABvoiceDA = \relative c{
  \set Staff.instrumentName = #"Bass"
  \set Staff.shortInstrumentName = #"B."
  \clef bass
  %staffkeysig
  \key f \major
  %barkeysig:
  \key f \major
  %bartimesig:
  \time 4/4
  d2 f      | % 1
  ef bf      | % 2
  d a     \repeat volta 2 {
    %startrep
    | % 3
    e'2 a,      | % 4
    d4 d8 e e2      | % 5
    d \tuplet 3/2{d4 d d  }      | % 6
    bf4 a g2      | % 7
    a bf      | % 8
    \tuplet 3/2{g'4 g g  } \tuplet 3/2{fs fs fs  }      | % 9
    \tuplet 3/2{g g g  } \tuplet 3/2{a a a  }      | % 10
    f2 e      | % 11
    d4 cs8 d e f gs a      | % 12
    a1      | % 13
    fs2 ef4 d      | % 14
    d2 g~      | % 15
    g2. r4      | % 16
    \tuplet 3/2{d4 d d  } \tuplet 3/2{d e f  }      | % 17
    \tuplet 3/2{e e e  } \tuplet 3/2{a, a a  }      | % 18
    d2 e      | % 19
    f4 cs8 d f a, d c      | % 20
    bf4 bf8 bf \tuplet 3/2{bf4 cs d  }      | % 21
    a4 a8 a \tuplet 3/2{d4 e f  }      | % 22
    g8 g4. g8 g f e      | % 23
    d1      | % 24
    d4 d8 d \tuplet 3/2{bf4 cs d  }      | % 25
    a4 a8 a \tuplet 3/2{a4 a a  }      | % 26
    \tuplet 3/2{b b b  } \tuplet 3/2{bf bf bf  }      | % 27
    a8 cs e4 a,2      | % 28
    e'4 r e8 e4.      | % 29
    d1~      | % 30
    d2 \tuplet 3/2{g,4 a bf  }      | % 31
    e2~ e4 f      | % 32
    \tuplet 3/2{g4 g g  } \tuplet 3/2{fs fs fs  }      | % 33
    \tuplet 3/2{g g g  } \tuplet 3/2{a a a  }      | % 34
    f2 e      | % 35
    d4 cs8 d e f gs a      | % 36
    a1      | % 37
    fs2 ef4 d      | % 38
    d2 g~      | % 39
    g2. r4      | % 40
    \tuplet 3/2{d4 d d  } \tuplet 3/2{d e f  }
  } % end of repeat except alternate endings
  \alternative{
    {
      | % 41
      \tuplet 3/2{e4 e e  } \tuplet 3/2{a, a a  }
    } %close alt1
    {
      | % 42
      d1~
    }
  } %close alternatives
  {
    | % 43
    d2 cs
  }
} %close alternatives
| % 44
g2 fis \bar "|."     | % 45
e2~ e4 r \bar "|."
}% end of last bar in partorvoice


\score {
  <<
    \context Staff = ASpartA <<
      \context Voice = ASvoiceAA \ASvoiceAA
    >>
    %% remove previous line to get barnumbers only at beginning of system.
    \accidentalStyle modern-cautionary
    \set Score.markFormatter = #format-mark-box-letters %%boxed rehearsal-marks
    \override Score.TimeSignature.style = #'() %%makes timesigs always numerical
    %% remove previous line to get cut-time/alla breve or common time
    \set Score.pedalSustainStyle = #'mixed
    %% make spanners comprise the note it end on, so that there is no doubt that this note is included.
    \override Score.TrillSpanner.bound-details.right.padding = #-2
    \override Score.TextSpanner.bound-details.right.padding = #-1
    %% Lilypond's normal textspanners are too weak:
    \override Score.TextSpanner.dash-period = #1
    \override Score.TextSpanner.dash-fraction = #0.5
    %% lilypond chordname font, like mscore jazzfont, is both far too big and extremely ugly (olagunde@start.no):
    \override Score.ChordName.font-family = #'roman
    \override Score.ChordName.font-size =#0
    %% In my experience the normal thing in printed scores is maj7 and not the triangle. (olagunde):
    \set Score.majorSevenSymbol = \markup {maj7}
  >>

  %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
  %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
  %% If you want the Eulenburg/Lilypond style, comment out the following line:
  \layout {\context {\Score \consists Span_bar_engraver}}
  \midi { \tempo 4 = 120 }

}%% end of score-block
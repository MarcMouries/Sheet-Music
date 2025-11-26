\version "2.16.0"

\header {
  title = \markup \caps "You are my Sunshine"
  composer = \markup \small \override #'(baseline-skip . 2.5) \center-column {
    \line { "Words and music by" }
    \line { \caps "Jimmie Davis" "and" }
    \line { \caps "Charles Mitchell" }
  }
}

#(set-global-staff-size 18)

\paper {
  #(set-paper-size "letter")
  ragged-last-bottom = ##f
  system-count = 8
}

Bars = {
  \time 2/2
  s1*4 |
  s4 \bar "||" s2. |
  \repeat volta 3 {
    s1*15 |
    s4 \bar "||" s2. \bar "||" |
    s1*14 |
  }
  \alternative {
    {
      s1*2 |
    }
    {
      s1*2 \bar "|." |
    }
  }
}

Tempo = {
  \time 2/2
  \set Score.tempoHideNote = ##t
  \tempo Moderato 2=60
  s1*5 |
  \repeat volta 3 {
    s1*30 |
  }
  \alternative {
    {
      s1*2 |
    }
    {
      \tempo 2=45 s1-"rit." |
      s1 |
    }
  }
}

Melody = \relative c' {
  \clef "treble" \key es \major \time 2/2 R1*4 |
  r4 bes4 es4 f4 |
  \repeat volta 3 {
    g2 g2 ~ |
    g4 g4 fis4 g4 |
    es2 es2 ~ |
    es4 es4 f4 g4 |
    as2 c2 |
    bes2 as2 |
    g1 ~ |
    g4 es4 f4 g4 |
    as2 c2 ~ |
    c4 c4 bes4 as4 |
    g2 es2 ~ |
    es2 es4 f4 |
    g2. as4 |
    f2. g4 |
    es1 ~ |
    es4 bes4 es4 f4 |
    g2 g2 ~ |
    g4 g4 fis4 g4 |
    es2 es2 ~ |
    es4 es4 f4 g4 |
    as2 c2 ~ |
    c4 c4 bes4 as4 |
    g1 ~ |
    g4 es4 f4 g4 |
    as2 c2 ~ |
    c4 c4 bes4 as4 |
    g2 es2 ~ |
    es2 es4 f4 |
    g2. as4 |
    f2 f4 g4 |
  }
  \alternative {
    {
      es1 ~ |
      es4 bes4 es4 f4 |
    }
    {
      es1 ~ |
      es1 |
    }
  }
}

Lyrics = \lyricmode {
  \set stanza = #"1. "
  The oth -- er
  <<
    {
      night dear __
      as I lay sleep -- ing __
      I dreamed I held you in my arms __
      When I a -- woke dear __
      I was mis -- tak -- en __
      and I hung my head and cried
    }
    \new Lyrics = "VerseTwo" \with { alignBelowContext = #"VerseOne" } {
      \set associatedVoice = "Melody"
      love you __
      and make you hap -- py __
      If you would on -- ly say the same __
      But if you leave me __
      to love an -- oth -- er __
      you'll re -- gret it all some -- day
    }
    \new Lyrics = "VerseThree" \with { alignBelowContext = #"VerseTwo" } {
      \set associatedVoice = "Melody"
      once dear __
      you real -- ly loved me __
      And no one else could come be -- tween __
      But now you've left me __
      and love an -- oth -- er __
      you have shat -- tered all my dreams
    }
  >>
  You are my sun -- shine __
  my on -- ly sun -- shine __
  you make me hap -- py __
  when skies are gray __
  You'll nev -- er know dear __
  how much I love you __
  Please don't take my sun -- shine a -- way.
  <<
    {
      \set stanza = #"2. "
      I'll al -- ways
    }
    \new Lyrics = "VerseTwo" \with { alignBelowContext = #"VerseOne" } {
      \set associatedVoice = "Melody"
      \set stanza = #"3. "
      You told me
    }
  >>
  way __
}

RightOne = \relative c' {
  \clef "treble" \key es \major \time 2/2
  r4 \voiceOne bes4 es4 f4 |
  g2. as4 |
  f2. g4 |
  es1 ~ |
  es4 bes4 es4 f4 |
  \repeat volta 3 {
    g2 g2 ~ |
    g4 <g es bes>4 <fis es a,>4 <g es bes>4 |
    es2 es2 ~ |
    es4 <es des g,>4 <f des g,>4 <g des bes>4 |
    as2 c2 |
    bes2 as2 |
    g1 ~ |
    g4 es4 f4 g4 |
    as2 c2 ~ |
    c4 c4 bes4 as4 |
    g2 es2 ~ |
    es2 es4 f4 |
    g2. as4 |
    f2. g4 |
    es1 ~ |
    es4 bes4 es4 f4 |
    g2 g2 ~ |
    g4 <g es bes>4 <fis es a,>4 <g es bes>4 |
    es2 es2 ~ |
    es4 <es des g,>4 <f des g,>4 <g des bes>4 |
    as2 c2 ~ |
    c4 c4 bes4 as4 |
    g1 ~ |
    g4 es4 f4 g4 |
    as2 c2 ~ |
    c4 c4 bes4 as4 |
    g2 es2 ~ |
    es2 es4 f4 |
    g2. as4 |
    f2 f4 g4 |
  }
  \alternative {
    {
      es1 ~ |
      es4 bes4 es4 f4 |
    }
    {
      es1 ~ |
      es2 ( \fermata <d' g, es>2 ) \fermata |
    }
  }
}

RightTwo = \relative c' {
  \clef "treble" \key es \major \time 2/2
  s4 \voiceTwo g4 <bes g>2 |
  r4 bes4 ( b4 ) <d bes>4 |
  r4 <bes as>4 <d as>2 |
  r4 <bes g>4 ( <c g>4 <b g>4 |
  <bes! g>4 ) s2.
  \repeat volta 3 {
    r4 <es bes>4 r4 <es bes>4 |
    s1 |
    r4 <bes g> r4 <bes g>4 |
    s1 |
    r4 <es c>4 r4 <as es>4 |
    r4 <es c>4 r4 <es c>4 |
    r4 <bes g>4 ( <c g>4 <d g,>4 ) |
    <c g>4 es4 <des bes>4 <des bes>4 |
    r4 <es c>4 r4 <as es>4 |
    r4 <as es>4 <es c>2 |
    r4 <es bes>4 r4 <bes g>4 |
    r4 <c g>4 <bes g>2 |
    r4 bes4 ( b4 ) <d bes>4 |
    r4 <bes as>4 <d as>2 |
    r4 <bes g>4 ( <c g>4 <b g>4 |
    <bes g!>4 ) s2. |
    r4 <es bes>4 r4 <es bes>4 |
    r4 s2. |
    r4 <bes g>4 r4 <bes g>4 |
    s1 |
    r4 <es c>4 r4 <as es>4 |
    r4 <as es>4 <es c>2 |
    r4 <as, f>4 <c g>4 <d g,>4 |
    <c g>4 es4 <des g,>4 <des bes>4 |
    r4 <es c>4 r4 <as es>4 |
    r4 <as es>4 <es c>2 |
    r4 <es bes>4 r4 <bes g>4 |
    r4 <c g>4 <bes g>2 |
    r4 bes4 ( b4 ) <d as!>4 |
    r4 <bes as>2 <d as>4 |
  }
  \alternative {
    {
      r4 <bes g>4 ( <c g>4 <b g>4 ) |
      <bes! g>4 s2. |
    }
    {
      r4 <bes g>4 ( <c g>4 <es bes g>4 ) |
      <f c g>1 |
    }
  }
}

RightThree = \relative c' {
  \clef "treble" \key es \major \time 2/2
  s1 |
  s4 \voiceFour es2 s4 |
  s1*3 |
  \repeat volta 3 {
    s1*12 |
    s4 es2 s4 |
    s1*15 |
    s4 es2 s4 |
    s1 |
  }
  \alternative {
    {
      s1*2 |
    }
    {
      s1*2 |
    }
  }
}

LeftOne = \relative c {
  \clef "bass" \key es \major \time 2/2
  es4 r4 bes4 r4 |
  es,2 r4 d'4 |
  bes2 r4 bes4 |
  g2 es2 |
  bes'4 r4 r2 |
  \repeat volta 3 {
    es4 r4 bes4 r4 |
    es4 r4 c4 bes4 |
    g4 r4 es4 r4 |
    es'2 des4 es4 |
    c2 ( es2 |
    as2 f2 |
    es2 bes2 |
    es,2 ) es'4 des4 |
    c4 r4 es4 r4 |
    as4 r4 es4 r4 |
    es,4 r4 bes'4 r4 |
    c4 r4 bes4 r4 |
    es,2 r4 d'4 |
    bes2 r4 bes4 |
    g2 es2 |
    bes'4 r4 r2 |
    es4 r4 bes4 r4 |
    es4 r4 c4 bes4 |
    g4 r4 es4 r4 |
    es'2 des4 es4 |
    c2 ( es2 ) |
    as2 ( f2 |
    es2 bes2 |
    es,2 ) es'4 des4 |
    c4 r4 es4 r4 |
    as4 r4 es4 r4 |
    es,4 r4 bes'4 r4 |
    c4 r4 bes4 r4 |
    es,2 r4 d'4 |
    bes2 r4 bes4 |
  }
  \alternative {
    {
      g2 es2 |
      es4 r4 r2 |
    }
    {
      g2 ( es2 ) |
      c'2 _( _\fermata <bes' es,>2 \fermata ) |
    }
  }
}

\score {
  <<
    \new Staff <<
      \new Voice = "Melody" { \Melody }
      \new Lyrics = "VerseOne" \lyricsto "Melody" \Lyrics
    >>
    \new PianoStaff <<
      \new Dynamics = "Bars" { \Bars }
      \new Staff = "rh" <<
        \new Voice = "RightOne" { \RightOne }
        \new Voice = "RightTwo" { \RightTwo }
        \new Voice = "RightThree" { \RightThree }
      >>
      \new Dynamics = "Tempo" { \Tempo }
      \new Staff = "lh" <<
        \new Voice = "LeftOne" { \LeftOne }
      >>
    >>
  >>
  \layout {
    \context {
      \Staff \RemoveEmptyStaves
      \override VerticalAxisGroup #'remove-first = ##t
    }
  }
}

\score {
  \unfoldRepeats
  <<
    \new Staff \with {
      midiInstrument = #"flute"
      midiMinimumVolume = #0.0
      midiMaximumVolume = #1.0
    } \Melody
    \new Staff \with {
      midiMinimumVolume = #0.0
      midiMaximumVolume = #1.0
    } <<
      \Tempo
      \RightOne
      \RightTwo
      \RightThree
      \LeftOne
    >>
  >>
  \midi {}
}

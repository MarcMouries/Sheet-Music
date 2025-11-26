\version "2.19.14"
\language "english"

%  - http://folksongcollector.com/sunshine.html"

\header {
  title = \markup \caps "You are my Sunshine"
  subtitle = "Words & Music by the Rice Brothers"
  composer = "Jimmie Davis and Charles Mitchell"
  style = "old-time"
  tagline = ""
}


\paper {
  #(set-paper-size "letter")
  ragged-last-bottom = ##f
  %system-count = 8
}


Melody = \relative c'' {
  \clef "treble"
  \key g \major
  \time 4/4
  \partial 2
  r8 d,8-0 g8-1 a8
  \repeat volta 3 {
    b4  b4  ~ b8 b8 as8 b8
    | g4  g4  ~ g8 g8 a8 b8
    | c4  e4    d4 c4
    | b2        r8 g8 a8 b8
    | c4  e4  ~ e8 e8 d8 c8
    | b4  g4  ~ g4 g8 a8
    | b4. c8    a4. b8
    | g2        r8 d8 g8 a8
    | b4  b4    r8 b8 as8 b8
    | g4  g4    r8 g8 a8 b8
    | c4  e4 ~  e8 e8 d8 c8
    | b2        r8 g8 a8 b8
    | c4  e4  ~ e8 e8 d8 c8
    | b4  g4  ~ g4 g8 a8
    | b4. c8    a4 a8 b8
  }
  \alternative {
    {
      g2 ~       g8 d8 g8 a8
    }
    {
      g2 ~       g2
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


\score {
  \new Staff
  <<
    \new Voice = "Melody" { \Melody }
    \new Lyrics = "VerseOne" \lyricsto "Melody" \Lyrics
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #-2
  }
}
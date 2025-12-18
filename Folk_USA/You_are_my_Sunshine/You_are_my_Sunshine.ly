\version "2.24.0"
\language "english"

%  - http://folksongcollector.com/sunshine.html"

\header {
  title = "You are my Sunshine"
  composer = "Jimmie Davis and Charles Mitchell"
  country = "USA"
  style = "old-time"
}

\include "../../common/common-header.ily"


Melody = {
  \clef "treble"
  \key g \major
  \time 4/4
  \partial 2
  r8 d'8-0 g'8-1 a'8
  \repeat volta 3 {
    | b'4  b'4  ~ b'8 b'8 as'8 b'8
    | g'4  g'4  ~ g'8 g'8 a'8 b'8
    | c''4  e''4    d''4 c''4
    | b'2        r8 g'8 a'8 b'8
    \break
    | c''4  e''4  ~ e''8 e''8 d''8 c''8
    | b'4  g'4  ~ g'4 g'8 a'8
    | b'4. c''8    a'4. b'8
    | g'2        r8 d'8 g'8 a'8
    \break
    | b'4  b'4    r8 b'8 as'8 b'8
    | g'4  g'4    r8 g'8 a'8 b'8
    | c''4  e''4 ~  e''8 e''8 d''8 c''8
    | b'2        r8 g'8 a'8 b'8
    \break
    | c''4  e''4  ~ e''8 e''8 d''8 c''8
    | b'4  g'4  ~ g'4 g'8 a'8
    | b'4. c''8    a'4 a'8 b'8
  }
  \alternative {
    { g'2 ~       g'8 d'8 g'8 a'8   }
    { g'2 ~       g'2    }
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
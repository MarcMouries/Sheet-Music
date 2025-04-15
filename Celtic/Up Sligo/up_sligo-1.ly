\version "2.7.40"
\header {
  title = "Up Sligo"
  crossRefNumber = "1"
  footnotes = ""
 % subtitle = "https://thesession.org/tunes/537#setting537"
  tagline = "L"
}
voicedefault =  {
  \set Score.defaultBarType = ""

  \time 6/8 \key e \minor   \repeat volta 2 {
    e'8    b'    b'    b'    a'
    g'8    \bar "|"   fis'    d''    d''    a'    fis'    d'    \bar "|"
    e'8    b'    b'    e'    b'    b'    \bar "|"   a'    g'    fis'    e'
    fis'8    d'
   \break
   e'    b'    b'    b'    a'    g'
    \bar "|"   fis'8    d''    d''    a'    b'    cis''    \bar "|"   d''
    e''8    d''    b'    g'    b'    \bar "|"   a'    g'    fis'    e'4
    d'8
  }     \repeat volta 2 {
    b'8    e''    e''    e''    d''    e''
    \bar "|"   fis''8    e''    fis''    d''    b'    a'    \bar "|"   b'
    e''8    e''    b'    e''    e''    \bar "|"   fis''    e''    cis''
    d''4    a'8    \bar "|"     b'    e''    e''    e''    d''    e''
    \bar "|"   fis''8    e''    fis''    d''    b'    a'    \bar "|"   b'
    d''8    b'    g'    b'    d''    \bar "|"   a'    g'    fis'    e'4
    e'8
  }
}

\score{
  <<

    \context Staff="default"
    {
      \voicedefault
    }

  >>
  \layout { indent = 0  }
  \midi {}
}

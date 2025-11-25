\version "2.7.40"
\header {
  crossRefNumber = "1"
  footnotes = ""
  subtitle = "https://thesession.org/tunes/537#setting537"
  tagline = "Lily was here 2.19.15 -- automatically converted from ABC"
  title = "Up Sligo"
}
voicedefault =  {
  \set Score.defaultBarType = ""

  \time 6/8 \key e \minor   \repeat volta 2 {
    e'8[    b'    b']    b'[
    a'8    g']    \bar "|"   fis'[    d''    d'']    a'[    fis'    d']
    \bar "|"   e'8[    b'    b']    e'[    b'    b']    \bar "|"   a'[    g'
    fis'8]    e'[    fis'    d']    \bar "|"     e'[    b'    b']    b'[
    a'8    g']    \bar "|"   fis'[    d''    d'']    a'[    b'    cis'']
    \bar "|"   d''8[    e''    d'']    b'[    g'    b']    \bar "|"   a'[
    g'8    fis']    e'4[    d'8]
  }     \repeat volta 2 {
    b'8[    e''    e''
    ]   e''8[    d''    e'']    \bar "|"   fis''[    e''    fis'']    d''[
    b'8    a']    \bar "|"   b'[    e''    e'']    b'[    e''    e'']
    \bar "|"   fis''8[    e''    cis'']    d''4[    a'8]    \bar "|"     b'[
    e''8    e'']    e''[    d''    e'']    \bar "|"   fis''[    e''    fis''
    ]   d''8[    b'    a']    \bar "|"   b'[    d''    b']    g'[    b'
    d''8]    \bar "|"   a'[    g'    fis']    e'4[    e'8]
  }
}

\score{
  <<

    \context Staff="default"
    {
      \voicedefault
    }

  >>
  \layout {
  }
  \midi {}
}

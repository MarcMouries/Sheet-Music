\version "2.7.40"
\header {
  crossRefNumber = "1"
  footnotes = ""
  style = "jig"
  source = "https://thesession.org/tunes/397#setting13238"
  tagline = "Lily was here 2.24.4 -- automatically converted from ABC"
  title = "The Trip To Sligo"
  composer = "Traditional"
  country = "Ireland"
  transcription = "spindizzy"
}
voicedefault =  {
  \set Score.measureBarType = ""

  \time 6/8 \key g \major   \repeat volta 2 {
    d'8  \bar "|"   e'4[    b'8]
    b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]    a'8[    fis'8    d'8]
    \bar "|"   e'4[    b'8]    b'8[    g'8    e'8]  \bar "|"   g'8[    fis'8]
    e'8[    e''4    fis''8]  \bar "|"     g''8[    fis''8    e''8]    d''8[    c''8
    b'8]  \bar "|"   a'8[    fis'8    d''8]    a'8[    fis'8    d'8]  \bar "|"
    e'4[    b'8]    b'8[    g'8    b'8]  \bar "|"   a'8[    g'8    fis'8    e'4]
  }
  \repeat volta 2 {
    b'8  \bar "|"   e''8[    b'8    e''8]    g''8[    b''8
    e''8]  \bar "|"   fis''8[    d''8    fis''8]    fis''8[    g''8    fis''8]
    \bar "|"   e''8[    b'8    e''8]    g''8[    b''8    e''8]  \bar "|"     fis''8
    [   a''8    fis''8]    g''8[    fis''8    e''8]  \bar "|"   e''8[    b'8
    e''8]    g''8[    b''8    e''8]  \bar "|"   d''8[    cis''8    d''8]    a'8[
    fis'8    d'8]  \bar "|"   e'8[    fis'8    g'8]    a'8[    b'8    c''8]
    \bar "|"   b'8[    g'8]    fis'8[    e'4]
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

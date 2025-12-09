\version "2.24.0"

\header {
  title = "Up Sligo"
  composer = "Traditional"
  country = "Ireland"
  footnotes = ""
  source = "https://thesession.org/tunes/537#setting13483"
  genre = "Folk"

  subgenre = "Irish"
}

\include "../../common/common-header.ily"
voicedefault =  {
  \time 6/8
  \key e \dorian
  \tempo 4. = 120
  \repeat volta 2 {
  e'8    b'    b'    b'    a'    g'
  fis'8    a'    a'    a'    g'    fis'    e'    b'    b'    g'
  b'8    d''  \bar "|"   a'    g'    fis'    e'4    d'8
  \break
  e' b'8    b'    b'    a'    g'    fis'    a'    a'    a'    b'
  cis''8  \bar "|"   d''    cis''    d''    b'    d''    b'
  }
  \alternative {
    {a'8    g'    fis'    e'4    d'8  }
    {a'8    g'    fis'    e'4    a'8  }
  }
\break
  \repeat volta 2 {
  b'    e''    e''    e''    d''    e''  \bar "|"   fis''
  e''8    fis''    d''    b'    a'  \bar "|"   b'    e''    e''    e''
  d''8    e''  \bar "|"   fis''    d''    cis''    d''4    a'8
  \break
  b'8    e''    e''    e''    d''    e''  \bar "|"   fis''    e''
  fis''8    d''    b'    a'  \bar "|"   b'    d''    b'    g'    b'
  d''8
  }
  \alternative {
    {  a'    g'    fis'    e'4    a'8   }
    {a'    g'    fis'8    e'4    d'8 }
  }
  \bar "||"
}

\score{
  <<

    \context Staff="default"
    {
      \voicedefault
    }

  >>
  \layout {indent = 0
  }
  \midi {}
}

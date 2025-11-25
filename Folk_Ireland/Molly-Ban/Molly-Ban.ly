\version "2.24.4"
\language "english"

\header {
  title = "Molly Bán"
  subtitle = "aka Fair-Haired Molly"
  crossRefNumber = "1"
  footnotes = ""
  meter = "reel"
  %subtitle = "https://thesession.org/tunes/1637#setting1637"
  tagline = ""
  transcription = "emily_bmore"
}

melody =  {
  \time 4/4 
  \key e \dorian
  \repeat volta 2 {
    e'8    b'8    b'8     a'8    b'8 \override NoteHead.color = #red
 d''8
 \override NoteHead.color = #black    a'8    g'8
    fs'8   d'8    a'8     d'8    b'8    d'8    a'8      
    \override NoteHead.color = #red
 fs'8
 \override NoteHead.color = #black
    e'8    b'8    b'8     a'8    b'4    b'8    cs''8
    d''8   b'8    a'8     fs'8   b'8    a'8    g'8    fs'8
    e'8    b'8    b'8     a'8    b'4    a'8    g'8
    fs'8   d'8    a'8     d'8    b'8    d'8    a'8    d'8
    e'8    b'8    b'8     a'8    b'4    b'8    cs''8
    d''8   b'8    a'8     fs'8   g'8    e'8    e'4
  }
  \break
  \repeat volta 2 {
    e''4    b'8     e''8    e''8     d''8     e''8     g''8
    d''8    b'8     b'8     cs''8    d''4.    d''8
    e''4    b'8     e''8    e''8     d''8     e''8     g''8
    d''8    b'8     a'8     fs'8     g'8      e'8      e'4
    e''8    b'8     g'8     b'8      e''8     fs''8    fs''8    e''8
    d''8    b'8     b'8     cs''8    d''4.    e''8
    fs''4.  e''8    d''8    e''8    fs''8     e''8
    d''8    b'8     a'8     fs'8     g'8      e'8      e'4
  }
}

\score {
  \new Staff { \melody }
  \layout {  }
  \midi {}
}
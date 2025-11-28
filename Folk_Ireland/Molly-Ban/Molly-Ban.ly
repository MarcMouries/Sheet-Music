\version "2.24.4"
\language "english"
\include "../../stylesheets/stylesheet_fiddle.ly"

\header {
  title = "Molly Bán"
  composer = "Traditional"
  country = "Ireland"
  subtitle = "aka Fair-Haired Molly"
  composer = "Trad. Irish"
  style = "reel"
  session = "https://thesession.org/tunes/1637#setting1637"
  tagline = ""
  video = "https://www.youtube.com/watch?v=29AUiWEPs3o"
}


colorRed =
#(define-music-function (parser location music) (ly:music?)
   #{
     \override NoteHead.color = #(x11-color 'red)
     \override Stem.color     = #(x11-color 'red)
     $music
     \revert NoteHead.color
     \revert Stem.color
   #})

melody =  {
  \time 4/4 
  \key e \dorian
  \repeat volta 2 {
    e'8    b'8    \acciaccatura {b'8 d''}   b'8(    a'8)    b'4 
     a'8\downbow    g'8
    fs'8   d'8    a'8     d'8    b'8    d'8    a'8  d'8

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


\markup \bold \larger "Version 2"
melody_B =  {
  \time 4/4 
  \key e \dorian
  \repeat volta 2 {
    e'8    b'8    \acciaccatura {b'8 d''}   b'8    a'8    b'8 \colorRed {  d''8 }
     a'8\downbow    g'8
    fs'8   d'8    a'8     d'8    b'8    d'8    a'8
    \colorRed {  fs'8 }

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
  \new Staff { \melody_B }
  \layout {  }
  \midi {}
}





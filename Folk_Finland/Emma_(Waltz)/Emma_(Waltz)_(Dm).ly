\version "2.24.4"
\include "../../common/stylesheet_fiddle.ly"
\language "english"

\include "Emma_(Waltz)_music.ily"

\header {
  title    = "Emma's Waltz"
  subtitle = "As played by Sarah Comer"
  composer = "Traditional Finnish"
  country = "Finland"
  genre = "Folk"
  video = "https://www.youtube.com/watch?v=VuB9Zu-YOj8"
  
}

\include "../../common/common-header.ily"

\score {
  <<
  \new Staff \with {  midiInstrument = "violin" } 
  \emmaMelody
  
  \relative c' {
      \partial 4. r8 d8 f
      | a4. bf8 a4
      | f4 d4 f4
      | a4. bf8 a4
      | f4 d4 f4
      | e2 e8 f
      | g4 f g 
      | a8 r8 f8 e16 f16 
      e4 d2 d8 f
      | r4 r8 d8 f8 a8
      | d4. r8 r4
      | r4 r4 r4
      | r4 r4 r4
      | r4 r4 r4
      | r4 r4 r4
  
  }
  >>
  
  \layout { }
  \midi { \tempo 4 = 120 }
}

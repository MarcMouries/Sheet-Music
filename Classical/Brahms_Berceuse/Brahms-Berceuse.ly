\version "2.24.4"
\language "english"

\header {
  title = "Wiegenlied (Lullaby / Berceuse)"
  subtitle = "aus \"Des Knaben Wunderhorn\""
  composer = "Johannes Brahms (1833–1897)"
  poet = "Volkslied"
    video = ""
  tagline = ##f
}

\paper {
  indent = 0
  #(set-paper-size "a4")
}

melody = \relative c'' {
  \key c \minor
  \time 3/4
  \tempo "Zart bewegt"
  r2. 
  r4 r4 g8 g8 |
  % m2–4
  | bf4. g8 g4 
  | bf4 r4 g8( bf)
  \break
  | ef4 d4. c8 
  | c4(  bf4) f8( g)
  | af4 f4 f8( g)
  | af4 r4 f8( af)
  | d8( c) bf4 d4
  \break
  | ef4 r4 ef,8 ef8
  | ef'2 c8 af8
  | bf2 g8 ef8
  | af4 bf c
  \break
  | bf2 ef,8 ef8
  | ef'2 c8 af8
  | bf2 g8 ef8
  | af4 g f
  | ef2 r4 
  \bar "|."
}

\score {
  \new Staff \with { instrumentName = "" } { \melody }
}

\score { \transpose g a \melody }

\score { \transpose g b \melody } 

\score { \transpose g c \melody } 

\score { \transpose g d \melody } 

\score { \transpose g e \melody } 

\score { \transpose g fs \melody } 
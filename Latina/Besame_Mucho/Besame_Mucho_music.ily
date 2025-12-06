\version "2.24.0"
\language "english"

global = {
  \key d \minor
  \time 4/4
  \tempo 4 = 96
}

chordNames = \chordmode {
  \global
  d1:m d:m a:7 a:7
  d:m d:m bf:maj7 a:7
  d:m d:m a:7 a:7
  d:m g:m d:m d:m
}

melody = \relative c'' {
  \global

  % Intro / First phrase: "Bésame, bésame mucho"
  \repeat volta 2 {
    a4 a8 a~ a4 g8 f~
    f2 e4 d
    e4 e8 e~ e4 d8 cs~
    cs1
    \break

    a'4 a8 a~ a4 g8 f~
    f2 e4 d
    d'4 d8 d~ d4 c8 bf~
    bf2 a
    \break
  }

  % Second phrase: "Como si fuera esta noche"
  a4 a8 a~ a4 g8 f~
  f2 e4 d
  e4 e8 e~ e4 d8 cs~
  cs1
  \break

  % Final phrase
  f4 f8 f~ f4 e8 d~
  d4 g2.
  a4 a8 a~ a2~
  a1
  \bar "|."
}

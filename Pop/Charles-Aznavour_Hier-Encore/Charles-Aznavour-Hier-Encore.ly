\version "2.24.2"
\language "english"

\header {
  title = "Hier Encore"
  subtitle = "Violino"
  composer = "Charles Aznavour"
  style = "chanson"
  tagline = ""
}

violin = \relative c' {
  \clef treble
  \key f \major
  \time 3/4
  \tempo 4 = 89
  r8 d8 e[ f] a d |
  e2 ~ e8 d8 
  e2 ~ e8 d8 
  e2 d8 a8 
  c8 bf e,[ f] g a |
  e8 d a2 |
  c'8 bf e,[ f] a g |
  e d a2
  \break
  %%%%
  r8 d'8 e[ f] a d |
  e2 ~ e8 d8 
  e2 ~ e8 d8 
  e2 d8 a8 
  c8 bf e,[ f] g a |
  e8 d a2 |
  c'8 bf e,[ f] a g |
  e d a2
}

\score {
  \new Staff {
    \new Voice = "violin" \violin
  }
}

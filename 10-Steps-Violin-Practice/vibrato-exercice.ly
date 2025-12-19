\version "2.24.4"
\language "english"

\header {
  title = "Vibrato Exercise"
  composer = "Marc Mouries"
  genre = "Exercise"
}

\include "../common/common-header.ily"

#(set-global-staff-size 24)

\score {
  \relative d'' {
    \key d \major
    d4-3( cs-3) d( cs) d( cs) d( cs)
    \bar ":|."
    d8-3( cs-3 d cs) d( cs d cs) d( cs d cs) d( cs d cs)
    \bar ":|."
    \break
    \tuplet 3/2 { d8-3( cs-3 d cs d cs) }
    \tuplet 3/2 { d( cs d cs d cs) }
    \tuplet 3/2 { d( cs d cs d cs) }
    \tuplet 3/2 { d( cs d cs d cs) }
    \bar ":|."
    d16-3( cs-3) d( cs) d cs d cs
    d16( cs) d( cs) d cs d cs
    d16( cs) d( cs) d cs d cs
    d16( cs) d( cs) d cs d cs
  }
  \layout {
    indent = 0
  }
}
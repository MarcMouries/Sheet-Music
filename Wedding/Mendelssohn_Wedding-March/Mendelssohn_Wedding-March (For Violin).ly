\version "2.24.4"
\language "english"

\header {
  title    = "Wedding March"
  subtitle = "Adapted from \"A Midsummer Night's Dream\""
  composer = "Felix Mendelssohn (1809–1847)"
  country = "Germany"
  arranger = "Violin adaptation"
  tagline  = ""
}

global = {
  \key c \major
  \time 4/4
}

violinMusic = \relative c' {
  \global
  \tempo "Allegro vivace" 4 = 96

  % --- FANFARE (from opening organ triplets) ---

  r2 r4 \tuplet 3/2 { c8\f c c } |
  c2 r4 \tuplet 3/2 { c8 c c } |
  c2 r4 \tuplet 3/2 { c8 c c } |
  e4 \tuplet 3/2 { e8 e e } e4 \tuplet 3/2 { e8 e e } |
  g4 \tuplet 3/2 { g8 g g } g4 r |

  % If you want, repeat that fanfare:
  % \repeat volta 2 { ... }

  % --- MAIN THEME (melody adapted from RH of the organ part) ---

  % Phrase 1
  c'2 g4 e |
  f2 f4 d |
  e2 e4 c |
  d2 d4 g, |

  % Phrase 2
  e'2 e4 c |
  d2 d4 g, |
  c2. r4 |

  % Phrase 3 – repeat in higher register for a fuller sound
  c'2 g4 e |
  f2 f4 d |
  e2 e4 c |
  d2 d4 g, |

  e'2 e4 c |
  d2 d4 g, |
  c2. r4
}

\score {
  \new Staff {
    \clef treble
    \violinMusic
  }
  \layout { }
  \midi { }
}

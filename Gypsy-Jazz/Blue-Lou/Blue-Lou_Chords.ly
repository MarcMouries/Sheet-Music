\version "2.24.4"
\language "english"

\header {
  title = "Blue Lou – Arpeggio Practice"
  subtitle = "Practice"
  composer = "practice etude"
  style = "gypsy jazz"
}

global = {
  \key f \major
  \time 4/4
  \tempo 4 = 160
}

% --- CHORDS (English roots) ---
% Use 'bf' for B-flat, 'ef' for E-flat, 'cs' for C-sharp, etc.
chordSymbols = \chordmode {
  % 1–4
  g1:m7.5-  c1:7  g1:m7.5-  c1:7
  % 5–8
  f1        bf1   g1:m7     c1:7
  % 9–12
  g1:m7.5-  c1:7  g1:m7.5-  c1:7
  % 13–16
  f1        bf1   g2:7 c2:7 f1
  % 17–20
  c1        cs1:dim7  d1:m7  g1:7
  % 21–24
  c1        cs1:dim7  d2:m7 g2:7  c1:7
  % 25–28
  g1:m7.5-  c1:7  g1:m7.5-  c1:7
  % 29–32
  f1        bf1   g2:7 c2:7  f1
}

% --- MELODY: Straight quarters (arpeggio guide tones) ---
melodyQuarters = \relative c' {
  \global
  % 1–4  (Gm7♭5 → C7)
  g4 bf4 df4 f4 |
  c4 e4 g4 bf4 |
  g,4 bf4 df4 f4 |
  c4 e4 g4 bf4 |

  % 5–8  (F → Bb → Gm7 → C7)
  f4 a4 c4 a4 |
  bf,4 d4 f4 d4 |
  g,4 bf4 d4 f4 |
  c4 e4 g4 bf4 |

  % 9–12  (repeat of 1–4)
  g,4 bf4 df4 f4 |
  c4 e4 g4 bf4 |
  g,4 bf4 df4 f4 |
  c4 e4 g4 bf4 |

  % 13–16  (F → Bb → G7 / C7 → F)
  f4 a4 c4 a4 |
  bf,4 d4 f4 d4 |
  g,4 b4 c4 e4 |
  f4 a4 c4 a4 |

  % 17–20  (C → C#°7 → Dm7 → G7)
  c,4 e4 g4 e4 |
  cs4 e4 g4 bf4 |
  d,4 f4 a4 c4 |
  g,4 b4 d4 f4 |

  % 21–24  (C → C#°7 → Dm7 / G7 → C7)
  c4 e4 g4 e4 |
  cs4 e4 g4 bf4 |
  d,4 f4 g4 b4 |
  c,4 e4 g4 bf4 |

  % 25–28  (repeat of 1–4)
  g,4 bf4 df4 f4 |
  c4 e4 g4 bf4 |
  g,4 bf4 df4 f4 |
  c4 e4 g4 bf4 |

  % 29–32  (F → Bb → G7 / C7 → F)
  f4 a4 c4 a4 |
  bf,4 d4 f4 d4 |
  g,4 b4 c4 e4 |
  f1
}

% --- MELODY: Swing eighths (triplet long–short pairs)
% For each beat: \tuplet 3/2 { note8 ~ note8 nextNote8 }
% --- MELODY: Swing eighths (triplet long–short pairs) ---
melodySwing = \relative c' {
  \global
  \mark \markup { \italic "Swing 8ths (triplet feel: ♪ =  ♩♪ in triplets)" }

  % 1–4  (Gm7♭5 → C7)   [bars 1–4: g • c • g, • c]
  \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } |
  \tuplet 3/2 { c,8~ c8 e8 }  \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { c8~ c8 e8 }  \tuplet 3/2 { g8~ g8 bf8 } |
  \tuplet 3/2 { g,,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } |
  \tuplet 3/2 { c8~ c8 e8 }  \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { c8~ c8 e8 }  \tuplet 3/2 { g8~ g8 bf8 } |

  % 5–8  (F → Bb → Gm7 → C7)   [bars 5–8: f • bf, • g, • c]
  \tuplet 3/2 { f,8~ f8 a8 }   \tuplet 3/2 { c8~ c8 a8 }  \tuplet 3/2 { f8~ f8 a8 }   \tuplet 3/2 { c8~ c8 a8 } |
  \tuplet 3/2 { bf,8~ bf8 d8 } \tuplet 3/2 { f8~ f8 d8 } \tuplet 3/2 { bf8~ bf8 d8 } \tuplet 3/2 { f8~ f8 d8 } |
  \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { d8~ d8 f8 }  \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { d8~ d8 f8 } |
  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 bf8 } |

  % 9–12  (repeat of 1–4 registers: g, • c • g, • c)
  \tuplet 3/2 { g,,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } |
  \tuplet 3/2 { c8~ c8 e8 }    \tuplet 3/2 { g8~ g8 bf8 }  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 bf8 } |
  \tuplet 3/2 { g,,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } |
  \tuplet 3/2 { c8~ c8 e8 }    \tuplet 3/2 { g8~ g8 bf8 }  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 bf8 } |

  % 13–16  (F → Bb → G7/C7 → F)   [bars 13–16: f • bf, • (g,→)c • f]
  \tuplet 3/2 { f8~ f8 a8 }     \tuplet 3/2 { c8~ c8 a8 }  \tuplet 3/2 { f8~ f8 a8 }   \tuplet 3/2 { c8~ c8 a8 } |
  \tuplet 3/2 { bf,8~ bf8 d8 } \tuplet 3/2 { f8~ f8 d8 } \tuplet 3/2 { bf,8~ bf8 d8 } \tuplet 3/2 { f8~ f8 d8 } |
  \tuplet 3/2 { g,8~ g8 b8 }    \tuplet 3/2 { g8~ g8 b8 }  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { c8~ c8 e8 } |
  \tuplet 3/2 { f8~ f8 a8 }     \tuplet 3/2 { c8~ c8 a8 }  \tuplet 3/2 { f8~ f8 a8 }   \tuplet 3/2 { c8~ c8 a8 } |

  % 17–20  (C → C#°7 → Dm7 → G7)   [bars 17–20: c, • cs • d, • g,]
  \tuplet 3/2 { c,8~ c8 e8 } \tuplet 3/2 { g8~ g8 e8 }  \tuplet 3/2 { c8~ c8 e8 } \tuplet 3/2 { g8~ g8 e8 } |
  \tuplet 3/2 { cs8~ cs8 e8 } \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { cs8~ cs8 e8 } \tuplet 3/2 { g8~ g8 bf8 } |
  \tuplet 3/2 { d,8~ d8 f8 } \tuplet 3/2 { a8~ a8 c8 }  \tuplet 3/2 { d,8~ d8 f8 } \tuplet 3/2 { a8~ a8 c8 } |
  \tuplet 3/2 { g,8~ g8 b8 } \tuplet 3/2 { d8~ d8 f8 }  \tuplet 3/2 { g,8~ g8 b8 } \tuplet 3/2 { d8~ d8 f8 } |

  % 21–24  (C → C#°7 → Dm7/G7 → C7)   [bars 21–24: c • cs • (d,→)g • c,]
  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 e8 }  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 e8 } |
  \tuplet 3/2 { cs,8~ cs8 e8 } \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { cs8~ cs8 e8 } \tuplet 3/2 { g8~ g8 bf8 } |
  \tuplet 3/2 { d,8~ d8 f8 } \tuplet 3/2 { d,8~ d8 f8 } \tuplet 3/2 { g8~ g8 b8 }  \tuplet 3/2 { g8~ g8 b8 } |
  \tuplet 3/2 { c,8~ c8 e8 } \tuplet 3/2 { g8~ g8 bf8 } \tuplet 3/2 { c,8~ c8 e8 } \tuplet 3/2 { g8~ g8 bf8 } |

  % 25–28  (repeat of 1–4 registers: g, • c • g, • c)
  \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } |
  \tuplet 3/2 { c8~ c8 e8 }    \tuplet 3/2 { g8~ g8 bf8 }  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 bf8 } |
  \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } \tuplet 3/2 { g,8~ g8 bf8 } \tuplet 3/2 { df8~ df8 f8 } |
  \tuplet 3/2 { c,8~ c8 e8 }    \tuplet 3/2 { g8~ g8 bf8 }  \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { g8~ g8 bf8 } |

  % 29–32  (F → Bb → G7/C7 → F)   [bars 29–32: f • bf, • (g,→)c • f]
  \tuplet 3/2 { f8~ f8 a8 }    \tuplet 3/2 { c8~ c8 a8 }  \tuplet 3/2 { f8~ f8 a8 }   \tuplet 3/2 { c8~ c8 a8 } |
  \tuplet 3/2 { bf,8~ bf8 d8 } \tuplet 3/2 { f8~ f8 d8 } \tuplet 3/2 { bf,8~ bf8 d8 } \tuplet 3/2 { f8~ f8 d8 } |
  \tuplet 3/2 { g,8~ g8 b8 }   \tuplet 3/2 { g8~ g8 b8 } \tuplet 3/2 { c8~ c8 e8 }   \tuplet 3/2 { c8~ c8 e8 } |
  \tuplet 3/2 { f8~ f8 a8 }    \tuplet 3/2 { c8~ c8 a8 }  \tuplet 3/2 { f8~ f8 a8 }   \tuplet 3/2 { c8~ c8 a8 } |
}

\score {
  \new StaffGroup <<
    \new ChordNames { \set chordChanges = ##f \chordSymbols }
    \new Staff \with { instrumentName = "Arpeggio" }
      { \clef treble \melodyQuarters }
    \new Staff \with { instrumentName = "Swing 8ths (triplet feel)" }
      { \clef treble \melodySwing }
  >>
  \layout { }
}

\score {
  \unfoldRepeats
  \new StaffGroup <<
    \new ChordNames { \chordSymbols }
    \new Staff { \melodyQuarters }
    \new Staff { \melodySwing }
  >>
  \midi { }
}

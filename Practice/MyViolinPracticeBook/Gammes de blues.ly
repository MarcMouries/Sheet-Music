\version "2.19.49"
\language "english"
%#(set-global-staff-size 22)

raisedSharp = \markup \raise #0.6 \sharp

\header {
  title = "Gammes de Blues"
  subtitle = "1 3 "
  tagline = ##f
}

Am_notes =  \relative c' {
  \time 6/4
  a' c d ef  e g
}
cMaj =  \relative c' {
  \time 6/4
  c d
  \tweak color #blue
  \tweak Accidental.color #blue
  ef
  e g a
}

% Do 2
Do = \markup {
  \score {
    \transpose c c \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Do"
      }
    }
  }
}
Am = \markup {
  \score {
    \transpose a a \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Am"
      }
    }
  }
}



% Si 1
Si = \markup {
  \score {
    \transpose c b, \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Si"
      }
    }
  }
}
Bm = \markup {
  \score {
    \transpose a b, \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Bm"
      }
    }
  }
}

C_sharp_minor = \markup {
  \score {
    \transpose a cs \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = \markup \small \concat { "C" \raisedSharp "m" }
      }
    }
  }
}

F_sharp_minor = \markup {
  \score {
    \transpose a fs \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = \markup \small \concat { "F" \raisedSharp "m" }
      }
    }
  }
}
G_sharp_minor = \markup {
  \score {
    \transpose a gs \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = \markup \small \concat { "G" \raisedSharp "m" }
      }
    }
  }
}


Cm = \markup {
  \score {
    \transpose a c \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Cm"
      }
    }
  }
}
Dm = \markup {
  \score {
    \transpose a d \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Dm"
      }
    }
  }
}
Em = \markup {
  \score {
    \transpose a e \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Em"
      }
    }
  }
}
Fm = \markup {
  \score {
    \transpose a f \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Fm"
      }
    }
  }
}
Gm = \markup {
  \score {
    \transpose a g, \Am_notes
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Gm"
      }
    }
  }
}

% Re 3
Re = \markup {
  \score {
    \transpose c d \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Ré"
      }
    }
  }
}


% Mi 4
Mi = \markup {
  \score {
    \transpose c e \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Mi"
      }
    }
  }
}



% Fa 5
Fa = \markup {
  \score {
    \transpose c f \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Fa"
      }
    }
  }
}

% sol 6
Sol = \markup {
  \score {
    \transpose c g \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "Sol"
      }
    }
  }
}

% la 7
La = \markup {
  \score {
    \transpose c a \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = "La"
      }
    }
  }
}

B_flat = \markup {
  \score {
    \transpose c bf, \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = \markup \small \concat { "B" \flat }
      }
    }
  }
}
E_flat = \markup {
  \score {
    \transpose c ef \cMaj
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
        \remove "Bar_engraver"
        instrumentName = \markup \small \concat { "E" \flat }
      }
    }
  }
}
\markuplist {
  \vspace #2
  \fill-line {
    \hspace #1
    \override #'(baseline-skip . 11) {
      \left-column {
        \Do
        \Sol
        \Re
        \La
        \Mi
        \Si
        \Fa
        \B_flat
        \E_flat
      }
    }
    \hspace #1
    \override #'(baseline-skip . 11) {
      \left-column {
        \Am
        \Em
        \Bm
        \F_sharp_minor
        \C_sharp_minor
        \G_sharp_minor
        \Dm
        \Gm
        \Cm
      }
    }
    \hspace #1
  }
}


\markup \bold "Blues Scale"
Blues_Scale_in_Am_notes =  \relative c' {
  \time 4/4
  a8 c d ef  e g
  a c d ef  e g

  a g e ef d c
  a e e ef d c
}
\score {
  \transpose c c \Blues_Scale_in_Am_notes
  \layout {
    \context {
      \Staff
      %        \remove "Time_signature_engraver"
      %        \remove "Bar_engraver"
      instrumentName = \markup \small \concat { "Am" }
    }
  }
}

Blues_Scale_in_C_notes =  \relative c' {
  \time 4/4
  c8 d ef e  g
  a8 c d  ef e g
  a c a g e ef d c a g e ef d
}
\score {
  \transpose c c  \Blues_Scale_in_C_notes
  \layout {
    \context {
      \Staff

      instrumentName = "Do"
    }
  }
}

\markup \bold "Pentatonic Scale"





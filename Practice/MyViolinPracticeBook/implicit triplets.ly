\relative c'' {
   \time 2/4

  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/8)
  \set Timing.beatStructure = #'(1 1 1 1)

  % explicit triplets
  \tuplet 3/2 8 { c16 d e c d e c d e c d e } |

  % implicit triplets - version 1
  % omit the tuplet indicators after the first three notes) to
  % indicate that these are triplets but not to repeat the '3' all the time.
  {
    \tuplet 3/2 8 { c16 d e
      \omit TupletNumber
      \omit TupletBracket
        c d e c d e c d e }
  }
  % implicit triplets - version 2
  c16*2/3 d e c d e c d e c d e |

  % implicit triplets - version 3
  \scaleDurations 2/3 {
    c16 d e c d e c d e c d e |
  }
}
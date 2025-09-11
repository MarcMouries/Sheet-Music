\version "2.18.2"

voiceone = \relative c'' {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \override MultiMeasureRest #'staff-position = #2.0

    R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 |

    \tupletDown

    b,4\rest \tuplet 3/2 { fis'8 d b } 

    \override TupletBracket.bracket-visibility = ##f

    \tuplet 3/2 { fis'8 d b } |

    \hide TupletNumber

     b4\rest \tuplet 3/2 { a8 cis fis } b,4\rest |

    \repeat unfold 5 {
	b4\rest \tuplet 3/2 { { fis'8 d b } { fis'8 d b } }
	b4\rest \tuplet 3/2 { a8 cis fis } b,4\rest |
    }

    b4\rest \tuplet 3/2 { { a8 cis fis } { a, cis fis } } 
    b,4\rest \tuplet 3/2 { {fis'8 d b } {fis' d b } }
    R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 |
    b4\rest \stemUp \tuplet 3/2 { { c8[ e a } { d, e a] } { d,[ a' fis } { d a' fis] } } c4 |
    \stemNeutral
    R1*3/4 | R1*3/4 | R1*3/4 |
    b4\rest \stemUp \tuplet 3/2 { { c8[ e a } { d, e a] } { d,[ a' fis } { d a' fis] } } c4 |
    \repeat unfold 5 { R1*3/4 } |
    \stemNeutral
    b4\rest < a d fis > < b d g > | < c e a^~ >2. | < d fis a > |

    R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 |

    \stemDown b4\rest \tuplet 3/2 { fis'8 d b } 

    \tuplet 3/2 { fis'8 d b } | b4\rest \tuplet 3/2 { a8 cis fis } b,4\rest |

    \repeat unfold 5 {
	b4\rest \tuplet 3/2 { { fis'8 d b } { fis'8 d b } }
	b4\rest \tuplet 3/2 { a8 cis fis } b,4\rest |
    }

    b4\rest \tuplet 3/2 { { a8 cis fis } { a, cis fis } } 
    b,4\rest \tuplet 3/2 { {fis'8 d b } {fis' d b } }
    R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 |
    b4\rest \stemUp \tuplet 3/2 { { c8[ e a } { d, e a] } { d,[ a' fis } { d a' fis] } } c4 |
    R1*3/4 | R1*3/4 | R1*3/4 |
    \stemNeutral
    b4\rest \stemUp \tuplet 3/2 { { c8[ e a } { d, e a] } { d,[ a' fis } { d a' fis] } } c4 |
    \repeat unfold 5 { R1*3/4 } |
    \stemNeutral
    b4\rest < a d f > < b d g > | < c e a~ >2. | < d f a > | 
}


voicetwo = \relative c' {
    \mergeDifferentlyHeadedOn
    \set fingeringOrientations = #'(left)
    \set harmonicDots = ##t
    \stemNeutral \tieNeutral
    \repeat unfold 24 { s2. }
    b4\rest c d | d d c |
    s2. | s2. | s2. |
    b4\rest c d | d d c |
    \repeat unfold 32 { s2. }
    b4\rest c d | d d c |
    \repeat unfold 3 { s2. }
    b4\rest c d | d d c |
}

voicethree = \relative c' {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
}

voicefour = \relative c {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
}

guitartwo = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


\version "2.18.2"

voiceone = \relative c' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \override MultiMeasureRest #'staff-position = #2.0

    \repeat unfold 8 { s2. }

    \stemUp
    \TDnc fis,2.^~^> | fis2. |\TDnc fis2.^~ | fis2. |
    \stemUp
    \repeat unfold 6 { s2. }
    e2.^> | \TUpc e^~ | e |
    \repeat unfold 3 { s2. }
    d'4\rest \TUpb a'2^~ | a2. | a^(^~ | a |
    g4) d\rest d\rest | d\rest a'2^~ | a2. |

    \repeat unfold 16 { s2. }
    \override NoteHead.style = #'harmonic
    \override NoteHead.font-size = #1.2
    \ottava #1
    \set Staff.ottavation = #"8ve"
    fis'2. | fis2. | fis2.^~ | fis2. |
    \ottava #0
    \repeat unfold 6 { s2. }
    \ottava #1
    \set Staff.ottavation = #"8ve"
    e2. | \TUpa e^~ | e |
    \ottava #0
    \repeat unfold 3 { s2. }
    d,4\rest \TUpb a'2^~ | a2. | a^(^~ | a |
    \H g4) d\rest d\rest | d\rest a'2^~ | a2. |
    \repeat unfold 5 { s2. } |
    \revert NoteHead.style
    \revert NoteHead.font-size
    s2. | s2. | s2. |
   % b,4\rest a d | < e a^~ >2._( | < f a >) |
}

voicetwo = \relative c' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral
    \repeat unfold 24 { s2. } |
    s4 a2_~ | a2. | a_~ | a | g4 s2 |
    s4 a2_~ | a2. |
    \repeat unfold 32 { s2. } |
    \override NoteHead.style = #'harmonic
    \override NoteHead.font-size = #1.2
    s4 a2_~ | a2. | a_~ | a | \H g4 s2 |
    s4 a2_~ | a2. |

}

voicethree = \relative c {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    s4^\markup {
        \translate #`(0 . 3 ) {
            \hspace #-5.0 \bold \roman \fontsize #1.0 "Lent et douloureux"
        }
    } 

}

voicefour = \relative c {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t

    \stemNeutral

    \repeat unfold 4 { g2. d } | 

    \stemDown

    \repeat unfold 2 { g2. d } | 

    \stemNeutral

    \repeat unfold 2 { g2. d } | 

    fis2. | b |

    \stemDown

    e, | e | d |

    \stemNeutral

    a' | d, | d | 

    \stemDown

    \repeat unfold 7 { d } |

    \stemNeutral

    e | fis | b | e, | e | e |
    a | d, |

    \bar "||"

    \repeat unfold 4 { g2. d } | 

    \stemDown

    \repeat unfold 2 { g'2. d } | 

    \stemNeutral

    \repeat unfold 2 { g,2. d } | 

    fis2. | b |

    \stemDown

    e | e | d |

    \stemNeutral

    a | d, | d |

    \stemDown

    \repeat unfold 7 { d } |

    \stemNeutral

    e | e | e | e | e | e |
    a | d, |

    \bar "|."

}

guitarthree = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


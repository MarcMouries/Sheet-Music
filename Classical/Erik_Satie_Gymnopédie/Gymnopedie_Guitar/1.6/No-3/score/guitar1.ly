\version "2.18.2"

voiceone = \relative c' {
    \set harmonicDots = ##t
    \mergeDifferentlyHeadedOn 
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0

    \clef "G"

    R1*3/4^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #-5.0 \bold \roman \fontsize #1.2 "Lent et grave"
	}
    } |

    \repeat unfold 9 { R1*3/4 } |

    a'2.^~^\pp | a2.^~ | a2. |

    \repeat unfold 4 { R1*3/4 } |

    \TDnd \SDno f2._(~ | f | g | \stemDown a4) g\rest g\rest |

}

voicetwo = \relative c' {
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0

    \repeat unfold 20 { s2. } |
    \stemUp \SUpg e'2.(^\markup { \dynamic p \hspace #0 \fontsize #-3 \italic " doux et expressif" } \stemNeutral |
    f4 g f | e d \TUpd e~ | \TUpd e2.~ | e4 d c | b c b | a4) b\rest b\rest |
    \repeat unfold 3 { R1*3/4 } |
    a'2.( | g4 f e | d e f | e d c | e2.) | g2( g4 | c, b a | b2 c4 | d2. | e) |
    \stemUp \SUpp e2.^( | f | g4) b,\rest b\rest |
    \repeat unfold 3 { R1*3/4 } | s2. | s2. |
    \SUph e2.(^\pp | \stemDown f4 g f | e d \TUpd e~ | \TUpd e2.~ | e4 d c | b c b | a4) b\rest b\rest |
    \repeat unfold 3 { R1*3/4 } |
    \TUpb e2.~ | e |
}

voicethree = \relative c'' {
    \stemNeutral \slurNeutral \tieNeutral
    \repeat unfold 10 { s2. } |
    \override NoteColumn.force-hshift = #0
    f,2._~ | f_~ | f |
    \revert NoteColumn.force-hshift
    \repeat unfold 27 { s2. } |
    \TIng c'2.^~ | c | e4 b\rest b\rest |
    \repeat unfold 3 { s2. } |
    \TUpf d2.~ | d | c4 g\rest g\rest |
}

voicefour = \relative c'' {
    \stemNeutral \slurNeutral \tieNeutral
    \repeat unfold 40 { s2. } |
    \stemDown
    %\TUph a2._~ | a | b4 s s |
    a2._~ | a | b4 s s |
    \repeat unfold 15 { s2. } |
    \override NoteColumn.force-hshift = #0
    a2._~ | a |
}

guitarone = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


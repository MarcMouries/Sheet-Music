\version "2.18.2"

voiceone = \relative c' {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \override MultiMeasureRest #'staff-position = #2.0

    \repeat unfold 20 { s2. } |

    \override NoteHead.style = #'harmonic
    \override NoteHead.font-size = #1.2
    < e e' >2.~ | < e e' >~ | \hideNotes < e e' > |
    \unHideNotes
    \repeat unfold 25 { s2. } |
    \clef "G"
    \stemDown
    \revert NoteHead.style
    \revert NoteHead.font-size

    \stemUp
    \TUph e'2.~ | e | \TUph e2.~ | e | \TUpd e2.^~ | e4 f g |
    \stemDown
    a2.^~ | a | a | g | e4 s2 |
}


voicetwo = \relative c'' {
    \mergeDifferentlyHeadedOn
    \set fingeringOrientations = #'(left)
    \set harmonicDots = ##t
    \stemNeutral \tieNeutral \slurNeutral

    \override MultiMeasureRest #'staff-position = #2.0

    \repeat unfold 4 { R1*3/4 } |
    
    \SUpq a2.(_\markup { \dynamic p \hspace #0 \fontsize #-3 \italic " doux et expressif" } |
    g4 f e | d e f | e d c | e2.) | g2 g4 | \TInc d2.~ | \TInd d~ | d |
    b4\rest \SDni c( f | g2 a4 | d, e f | b, a g) | \SUpf a2.^( | d,2.~ | d2.) |

    \override NoteHead.style = #'harmonic
    \override NoteHead.font-size = #1.2
    s2. | s2. |
    a''2.( | g | e | g | \H a4) b,\rest b\rest |
    \revert NoteHead.font-size
    \revert NoteHead.style

    \repeat unfold 3 { R1*3/4 } |
    a'2.( | g4 f e | d e f | e d c | e2.) | g2( g4 | c, b a | b2 c4 | d2. | e) |
    \repeat unfold 2 { R1*3/4 } |
    \clef "G"
    \SDnk g'2( a4 | d, e f | b, a g) | a2.( | d,4) b'\rest b\rest |
    \repeat unfold 1 { R1*3/4 } |
    \override NoteHead.style = #'harmonic
    \override NoteHead.font-size = #1.2
    \stemDown
    a2._( | g) |
    \SUpr a2._( | g | \stemDown e | g) |
    a2._~\harmonic | a |
    a2. | g | \H e4 b'\rest b\rest | R1*3/4 | 

   \bar "|."

}

voicethree = \relative c''' {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
    \repeat unfold 48 { s2. } |
    \once \override NoteColumn.force-hshift = #0
    a2.( |
    \once \override NoteColumn.force-hshift = #0
    g) |
    \once \override NoteColumn.force-hshift = #0
    a2.( |
    \once \override NoteColumn.force-hshift = #0
    g) |
}

voicefour = \relative c' {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t

    s2.^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #-4.2 \bold \roman \fontsize #1.0 "Lent et grave"
	}
    } |

    \repeat unfold 53 { s2. } |
    \stemDown
    \override NoteHead.style = #'harmonic
    \override NoteHead.font-size = #1.2
    a2.~ | a2. | a2.~ | a2.~ |
    a2.~ | a2.~ |
}

guitartwo = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


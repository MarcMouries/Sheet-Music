\version "2.18.2"

voiceone = \relative c'' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral
    \stemUp
    \repeat unfold 30 { s2. }
    a2.^~ | a |
    \repeat unfold 6 { s2. }
    \stemDown
    \TIng c,2.^~ | c |
}

voicetwo = \relative c' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \stemUp \slurUp

    \repeat unfold 10 { s2. }
    \SUpi < g b >2.( | < a c > | < g b >) |
    \repeat unfold 4 { s2. }
    c2.^~ | c | d2.^( | e4) b\rest b\rest |
    \repeat unfold 9 { s2. }
    \TUpd e2.^~ | e | < bes d g >( | < a d f >) |
    \TUpd < a c e^~ > | < g b e > | < a c f >( | < g b e >) | f'( | e) |
    \override MultiMeasureRest #'staff-position = #2.0
    R1*3/4 | R1*3/4 |
    < b e g >2.( | < a c f > | < a c e > | < a c f^~ > | < a c f >) |  < b e g > |
    \TDng < c e^~ a >( | < b e g >) | \TDng < c e^~ a >( | < b e g >) |
    \TDng < c e^~ a >( | < b e g >) | < a c f >( | < b e g >) |
    \TDng < c e^~ a >( | < b e g >) | < a c e a >~\A | < a c e a > |
}

voicethree = \relative c {
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0

    a2.(^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #-4.2 \bold \roman \fontsize #1.0 "Lent et grave"
	}
    } |

    d,) | a'( | d,) | 
    \SDnn a'( | c | g | d | a') | 
    \SDnq e_( | \stemDown g | d | g) |
    \stemUp \SDnp d_( | g~ | g~ | g) |
    \stemDown d_( | g_~ | g) | c_( |
    \stemUp e) | c( | e) | R1*3/4 | R1*3/4 |
    a,2.( | d,) | a'( | d,) | 
    \stemDown \SUpl a'_( | c | g | d | a') | 
    e_~ | e_~ | e | d_~ | d | d_~ | d |
    g_~ | g_~ | g | \SUpm d'_( | g,_~ | g) |
    c_( | e) | c_( | e) | c_( | e) |
    a,_( | d,) | a'_( | d,) |
    < a'_~ a' >\A | < a a' > |
    \bar "|."
}

voicefour = \relative c' {
    \stemNeutral \slurNeutral \tieNeutral
    \repeat unfold 17 { s2. }
    \override NoteColumn.force-hshift = #0
    \stemUp
    a2._~ | a | \SUpo b( | c4) s s |
    \repeat unfold 9 { s2. }
    \TUpj c2._~ | c | 
    \repeat unfold 6 { s2. }
    \stemDown
    a2._~ | a | 
}

guitarfour = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


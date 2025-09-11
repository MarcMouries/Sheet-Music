\version "2.18.2"

voiceone = \relative c' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \override MultiMeasureRest #'staff-position = #2.0
}

voicetwo = \relative c' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \stemUp

    \override MultiMeasureRest #'staff-position = #2.0

    b4\rest < c e a >2 | b4\rest < b e g >2 | 
    b4\rest < c e a >2 | b4\rest < b e g >2 | 
    b4\rest < a c e >2 | b4\rest < a c e >2 |
    b4\rest < g bes d >2 | b4\rest < f a d >2 |
    b4\rest < a c e >2 | b4\rest < g b e >2 |
    b4\rest < d, g b f' a >2\A | b'4\rest < d, a' c f a >2\A |
    b'4\rest < d, g b f' a >2\A | b'4\rest < f a c >2 |
    b4\rest < g b e >2 | b4\rest < f a c >2 |
    b4\rest < e, a c >2 | b'4\rest < f a c >2 |
    b4\rest < a c f >2 | b4\rest < b d g >2 |
    b4\rest < c e a >2 | b4\rest < b e g >2 |
    b4\rest < c e a >2 |
    b4\rest < b e g >2 |
    b4\rest < a c e > b\rest |
    b4\rest < b e g > b\rest |
    b4\rest < a c f >2 | b4\rest < b e g >2 | 
    b4\rest < c e a >2 | b4\rest < b e g >2 | 
   
    b4\rest < a c e > b\rest | b4\rest < a c e > b\rest |
    b4\rest < g bes d > b\rest | b4\rest < f a d > b\rest |
    b4\rest < e, a c > b'\rest | b4\rest < g b e > b\rest |
    b4\rest < a c f > b\rest | b4\rest < g b e > b\rest |
    b4\rest < a c f > b\rest | b4\rest < a c e > b\rest |
    b4\rest < a c e > b\rest | b4\rest < a c f > b\rest |
    b4\rest < b e g > b\rest | b4\rest < a c f > b\rest |
    b4\rest < a c e > b\rest | b4\rest < a c f > b\rest |
    b4\rest < a c f > b\rest | b4\rest < b e g > b\rest |
    \repeat unfold 3 { b4\rest < c e a > b\rest b\rest < b e g > b\rest }
    \stemDown
    b4\rest b\rest < a c f > | b4\rest b\rest < b e g > |
    b4\rest < c e a > b\rest | b4\rest < b e g > b\rest |
    \stemUp
    c2.^~ | c |
}

voicethree = \relative c {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \stemDown

    a4_. a\rest a\rest | d,_. a'\rest a\rest | a_. a\rest a\rest | d,_. a'\rest a\rest | 
    a_. a\rest a\rest | c_. a\rest a\rest | g_. a\rest a\rest | d,_. a'\rest a\rest |
    a_. a\rest a\rest | e_. a\rest a\rest | g_. f\rest f\rest | d_. f\rest f\rest |
    g_. f\rest f\rest | d_. a'\rest a\rest | g_. a\rest a\rest | g_. a\rest a\rest |
    g_. f\rest f\rest | d_. a'\rest a\rest | g_. a\rest a\rest | g_. a\rest a\rest |
    c_. a\rest a\rest | e'_. a,\rest a\rest | c_. a\rest a\rest | e'_. a, \rest a\rest |
    a_. a\rest a\rest | d,_. a'\rest a\rest | a_. a\rest a\rest | d,_. a'\rest a\rest | 
    a_. a\rest a\rest | d,_. a'\rest a\rest | a_. a\rest a\rest | c_. a\rest a\rest |
    g_. a\rest a\rest | d,_. a'\rest a\rest | a_. g\rest g\rest |
    e_. a\rest a\rest | e_. a\rest a\rest | e_. a\rest a\rest |
    d,_. a'\rest a\rest | d,_. a'\rest a\rest | d,_. a'\rest a\rest | d,_. a'\rest a\rest |
    g_. a\rest a\rest | g_. a\rest a\rest | g_. g\rest g\rest |
    d'_. a\rest a\rest | g_. a\rest a\rest | g_. a\rest a\rest |
    c_. a\rest a\rest | e'_. a,\rest a\rest | c_. a\rest a\rest | e'_. a,\rest a\rest |
    c_. a\rest a\rest | e'_. a,\rest a\rest |
    \override MultiMeasureRest #'staff-position = #-4.0
    \repeat unfold 4 { s2. } |
    < a e' >2._~ | < a e' > |

    \bar "|."

}

voicefour = \relative c {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
    \stemNeutral

   s2.^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #-4.2 \bold \roman \fontsize #1.0 "Lent et grave"
	}
    } |

}

guitarthree = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


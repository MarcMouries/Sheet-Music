\version "2.18.2"

voiceone = \relative c' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral
}

voicetwo = \relative c' {
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \stemUp

    \repeat unfold 8 { b4\rest < b d fis >2 b4\rest < a cis fis >2 } |
    b4\rest < a cis fis >2 | b4\rest < b d fis >2 | b4\rest < g b e >2 |
    b4\rest < g b d >2 | b4\rest < f a d >2 | 
    b4\rest < a c e >2 | b4\rest < g b e >2 | b4\rest < d, g b e >2 |
    b'4\rest < c, e a d >2 | b'4\rest < c, fis a d >2 | b'4\rest < a c f >2 |
    b4\rest < a c e >2 | b4\rest < d, g b e >2 | b'4\rest < c, e a d >2 |
    b'4\rest < c, fis a d >2 | b'4\rest < b e g >2 | b4\rest < a cis fis >2 |
    b4\rest < b d fis >2 | b4\rest < a cis e >2 | b4\rest < a cis fis >2 |
    b4\rest b, e | g2. | d2. |

    \bar "||"

    \repeat unfold 6 { b'4\rest < b d fis >2 b4\rest < a cis fis >2 } |
    b4\rest < b d fis >2 | b4\rest < a cis fis >2 | b4\rest < b d fis >2 |
    b4\rest < a cis fis >2 | b4\rest < a cis fis >2 | 
    b4\rest < b d fis >2 | b4\rest < g b e >2 | b4\rest < b d g >2 |
    b4\rest < f a d >2 | b4\rest < a c e >2 | b4\rest < g b e >2 |
    b4\rest < d, g b e >2 | b'4\rest < c, e a d >2 | b'4\rest < c, fis a d >2 |
    b'4\rest < a c f >2 | b4\rest < a c e >2 | b4\rest < d, g b e >2 |
    b'4\rest < c, e a d >2 | b'4\rest < c, fis a d >2 | b'4\rest < b e g >2 | 
    b4\rest < a d f a >2 | b4\rest < a c f a >2 | b4\rest < a c e a >2 |
    b4\rest < a c f a > 2 | b4\rest b, e | g2. | d2. |
}

voicethree = \relative c {
    \stemNeutral \slurNeutral \tieNeutral

    \stemDown

    \repeat unfold 4 { g4_. a\rest a\rest d,_. a'\rest a\rest } |
    g4_. a\rest a\rest | d,4_. a'\rest a\rest |
    g4 a\rest a\rest | d,4_. a'\rest a\rest |
    \repeat unfold 2 { g4_. a\rest a\rest d,_. a'\rest a\rest } |
    fis4_. a\rest a\rest | b_. a\rest a\rest |
    e_. a\rest a\rest | e_. a\rest a\rest | d,_. a'\rest a\rest |
    a_. a\rest a\rest |
    d,_. a'\rest a\rest |
    d,4_. f\rest f\rest |
    d4_. d\rest d\rest |
    d4_. d\rest d\rest |
    d4_. f\rest f\rest |
    d4_. f\rest f\rest |
    d4_. f\rest f\rest |
    d4_.d\rest d\rest |
    d4_.d\rest d\rest |
    e4_. a\rest a\rest fis_. a\rest a\rest | b_. a\rest a\rest |
    e_. a\rest a\rest | e_. a\rest a\rest |
    e_. d\rest d\rest | a'2._~ | a2. | 

    g4_. a\rest a\rest d,_. a'\rest a\rest |
    g4_. a\rest a\rest d,_. a'\rest a\rest |
    g4_. a\rest a\rest d,_. a'\rest a\rest |
    g4_. a\rest a\rest d,_. a'\rest a\rest |
    \stemDown
    g4_. a\rest a\rest d,_. a'\rest a\rest 
    g4_. a\rest a\rest d,_. a'\rest a\rest 
    g4_. a\rest a\rest d,_. a'\rest a\rest 
    g4_. a\rest a\rest d,_. a'\rest a\rest 
    fis4_. a\rest a\rest | b_. a\rest a\rest |
    e_. a\rest a\rest | e_. a\rest a\rest | d,_. a'\rest a\rest |
    a_. a\rest a\rest | 

    d,4_. a'\rest a\rest |
    d,4_. f\rest f\rest |
    d4_. d\rest d\rest |
    d4_. d\rest d\rest |
    d4_. a'\rest a\rest |
    d,4_. a'\rest a\rest |
    d,4_. f\rest f\rest |
    d4_. d\rest d\rest |
    d4_. d\rest d\rest |

    e4_. a\rest a\rest | e_. a\rest a\rest | e_. a\rest a\rest | e_. a\rest a\rest |
    e_. a\rest a\rest | e_. d\rest d\rest |
    a'2._~  | a |

   \bar "|."

}

voicefour = \relative c {
    \stemNeutral \slurNeutral \tieNeutral

    s4^\markup {
        \translate #`(0 . 3 ) {
            \hspace #-5.0 \bold \roman \fontsize #1.0 "Lent et douloureux"
        }
    }

}

guitarfour = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


\version "2.18.2"

voiceone = \relative c'' {
    \set harmonicDots = ##t
    \mergeDifferentlyHeadedOn 
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0

   \clef "G"

    R1*3/4^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #-3.5 \bold \roman \fontsize #1.2 "Lent et triste"
	}
    } |

  R1*3/4 | R1*3/4 | R1*3/4 |

  \SMna g'2.( | a4 g f | e  f  g | d2.) |
  \SDnl g2.( | a4 g f | e f  g | f  c2) |
  R2. | R2. |
  \SMng c2.( | f4 g a |
  g2. | c,2. | f2. ~ | f4 ees d |
  f2. ~ | f4 g bes | a g  f | g2. |
  f2.) | R2. | R2. | \SMnd c2.( |
  aes'4 g  f | g2. | f2. ~ |
  f4 ees d |
  f2. | \TDne d2. ~ | d4 ees  aes |
  bes2. | f2.) | R2. | R2. |
  g2.( |
  f4 g a | e  f g | d2.) | \SDnl g2.( |
  f4  g a | e f g |
  f  c2) | R2. |
  R2. | \SMni c2.( | f4 g a | g2. | c,2. | f2. | g2. | \TUpe d2. ~ |
  \TUpe d2. ~ | \TUpe d2.~ | d2  f4 | bes2. | a4  f2) |
  R2. | R2. | R2. | R2.
  \bar "|."
}

voicetwo = \relative c' {
    \stemNeutral \slurNeutral \tieNeutral
}

voicethree = \relative c' {
}

voicefour = \relative c {
}

guitarone = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


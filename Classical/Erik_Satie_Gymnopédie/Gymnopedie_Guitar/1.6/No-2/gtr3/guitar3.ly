\version "2.18.2"

voiceone = \relative c'' {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral

    \override MultiMeasureRest #'staff-position = #2.0

}

voicetwo = \relative c'' {
    \mergeDifferentlyHeadedOn
    \set fingeringOrientations = #'(left)
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0

  \stemUp

}

voicethree = \relative c {
    \mergeDifferentlyHeadedOn
    \set harmonicDots = ##t
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0
}

voicefour = \relative c {
  \mergeDifferentlyHeadedOn
  \set harmonicDots = ##t

  \stemNeutral

  g2.^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #-4.8 \bold \roman \fontsize #1.0 "Lent et triste"
	}
    } |

  d2. | g2. | d2. |
  g2. | d2. | g2. | d2. |

  g2. | d2. | g2. | d2. |
  g2. | d2. |

  c'2. | c2. | c2. | f,2. | f2. |
  f2. | f2. | f2. | f2. |
  bes2. | d,2. | g2. | d2. |

  c'2. | c2. | c2. | f,2. |
  f2. | f2. | f2. | f2. |
  bes2. | d,2. |

  g2. | d2. | g2. | d2. |
  g2. | d2. |

  g2. | d2. | g2. |
  d2. | g2. | d2. |

  c'2. | c2. | c2. | f,2. |
  f2. | f2. | f2. | f2. |
  f2. | f2. | bes2. | d,2. |

  g2. | d2. | g2. | c2. |

  \bar "|."

}

guitarthree = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


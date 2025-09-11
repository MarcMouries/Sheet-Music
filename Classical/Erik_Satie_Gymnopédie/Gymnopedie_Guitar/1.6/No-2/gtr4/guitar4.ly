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

  b,4\rest <g'  e b>2 | b,4\rest <a' f c a>2 | b,4\rest <g' e b>2 | b,4\rest <a' f c a>2 |
  b,4\rest <g b e>2 | b4\rest < f a c>2 | b4\rest <g b e>2 | b4\rest < f a c>2 |

  b4\rest <g b e>2 | b4\rest <a c f >2 | b4\rest <g b e>2 | b4\rest < f a c>2 |
  b4\rest < b e g>2 | b4\rest <a c f a>2 |

  b4\rest < a c e>2 | b4\rest < a c f>2 | b4\rest <g bes ees>2 | b4\rest <ees, g bes >2 |
  b'4\rest <f a d>2 | b4\rest <g bes ees >2 | b4\rest <f a d>2 | b4\rest <g bes d >2 |
  b4\rest <a c ees >2 | b4\rest <g  bes d >2 | b4\rest <a c f >2 | b4\rest <g bes d >2 |
  b4\rest <a c f a>2 |

  b4\rest <c ees g >2 | b4\rest < aes c f>2 | b4\rest < g bes d >2 | b4\rest < f a d >2 |
  b4\rest < g bes ees >2 | b4\rest <f a d>2 | b4\rest < g bes d >2 | b4\rest < aes c ees >2 |
  b4\rest < bes d g>2 | b4\rest <a c f >2 |

  b4\rest <g b e >2 | b4\rest < f a c>2 | b4\rest < g b e>2 | b4\rest < f a c>2 |
  b4\rest <g b e >2 | b4\rest <f a c >2 |

  b4\rest < g b e>2 | b4\rest <  f a c>2 | b4\rest <g b e>2 | b4\rest < f a c>2 |
  b4\rest <g b e>2 | b4\rest < f a c>2 |

  b4\rest < a c e>2 | b4\rest <a c f >2 | b4\rest <g bes ees>2 | b4\rest < ees, g bes >2 |
  b'4\rest < f a d>2 | b4\rest <g bes ees >2 | b4\rest < f a d>2 | b4\rest < g bes d > 2 |
  b4\rest < ees, g bes >2 | b'4\rest < f a d>2 | b4\rest < g bes d>2 | b4\rest <a  c f >2 |

  b4\rest < bes d g >2 | b4\rest <a c f a >2 | b4\rest < bes d g>2 | b4\rest < c e g>2 |
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

  \stemDown

  g4_.^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #-5.0 \bold \roman \fontsize #1.0 "Lent et triste"
	}
    } 

  a\rest a\rest | d,4_. a'\rest a\rest | g4_. a\rest a\rest | d,4_. a'\rest a\rest |
  g4_. a\rest a\rest | d,4_. a'\rest a\rest | g4_. a\rest a\rest | d,4_. a'\rest a\rest |

  g4_. a\rest a\rest | d,4_. a'\rest a\rest | g4_. a\rest a\rest | d,4_. a'\rest a\rest |
  g4_. a\rest a\rest | d,4_. a'\rest a\rest |

  c4_. a\rest a\rest | c4_. a\rest a\rest | c4_. a\rest a\rest | f4_. g\rest g\rest | f4_. a\rest a\rest |
  f4_. a\rest a\rest | f4_. a\rest a\rest | f4_. a\rest a\rest | f4_. a\rest a\rest |
  bes4_. a\rest a\rest | d,4_. a'\rest a\rest | g4_. a\rest a\rest | d,4_. a'\rest a\rest |

  c4_. a\rest a\rest | c4_. a\rest a\rest | c4_. a\rest a\rest | f4_. a\rest a\rest |
  f4_. a\rest a\rest | f4_. a\rest a\rest | f4_. a\rest a\rest | f4_. a\rest a\rest |
  bes4_. a\rest a\rest | d,4_. a'\rest a\rest |

  g4_. a\rest a\rest | d,4_. a'\rest a\rest | g4_. a\rest a\rest | d,4_. a'\rest a\rest |
  g4_. a\rest a\rest | d,4_. a'\rest a\rest |

  g4_. a\rest a\rest | d,4_. a'\rest a\rest | g4_. a\rest a\rest |
  d,4_. a'\rest a\rest | g4_. a\rest a\rest | d,4_. a'\rest a\rest |

  c4_. a\rest a\rest | c4_. a\rest a\rest | c4_. a\rest a\rest | f4_. g\rest g\rest |
  f4_. a\rest a\rest | f4_. a\rest a\rest | f4_. a\rest a\rest | f4_. a\rest a\rest |
  f4_. g\rest g\rest | f4_. a\rest a\rest | bes4_. a\rest a\rest | d,4_. a'\rest a\rest |

  g4_. a\rest a\rest | d,4_. a'\rest a\rest | g4_. a\rest a\rest | c4_. a\rest a\rest |

  \bar "|."

}

guitarfour = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


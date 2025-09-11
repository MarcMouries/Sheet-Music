\version "2.18.2"

voiceone = \relative c'' {
    \set harmonicDots = ##t
    \mergeDifferentlyHeadedOn 
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0

   \clef "G"

   R1*3/4 R1*3/4 | R1*3/4 | R1*3/4 |

   \slurDown

  \SDnm g2.( | a4 g f | e  f  g | d2.) |
  \SMnb g2.( | a4 g f | e f  g | f  c2) |
  R2. | R2. |
  \SMnc c'2.( | f,4  g a |
  g2. | c,2. | \TDnd f2. ~ | f4 ees d |
  \TDnd f2. ~ | f4 g bes | a g  f | g2. |
  f2.) | R2. | R2. | \SMne c'2.( |
  aes4 g  f | g2. | \TDnd f2. ~ |
  f4 ees d |
  f2. | d2. ~ | d4 ees  aes |
  bes2. | f2.) | R2. | R2. |
  \SMnf g2.( |
  f4 g a | e  f g | d2.) | \SMnb g2.( |
  f4  g a | e f g |
  f  c2) | R2. |
  R2. | \SMnh c'2.( | f,4 g a | g2. | c,2. | f2. | g2. | d2. ~ |
  d2. ~ | d2.~ | d2  f4 | bes2. | a4  f2) |
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

guitartwo = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


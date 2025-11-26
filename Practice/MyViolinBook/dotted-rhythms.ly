\version "2.19.15"

\header {
  title = ""
  composer = "Marc Mouries"
  style = "practice exercise"
}


\markup \vspace #1
\markup \bold "Dotted Rhythms"
\markup \bold "ADD LIRYCS like in here http://www.marthabeth.com/using_rhythms.html"
\markup \bold "ADD http://jeffreychappell.com/practicing.phpl"


\markup \vspace #1
\markup \bold "Group of 2 notes: long, short"
rhythms_TWO = {
   e'4. ^"long-short" e'8 e'4. e'8
   e'8 ^"short-long" e'4. e'8 e'4.
}
\score { \new Staff { \rhythms_TWO }}


\markup \bold "Group of 3 notes"
rhythms_THREE = {
   e'8. ^"L-S-S" e'32 e'32
   e'32 ^"S-L-S" e'8. e'32
   e'32 ^"S-S-L" e'32 e'8.
}
\score { \new Staff {
  \time 2/4
  \override Staff.StaffSymbol #'stencil = ##f
  \override Staff.TimeSignature #'stencil = ##f

\rhythms_THREE }}

\markup \bold "Group of 4 notes"
rhythms_FOUR = {
   e'4. ^"L-S-S-S" e'8 e' e'
   e'8 ^"S-L-S-S" e'4. e'8 e'8
   e'8 ^"S-S-L-S" e'8 e'4. e'8
   e'8 ^"S-S-S-L" e'8 e'8 e'4.
   e'8 [^"S-S-S-S" e'8 e'8 e'8]
}
\score { \new Staff {
  \time 3/4
  \override Staff.StaffSymbol #'stencil = ##f
  \override Staff.TimeSignature #'stencil = ##f
   \rhythms_FOUR }
}

\markup \bold "Group of 6 notes"
rhythms_SIX = {
   e'4. ^"S-S-S-S" e'8  e'     e'     e'     e'
   e'8  ^"S-S-S-S" e'4. e'8   e'     e'    e'
   e'8  ^"S-S-S-S" e'     e'4.  e'8  e'    e'
   e'8  ^"S-S-S-S" e'     e'8   e'4. e'8  e'
   e'8  ^"S-S-S-S" e'     e'8   e'    e'4.  e'8
   e'8  ^"S-S-S-S" e'     e'8   e'    e'4.  e'8
   e'8  ^"S-S-S-S" e'     e'     e'     e'    e'

}
\score { \new Staff {
  \time 4/4
  \override Staff.StaffSymbol #'stencil = ##f
  \override Staff.TimeSignature #'stencil = ##f
\rhythms_SIX }}
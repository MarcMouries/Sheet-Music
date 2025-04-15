\version "2.19.53"
\language "italiano"

\header {
  title = "Practice Gypsy - Rythmes Gitans"
}








lick_Gm_chordNames = \chordmode {  sol:m}

lick_Gm_melody = \relative do' {
       sol8 la( sib) re( sol8) la 
      sib re( sol) 
     % la( sib) la  sol
      re sib la
 sol re sib la
}

\score {
  <<
    \new ChordNames \lick_Gm_chordNames
    \new Staff { \lick_Gm_melody }
  >>
  \layout { }
  %\midi { }
}


lick_Gm_chordNames = \chordmode {  re:m7}

lick_Gm_melody = \relative do' {
  r8 sol8\upbow sib do re fa\upbow(
   sol8) sib( do8)  dod8
       re fa sol fa re dod! do  sib 
             sol fa re dod! do  sib

}


\score {
  <<
    \new ChordNames \lick_Gm_chordNames
    \new Staff { \lick_Gm_melody }
  >>
  \layout { }
  %\midi { }
}
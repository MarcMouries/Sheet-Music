\version "2.16"
\include "italiano.ly"
\header {
	title = "Greensleeves"
	composer = "Traditional English"
  country = "England"
	style = "folk"
}

\include "../../common/common-header.ily"
words = \lyricmode {
   A- las, my love,_  you do me wrong__
   To cast me off __  dis- cour- teous- ly,
   And I have lov- __ ed you so long __
   De- light -- ing in __  your com- pa- ny.
   Green- sleeves__  was all my joy __
   Green__  sleeves __  was my de- light,
   Green- sleeves was my heart of gold, __
   and who but my la -- dy Green -- sleeves
}
melody =  {
 \time 6/8
 \key e \minor
 \partial 8
    mi'8
|   sol'4    la'8    si'8. ( dod''16 )   si'8
|   la'4    fad'8    re'8. ( mi'16   )  fad'8
|   sol'4    mi'8    mi'8  ( re'8    )   mi'8
|   fad'4    re'8    si4     mi'8
|   sol'4    la'8    si'8. ( dod''16 )   si'8
|   la'4    fad'8    re'8. ( mi'16   )  fad'8
|   sol'8. (fad'16)  mi'8    red'8     (dod'8 )   red'8
|   mi'4    mi'8    mi'4 r8
|   re''4.    re''8. (   dod''16  )   si'8
|   la'4    fad'8    re'8. (   mi'16    fad'8  )
|   sol'4  (   mi'8  )   mi'8. (   re'16  )   mi'8
|   fad'4    re'8    si4.
|   re''4.  re''8.    dod''16    si'8
|   la'4    fad'8    re'8. (  mi'16  )   fad'8
|   sol'8.  fad'16   mi'8    red'8. (   dod'16  )   red'8
|   mi'4.    mi'4    \bar "|."
}

chordNames = \chordmode {
 % \global
  % Ajouter ici des chiffrages.
 s8
  mi2.:m  re  mi:m    si:7
  mi2.:m  re  mi4.:m  si4.:7 mi2.:m
 sol2.    re  mi:m    si:7
 sol2.    re  mi4.:m  si4.:7 mi2.:m
 }

\score {
  <<
    \new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
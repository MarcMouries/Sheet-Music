\version "2.24.4"
\language "english"

% ---- Compact count stacks (small, centered) ----
countOneTwoThree = \markup \center-column { \fontsize #-2 "1" \fontsize #-2 "2" \fontsize #-2 "3" }
countFour        = \markup \center-column { \fontsize #-2 "4" }
countFiveSix     = \markup \center-column { \fontsize #-2 "5" \fontsize #-2 "6" }

% Optional: make stacked text sit a bit closer to the staff
countTextTweak = {
  \override TextScript.font-name = #"Arial"  
  \override TextScript.font-size = #-2
  \override TextScript.baseline-skip = #1.4
  \override TextScript.staff-padding = #2
}

resetCountText = {
  \revert TextScript.font-name
  \revert TextScript.font-size
  \revert TextScript.baseline-skip
  \revert TextScript.staff-padding
}

% ---- Your slow practice cell with stacked counts under each note ----
exercise_slow_practice_a = {
  \time 6/8
  \tempo 8 = 120
  \countTextTweak
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix |
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix
  \resetCountText
}

\score {
  \new Staff { \exercise_slow_practice_a }
  \layout { }
}




countOneTwoThree = \markup \fontsize #-2 \center-column { "1" "2" "3" }
countFour        = \markup \fontsize #-2 \center-column { "4" }
countFiveSix     = \markup \fontsize #-2 \center-column { "5" "6" }

countTextTweak = {
  \override TextScript.font-name = #"Arial"  
  \override TextScript.font-size = #-2
  \override TextScript.baseline-skip = #2.0
  \override TextScript.staff-padding = #2
}

exercise_slow_practice_a = {
  \time 6/8
  \tempo 8 = 120
  \countTextTweak
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix |
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix
  d'4._\accent _\countOneTwoThree  d'8 _\countFour  d'4 _\countFiveSix
}

\score { \new Staff { \exercise_slow_practice_a } \layout{} }


\markup "Pentatonic Scale"
exercise_slow_practice_a = {
  \time 6/8
  \tempo 8 = 120
  \countTextTweak
  d' 4._\accent _\countOneTwoThree  f' 8 _\countFour  g' 4 _\countFiveSix
  a' 4._\accent _\countOneTwoThree  c''8 _\countFour  d''4 _\countFiveSix 
  c''4._\accent _\countOneTwoThree  a' 8 _\countFour  g' 4 _\countFiveSix
  f' 4._\accent _\countOneTwoThree  d' 8 _\countFour  c'4 _\countFiveSix
}

\score { \new Staff { \exercise_slow_practice_a } \layout{} }



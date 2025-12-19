\version "2.24.4"
\language "english"

\header {
  title = "Chromatic Scale"
  composer = "Marc Mouries"
  genre = "Exercise"
}

\include "../../common/common-header.ily"



melody = \relative c' {
  \time 4/4
  \repeat volta 2 {
    b'8 c  cs d
    ds  e  f fs
    g gs a as
    b bf a af g fs f e ef d df
    c
  }
  \break

  g,8 gs a as b c8_3-3  cs_4-4 d_0-0 ds_1-1
  e_2-1 f fs g gs a as b
  c_3-3  cs d ds
  e f fs g gs a as b
  bf a af g fs f e ef d df
  c
  b bf a af g fs f e ef d df


}


\score { \new Staff { \melody } }

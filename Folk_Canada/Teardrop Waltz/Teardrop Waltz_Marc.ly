\version "2.24.0"
\language "english"

\include "../../common/includes.ly"
%\include "stylesheet_fiddle.ly"

#(set-default-paper-size "letter")
#(set-global-staff-size 22)
\header {
  title    = "Teardrop Waltz"
  composer = "Reg Bouvette"
  country = "Canada"
    genre = "Folk"
}

\include "../../common/common-header.ily"


melody =  \relative c'' {
  \time 3/4
  \key d \major
%  \set Timing.beamExceptions = #'()

\repeat volta 2 {
  \partial  4 b8    cs8
  | d8  e  d  b\upbow  (  a8  g)
  | fs4. \slashedGrace {fs8 } e( \slashedGrace{fs16[ e]} d8  e8)  fs4   e4( \upbow   \slashedGrace{fs16[ e]}   d8[  a])
  | \grace{a8}  b2  d8 ( e8 )
  | \grace{e8}  fs4.  e8 (
  d8 e8 )
  \grace{e8}  fs4   e4 ( \slashedGrace{fs16[ e]}   d4  )
   b'2  b8 ( a8 )
  \grace{b8}   d2    d8( b)
   a8   b   a   fs(  e  fs)
   d4.    e8 (   fs8    e8  )
   d4    e4    fs8 (   d8  )
   b2    d8 (   e8  )
   fs8  a8  ~ a4    fs4
   e4.    d8 (   fs8    e8  )
   d2    d8 (  e8  )  d2    }
\repeat volta 2 {
  fs8 (   a8  )
  b2    b8 (  a8)
  \grace{b8}   d2    d8 (   b8  )
  a4    fs4. ( g8  )
   fs4  e4 ( \slashedGrace{fs16[ e]}   d4  )
   b'2    b8 (   a8  )
   \grace{ b8  }   d2    e4
   fs2    fs8 (   a8  )
   fs8    e8    d8    b8 (   a8    d8 )
   b2    b8 (   a8 )
   \grace{ b8 }   d2    d8(  b8 )
    a8   b8    a8    fs8 (   e8  fs8 )
    d2   d8 (  e8 )
   fs8    a8    d4    b8 ( d8 )
   a8    fs8    e4.    fs8
   d2    d8 ( e8)
   d2
  }
}



chordNames = \chordmode {
  s4 d2.    b2.:m   d2.    g2.
     d2.    d2.     b2.:m  g2.
     d2.    d2.     d2.    g2.
     d2.    a2.:7   d2.    d2.
     b2.:m  g2.     d2.    d2.
     b2.:m  g2.     d2.    d2.
     b2.:m  g2.     d2.    g2.
     d2.    a2.:7   d2.    d2
}

\include "../../common/score.ly"

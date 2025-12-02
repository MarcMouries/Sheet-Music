\version "2.19.2"
\language "english"

#(set-global-staff-size 20)

\header {
  title = "Happy Birthday"
  composer = "Patty Hill and Mildred J. Hill (1893)"
  country = "USA"
  style = "traditional"
  video = ""
}

\include "../../common/common-header.ily"
\include "../../common/bars-per-line-engraver.ly"


chordNames = \chordmode {
  f2.    bf2.      f 2   c4:7   f2.  
  f2.    c 2.:7    c 2.:7       f2.  
  f2.    bf2.      f 2   c4:7   f2.  
}

violinOne =    \relative d{
  \key f \major
  \time 3/4
  r2. r2. r2.

  r4 r <f-0 c'-0>8 <f c'>8
  <f d'>4 <f c'> <a-2 f'-3>^"close"
  <g-1 e'-2>2    <g-1 c-0>8  <g c>8
  <g-1 d'-1>4 <g c>4 <bf-3 g'-4>^"open"
  <a f'>2^"close" <f c'>8 <f c'>8
  <c'-0 c'-3>4  <c a'-1>4 <a-2 f'-3>^"close"
  <g-1 e'-2>^"open"  <bf-3 d-1>\fermata    
  <d-1 bf'-2>8 <d bf'>8
  <c-0 a'-1>4 <a-2 f'-3>^"close"   <bf-3 g'-4>^"open"  
  <a f'>2.^"close" 
}

violinTwo =    \relative d'{
  \key f \major
  \time 3/4
  r2. r2. r2.
  r4 r
  <a-3 c-1>8 <a-3 c-1>8
  <bf-4 d-2>2 <a-3 c-1>2 <a-2 f'-3>^"???"
  <g-1 e'-2>1^"open"    <g-1 c-0>4.  <g c>8
  <g-1 d'-1>2 <g c>2 <bf-3 g'-4>^"open"
  <a f'>1^"close" <f c'>4 <f c'>4 \break
  <c'-0 c'-3>2  <c a'-1> <a-2 f'-3>^"close"
  <g-1 e'-2>^"open"  <bf-3 d-1>^"open" \fermata    <bf'-4 d-2>4 <bf-4 d-2>4
  <a-3 c-1>2 <f-3 a-1>^"open"   <g-4 bf-2>^"open"  <f-3 a-1>1^"O" r2
}

music = {
  <<
    \new Voice = "one" {
      \set Staff.midiInstrument = #"violin"
      \violinOne
    }
  %  \new Voice = "two" {
  %    \set Staff.midiInstrument = #"violin"
  %    \violinTwo
 %   }

  >>
}


\score {
  <<
    \new ChordNames {\chordNames}
    \music
  >>
  \layout {
    \context {
      \Score
      \consists #(bars-per-line-engraver '(4))
    }
  }
  \midi { }
}
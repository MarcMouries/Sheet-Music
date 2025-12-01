\version "2.19.2"
\language "english"
\paper {
    indent = 0 
}
#(set-global-staff-size 24)

\header {
  title = "Happy Birthday"
  composer = "Patty Hill and Mildred J. Hill (1893)"
  country = "USA"
  style = "traditional"
    video = ""
}

\include "../../common/common-header.ily"

violinOne =    \relative d'{
  \key d \major
  \time 3/4
    \partial 4
    <d-0 a'-0>8. <d a'>16 
    <d b'>4 <d a'>4 <fs-2 d'-3>^"close" 
    <e-1 cs'-2>2^"open"    <e-1 a-0>8.  <e a>16 
    <e-1 b'-1>4 <e a>4 <g-3 e'-4>^"open" 
    <fs d'>2^"close" <d a'>8 <d a'>8 \break 
    <a'-0 a'-3>4  <a fs'-1> <fs-2 d'-3>^"close" 
    <e-1 cs'-2>^"open"  <g-3 b-1>^"open" \fermata    <b-1 g'-2>8<b g'>8 
    <a-0 fs'-1>4 <fs-2 d'-3>^"close"   <g-3 e'-4>^"open"  <fs d'>2^"close" r4
 }
 
violinTwo =    \relative d'{
  \key d \major
  \time 3/4
    \partial 4
    <fs-3 a-1>8. <fs-3 a-1>16 
    <g-4 b-2>4 <fs-3 a-1>4 <fs-2 d'-3>^"???" 
    <e-1 cs'-2>2^"open"    <e-1 a-0>8.  <e a>16 
    <e-1 b'-1>4 <e a>4 <g-3 e'-4>^"open" 
    <fs d'>2^"close" <d a'>8 <d a'>8 \break 
    <a'-0 a'-3>4  <a fs'-1> <fs-2 d'-3>^"close" 
    <e-1 cs'-2>^"open"  <g-3 b-1>^"open" \fermata    <g'-4 b-2>8 <g-4 b-2>8 
    <fs-3 a-1>4 <d-3 fs-1>^"open"   <e-4 g-2>^"open"  <d-3 fs-1>2^"O" r4
 } 
 
music = {
    <<
   %  \new ChordNames  {
   % \set chordChanges = ##f
   % \harmonies
   %    }
   \new Voice = "one" { 
      \set Staff.midiInstrument = #"violin"
   \violinOne 
    }
        \new Voice = "two" { 
      \set Staff.midiInstrument = #"violin"
    \violinTwo
    }

    >>
}

\score {
    \music
    \layout { }
    \midi {}
}

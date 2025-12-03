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
  d2.    g2.      d 2   a4:7   d2.
  d2.    a 2.:7    a 2.:7       d2.
  d2.    g2.      d 2   a4:7   d2.
}

violinOne =    \relative d'{
  \key d \major
  \time 3/4
  r2. r2. r2.

  r4 r <d-0 a'-0>8 <d a'>8
  <d b'>4 <d a'> <fs-2 d'-3>
  <e-1 cs'-2>2    <e-1 a-0>8  <e a>8
  <e-1 b'-1>4 <e a>4 <g-3 e'-4>
  <fs d'>2 <d a'>8 <d a'>8
  <a'-0 a'-3>4  <a fs'-1>4 <fs-2 d'-3>
  <e-1 cs'-2>  <g-3 b-1>\fermata
  <b-1 g'-2>8 <b g'>8
  <a-0 fs'-1>4 <fs-2 d'-3>   <g-3 e'-4>
  <fs d'>2.\fermata
}

violinTwo =    \relative d'{
  \key d \major
  \time 3/4
  r2. r2. r2.
  r4 r
  <fs-3 a-1>8 <fs-3 a-1>8
  <g-4 b-2>2 <fs-3 a-1>2 <fs-2 d'-3>^"???"
  <e-1 cs'-2>1^"open"    <e-1 a-0>4.  <e a>8
  <e-1 b'-1>2 <e a>2 <g-3 e'-4>^"open"
  <fs d'>1^"close" <d a'>4 <d a'>4 \break
  <a'-0 a'-3>2  <a fs'-1> <fs-2 d'-3>^"close"
  <e-1 cs'-2>^"open"  <g-3 b-1>^"open" \fermata    <g'-4 b-2>4 <g-4 b-2>4
  <fs-3 a-1>2 <d-3 fs-1>^"open"   <e-4 g-2>^"open"  <d-3 fs-1>1^"O" r2
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

\markup \bold "Playing Double stops"
violin_double_stops =    \relative d'{
  \key d \major
  \time 4/4
  <d_0 a'-0>2        %  D
  <d_0 b'-1>2        %  G
  <e-1 a-0> 2         %  A
  <e-1 b'-1>2        %  E
  <fs-2 d'-3>^"close" %  D
  <fs-2 b-1>2        %  B
    <e-1 b'-1>2        %  E

  <e-1 cs'-2>2
  <g-3 e'-4>^"open"  %  G
  <fs d'>2^"close"   %  D
  <e-1 b'-1>2        %  E
   <g-2 b-1>2        %  G
   
  <g-3 e'-4>^"open"  %  G
  <fs d'>2^"close"   %  D
  <e-1 b'-1>2        %  E
   <g-2 b-1>2        %  G


 <e a>2
  <a-0 fs'-2>2
  <a-0 a'-3>2
  <a fs'-1>2
  <fs-2 d'-3>^"close"
  <e-1 cs'-2>^"open"
  <g-3 b-1>
  <b-1 g'-2>2
  <b g'>2
  <a-0 fs'-1>2
  <fs-2 d'-3>^"close"
  <g-3 e'-4>^"open"
  <fs d'>2^"close"
}
\score {
  <<
    \new ChordNames {
      \chordmode {
        d2 g2 a2 e2
        d2 b2 e2 a2 
        g2 d2 e2 g2 g2 d2 e2 g2
      }
    }
    \violin_double_stops
  >>
  \layout {
    \context {
      \Score
      \consists #(bars-per-line-engraver '(4))
    }
  }
  \midi { }
}
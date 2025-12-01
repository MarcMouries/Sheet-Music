\version "2.19.53"
\language "english"
\include "../../common/violin-functions.ly"

\header {
  title = "Io Ti Penso Amore"
  subtitle = "From Violin Concerto No. 4"
  composer = "Niccolò Paganini (1782-1840)"
  country = "Italy"
  style = "concerto"
    video = ""
}

\include "../../common/common-header.ily"

global = {
  \time 6/8
  \key fs \minor
}

chordNames = \chordmode {
  \global
  R2.*2
  
}

melody = \relative c''' {
  \global
  \compressFullBarRests
  R2.*2
   r4. r4 cs8-3\ub 
  % \tieDown
  cs4. (~ cs4   fs,8-1)  e'4.-3 (~e4  d8-3)
  cs4.-2 cs4.~ cs4.  b4.-2 
  a4. (  ~a4 fs8-1) fs4( gs16 fs es4 fs8)
  a2.(  
  gs4.) r4   cs8-3\ub 
  \break 
  cs4. ~ cs4   fs,8-1  g'4.-3\db ~g4  fs8-3
  e4.-2 (  d4.-1) ~ d8 cs( b) b( a gs)
  a8( b bs) cs8( fs, b) 
  gs2.\trill
  ds4. 
}

melodySoprano = \relative c'' {
  \global
  \compressFullBarRests
  R2.*2
   r4. r4 cs8-3\ub 
  % \tieDown
  cs4. ~ cs4   fs,8-1  e'4.-3 ~e4  d8-3
  cs4.-2 cs4.~ 
  \break 
  cs4.  b8-2 b b  
  a4.    fs4-1 fs8 
          \set melismaBusyProperties = #'()
  fs4( gs16 fs es4 fs8)

  a2.(  
  \break
  gs4.) r4   cs8-3\ub 
            \unset melismaBusyProperties

  
  cs4. ~ cs4   fs,8-1  g'4.-3\db ~g4  fs8-3
          \set melismaBusyProperties = #'()
  
  e4.-2 (  d4.-1) ~ d8 cs( b) b( a gs)
  a8( b bs) cs8( fs, b) 
           \unset melismaBusyProperties

  gs2.
  ds4. 
}
words = \lyricmode {
  I -- o ti pen -- so,a -- mo -- re, 
  quan -- do,il ba -- glio -- re del sole
  
  Ris -- plen -- de sul ma -- re.
  I -- o ti pen -- so,a -- mo -- re, 
Quando ogni raggio della luna
Si dipinge sulle fonti.
}


\markup \bold "Original"
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { indent=0}
  \midi { }
}
\markup \bold "Movie"

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melodySoprano }
    \addlyrics { \words }
  >>
  \layout { indent=0}
  \midi { }
}
\version "2.19.32"
\language "english"

\header {
  title = "Devil's Dream"
  piece = "Traditional"
  mutopiatitle = "Devil's Dream"
  mutopiacomposer = "Traditional"
  mutopiainstrument = "Violin, Guitar"
  source = "Transcribed by ear (no copyright)"
  style = "Folk"
  copyright = "Public Domain"
  maintainer = "Taj Morton"
  maintainerEmail = "taj@wildgardenseed.com"
  maintainerWeb = "http://www.wildgardenseed.com/Taj"
  lastupdated = "2005/Mar/04"
  meter = 120
  tagline = "\\raisebox{16mm}{\\parbox{188mm}{\\quad\\small\\noindent \\hspace{\\stretch{1}} \\makebox[188mm][c]{Transcribed and typeset by " + \maintainer + " (" + \maintainerWeb + ") .} \\makebox[188mm][c]{Unrestricted modification and redistribution is permitted and encouraged---copy this music and share it!}}}"
}


melody = \relative c'' {
  \key g \major
  \partial 4 d4
  
  %\bar ".|:" 
  \repeat volta 1 {
    g8 fs g d  g fs g d  g fs g d e d c b
    c e a, e' c e a, e' c e a, e' g fs e d \break
    
    g8 fs g d  g fs g d  g fs g d e d c b
    a b c d e fs g e d b a b g4 d'4
    }
    %\bar ":|."
  \break
% Part 2
  %\bar ".|:"
  \repeat volta 2{
  b8 d g, d' b d g, d' b d g, d' e d c b
  c e a, e' c e a, e' c e a, e' g fs e d \break

  b8 d g, d' b d g, d' b d g, d' e d c b
  a b c d e fs g e d b a b g4 g4}
  \alternative {{g4 d4}{g4 g4} }
  \bar ":|."
}

harmonies = \chordmode {
  r4
  
  g4 g4 g4 g4
  g4 g4 g4 g4
  a4:min a4:min a4:min a4:min
  a4:min a4:min d4:7 d4:7
  g4 g4 g4 g4
  g4 g4 g4 g4
  c4 c4 g4 g4
  d4:7 d4:7 g4 g4
  
  g4 g4 g4 g4
  g4 g4 g4 g4
  a4:min a4:min a4:min a4:min
  a4:min a4:min d4:7 d4:7
  g4 g4 g4 g4
  g4 g4 g4 g4
  c4 c4 g4 g4
  d4:7 d4:7 g4 g4
}

\score {
   <<
      \context ChordNames {
         \set chordChanges = ##t
         \harmonies
      }
   \context Staff = one \melody
   >>

   \layout{ }
   
  \midi {
    \tempo 4 = 120
    }


}

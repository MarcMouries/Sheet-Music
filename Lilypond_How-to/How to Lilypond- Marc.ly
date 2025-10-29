\version "2.24.0"



% ****************************************************************
% This is a visual guide to How to Write Music for Violin with Lilypond"
% ****************************************************************


\paper {
  indent = 0\mm
  %line-width = 200\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  %line-width = #(- line-width (* mm  3.000000) (* mm 1))
  line-width = 180\mm - 2.0 * 10.16\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  line-width = #(- line-width (* mm  3.000000) (* mm 1))
}


%\book {
  
  \paper {
    indent = 0\mm
   tagline = ##f 
  }
  

 \markup \vspace #2  

 \markup {
      \fill-line {
        ""  % Left
          \column {
            \center-align \fontsize #3 \bold      "How to Write Music for Violin with Lilypond"
            \vspace #1 
            \center-align \fontsize #1 \italic    "Marc Mouries"
          }
          "" %% Right
        }
        
      }
      
      
      
\markup \vspace #2  
\markup \bold { "Bowing indications"}  
score_Bowing_downbow = \relative c' { c4(\downbow d) e(\upbow f) }
\markup \fill-line {
  \column { \score { \score_Bowing_downbow }  } 
  \column { "=>" }
  \column { \typewriter "c4(\downbow d) e(\upbow f)" }  
}



\markup \vspace #2  
\markup \bold { "Write triplets"}  
\markup \fill-line {
  \column { 
    \score {
       \relative c' { \tuplet 3/2 { d8 e f }}
       \layout { }
    }     
  } 
  \column { "=>" }     \column { \typewriter "\\tuplet 3/2 { d8 e f }" }  
}







\markup \vspace #2  
\markup \bold { "LAYOUT TIPS"}  

\markup \vspace #1
\markup \bold { "Add vertical space" }
\markup \fill-line {
  \column {
    \column {
      "A"
      \vspace #1
      "B"
    }
  }
    \column { "=>" }
  \column {
    \typewriter "\\markup \"A\""
    \typewriter "\\markup \\vspace #1"
    \typewriter "\\markup \"B\""
  }
}




\markup \vspace #2  
\markup \bold { "How to remove first score indentation?"}  
\markup \fill-line {
  \column { 
    \score {
       %% NONE
       s1
    }     
  } 
  \column { "=>" }
  \column {
    \typewriter "\\layout { indent = 0\in}"
  }
}


\markup \vspace #2  
\markup \bold { "MIDI TIPS"} 
\markup \vspace #2  
\markup \bold { "Set the MIDI instrument to Violin"}  
\markup \fill-line {
  \column { 
    \score {
       %% NONE
       s1
    }     
  } 
  \column { "=>" }     \column { \typewriter "\set Staff.midiInstrument = \"violin\"" }  
}



\markup \vspace #2  
\markup \bold { "Set the tempo of the score in the MIDI"}  
  \markuplist {
   \typewriter "
\score {
  ...music...
   \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 72 4)
       }
     }
}
"}

\markup \vspace #2  

\markup { "Here are examples of markup with music"}

\markup {
  
  \score { \new Staff { c d e f g a b c }
                   \layout { indent=0 } }
  
  \column {
    \line { \sans { Scene I. } }
    \line { \typewriter { "{ c d e f g }" } }
    \line { Enter \roman Valentine and Proteus. }
  }
}


\markup { "Here is an example of a score within markup"}


% ****************************************************************
% ly snippet:
% ****************************************************************
\markup {
  violin: \score { \new Staff { <g d' a' e''>1 }
                   \layout { indent=0 } } ,
  cello: \score { \new Staff { \clef "bass" <c, g, d a> }
                  \layout { indent=0 } }
}


\markup { "Here we add a score"}

soprano = \relative c' { c e g c }
alto = \relative c' { a c e g }
verse = \lyricmode { This is my song }

\score {
  \new Staff <<
    \partCombine \soprano \alto
    \new NullVoice = "aligner" \soprano
    \new Lyrics \lyricsto "aligner" \verse
  >>
  \layout {}
}

\markup \harp-pedal "^-v|--ov^"

\markup {"here"}

\markup {
  violin: \score { \new Staff { a4 \open
     a^\markup { \teeny "II" }
     a2^\markup { \small "sul A" } }
                   \layout { indent=0 } } 
}
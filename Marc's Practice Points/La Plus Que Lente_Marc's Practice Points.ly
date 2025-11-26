\language "english"
\version "2.16.0"
\include "violin-functions.ly"
\header {    composer = "Marc Mouries"
  style = "practice exercise"
  tagline = ""}
Title =  "Debussy's Plus que Lente"
\include "practice-points-header.ly"



measureOneExtract =  \score { \relative c' {
   |  r4 \pp d4-._1\ub(   e4-.\ub)
   |  fs4.--_\shift-2(  a8)   fs4 ~ 
        }
      \layout { indent = 0.0\cm   }
     }
measureOnePractice = 
  \score 
  { 
    \relative c' 
    {
      \set countPercentRepeats = ##t
      \repeat volta 10 
      { 
        \bar "|:"
        a4_1 ^"G string" \glissSize #5 d_\shift-1
        d_1 \glissSize #5 a_\shift-1
      }
      \repeat volta 10 
      {
         e'_2 \glissSize #5 fs_\shift-2
         fs_2 \glissSize #5 e_\shift-2
      }
    }
    \layout { indent = 0.0\cm   }
  }

measureFourExtract =  \score { \relative c' {
   |  fs4-.-2 r4 fs4--\db _\shift-3~}
      \layout { indent = 0.0\cm   }
     }  
measureFourPractice = \score { \relative c' {
      \set countPercentRepeats = ##t
      \repeat volta 10 {
         d_1 e_2 \glissSize #5 fs_\shift-2
          \glissSize #5 e_1 d_\shift-1
      }
    }
    \layout { indent = 0.0\cm   }
  }  

measureFiveExtract =  \score { \relative c' {
   |  fs4  d4.-1( e8_\shift-1)  
   |  fs4.( a8) fs4~  
} \layout { indent = 0.0\cm   }
}   
measureFivePractice = \score { \relative c' {
      \set countPercentRepeats = ##t
      \repeat volta 10 {
         d_1 \glissSize #5 e_\shift-1
         e_1 \glissSize #5 d_\shift-1
      }
} \layout { indent = 0.0\cm   }
}
  
measureSevenExtract =  \score { \relative c' {
   |  fs8( \< a)    fs( a)   g ( b) \!
   |  e2.^\markup {\circle \finger 3}  ~
} \layout { indent = 0.0\cm   }
}


measureSevenPractice = \score { \relative c'' {
      \set countPercentRepeats = ##t
      \repeat volta 10 {
         g4-3 a b c d e fs g fs e d c b a
      }
} \layout { indent = 0.0\cm   }
}

measureTwentyFiveExtract = \score { \relative c'' {
%{   25 %}
\time 3/4
   |  e4 e4.\ub \<( \!e8   )
   |  b'4.\mf\tenuto^\shift-4 (  a8) g4~ 
  }
    \layout { indent = 0.0\cm   }
  }
 measureTwentyFivePractice = \score { \relative c'' {
      \set countPercentRepeats = ##t
      \repeat volta 10 {
         e_2 \glissSize #5 g_\shift-2
         g_2 \glissSize #5 e_\shift-2
      }
      \repeat volta 10 {
         r8 e8_2 e e e8.  \glissSize #5 g16_\shift-2
         b4.\mf\tenuto^\shift-4 (  a8) g4~ 
      }
    }
    \layout { indent = 0.0\cm   }
  } 


measureSixtyFiveExtract = \score { \relative c'' {
\time 3/4
%{  65 %}
   | \partial 4   g'8-3( b-1) 
   | e2.\f^\shift-1 ~
   | e4 e4. _\dim ~ e8
   | b'2. \p ^\markup {\circle \finger 4}~ 
  }
    \layout { indent = 0.0\cm   }
  }
 measureSixtyFivePractice = \score { \relative c'' {
      \set countPercentRepeats = ##t
      \repeat volta 10 {
           b4-1 ^"A string" \glissSize #5 e^\shift-1
           e_1 \glissSize #5 b_\shift-1
      }
      \repeat volta 10 {
           b'-1 ^"E string" \glissSize #5 e^\shift-1
           e_1 \glissSize #5 b_\shift-1
      }
    }
    \layout { indent = 0.0\cm   }
  }   
  
 measureSixtyFivePracticeArpeggio = \score { \relative c' {
      \set countPercentRepeats = ##t
      \repeat volta 10 {
           e-1 g b e_\shift-1 g b e-1 g-2 a-3 b-4 
      }
    }
    \layout { indent = 0.0\cm   }
  }   
  
\markup { \fill-line {
    \column {
       \line { \bold {To Play:} }      
      \vspace #1.0 \line { \score { \measureOneExtract }  }
      \vspace #1.0 \line { \score { \measureFourExtract } }
      \vspace #1.0 \line { \score { \measureFiveExtract } }
      \vspace #1.0 \line { \score { \measureSevenExtract } }
      \vspace #1.0 \line { \score { \measureTwentyFiveExtract } }    
      \vspace #1.0 \line { \score { \measureSixtyFiveExtract } }    
      \vspace #1.0 \line { ... }    

%      \line { ....... }
    }
    \hspace #2
    \column {
      \line { \bold {Practice:} }      
      \vspace #1.0 \line { \score { \measureOnePractice  } }
      \vspace #1.0 \line { \score { \measureFourPractice } }
      \vspace #1.0 \line { \score { \measureFivePractice } }
      \vspace #1.0 \line { \score { \measureSevenPractice } }
      \vspace #1.0 \line { \score { \measureTwentyFivePractice } }
      \vspace #1.0 \line { \score { \measureSixtyFivePractice } }
      \vspace #1.0 \line { \score { \measureSixtyFivePracticeArpeggio } }
%      \line { ....... }
    }
    \hspace #1
  }
}

\version "2.18.2"

\bookpart {

    \paper {
	print-first-page-number = ##f
	#(set-paper-size "arch a")
    }

    \header { tagline = "" }

%\pointAndClickOff

\markup { \fill-line { \center-column {
   \vspace #8
   { \fontsize #16 \override #'(font-name . "Century Schoolbook L") \italic "Trois" }
   \vspace #1
   { \fontsize #16 \override #'(font-name . "Century Schoolbook L") \italic "Gymnopédies" }
   \vspace #6
   \sans \fontsize #10 "Erik Satie"
   \vspace #1
   \sans \fontsize #8 "(1866 - 1925)"
   \vspace #6
   \fontsize #4 "For Guitar Orchestra"
   \vspace #12
   \fontsize #5 "Transcribed and Engraved"
    " "
   \fontsize #5 "by"
    " "
   \fontsize #5 "Steve Shorter"
   }
  }
 }
} 



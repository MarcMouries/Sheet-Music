\version "2.19.10"
%---------------------------
    Title    = 	"Concerto in D minor"
    Subtitle =	"for two violins and strings"
    Composer =	"J. S. Bach (1685-1750)"
    opus     =	"BWV 1043"
    arranger = "Arranger"
    instrument = "Violin I"
%---------------------
%\markup { \vspace #3 }

\paper {
  ragged-right = ##f  % when false, staff extend to the end
%   scoreTitleMarkup = \markup {

}
\markup {
    \override #'(baseline-skip . 10) %% changes distance between title/subtitle and composer/arranger
    \column {
      \override #'(baseline-skip . 3.5) %
      \column {
	\huge \larger \bold
	\fill-line {\larger  \Title	  }
	\fill-line {\large   \Subtitle	  }

      }
      \column {
	\fill-line {
	    \box { \pad-around #1 { \instrument }}  % LEFT
	  { \large \bold \instrument }              % CENTER
	    \Composer                               % RIGHT
	}
	\fill-line {
	  \fromproperty #'header:meter
	  \fromproperty #'header:arranger
	}
      }
    }
 }

\markup {
        \vspace #1
    }
\score {
  \new Staff { c''1 }

}

\markup {
    \override #'(baseline-skip . 10) %% changes distance between title/subtitle and composer/arranger
    \column {
      \override #'(baseline-skip . 3.5) %
      \column {
	\fill-line {
	    \box { \pad-around #1 { \instrument }}  % LEFT
	  { \large  \Title }              % CENTER
	    \Composer                               % RIGHT
	}
	\fill-line {
	  \fromproperty #'header:meter
	  \fromproperty #'header:arranger
	}
      }
    }
 }
\markup {    \vspace #1 }
\score {
  \new Staff { c''1 }

}
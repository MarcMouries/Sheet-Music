\version "2.12.2"
\include "english.ly"

#(set-default-paper-size "letter")
#(set-global-staff-size 24)

\book {

  %% book paper, which is inherited by all children bookparts
  \paper {
    ragged-last-bottom = ##t
    %% Page footer: add a different part-tagline at part last page
    oddFooterMarkup = \markup {
      \column {
        \fill-line {
          %% Copyright header field only on book first page.
          \on-the-fly #first-page \fromproperty #'header:copyright
        }
        \fill-line {
          %% Part tagline header field only on each part last page.
          \on-the-fly #part-last-page \fromproperty #'header:parttagline
        }
        \fill-line {
          %% Tagline header field only on book last page.
          \on-the-fly #last-page \fromproperty #'header:tagline
        }
      }
    }
  }

  %% book header, which is inherited by the first bookpart
  \header {
    title = "Scales & Arpeggios"
    copyright = "Copyright line on book first page"
    parttagline = "Part tagline"
    tagline = "Book tagline"
  }

  \bookpart {
    %% empty
    \pageBreak
  }

  \bookpart {
    \header {
    	subtitle    = "1st Position"
    	title       = "1st Position"
    	parttagline = "1st Position"
    }

    \score {
  \relative a' {
    \key a \major
    a8 b8 cs8 d8 e8 fs8 gs8 a8 a8 gs fs8 e8 d8 cs8 b a
    \bar ":|:"
    \times 2/3 {a8 cs8 e8}
    \times 2/3 {a8 e8 cs8} a2 \bar ":|"
  }
  \header {
    piece = "A Major"
  }
  \layout {
    indent = 0\in
  }
}


\score {
  \relative c' {
    \key d \major
    d8 e8 fs8 g8 a8 b8 cs8 d8 d8 cs8 b8 a8 g fs e d
    \bar ":|:"
    \times 2/3 {d8 fs a}
    \times 2/3 {d a fs } d2 \bar ":|"
  }
  \header {
    piece = "D Major"
  }
  \layout {
    indent = 0\in
  }
}


% G Major
\score {
\relative c''  {
    \key g \major
    g,4 a b c d e fs g a b c d e fs
    g fs e d c b a g fs e d c b a \bar ":|"
      \break
    { g b d } { g b d }
    { g d b } { g d b }

    \times 2/3 { g8 b8 d8 }  \times 2/3 { g8 b8 d8 }
    \times 2/3 { g8 d8 b8 }  \times 2/3 { g8 d8 b8 }
    g1
  }
  \header {  piece = "G Major"
  }
  \layout {
    indent = 0\in
  }
}

% G Minor Natural
\score {
\relative c'' {
    \key g \minor
    g,4 a bf c d ef f g a bf c d ef f
    g f ef d c bf a g f ef d c bf a \bar ":|"
  }
  \header {  piece = "G Minor Natural"
  }
  \layout {
    indent = 0\in
  }
}
% G Minor Harmonic
\score {
\relative c'' {
    \key g \minor
    g,4 a bf c d ef fs g a bf c d ef fs
    g fs ef d c bf a g fs ef d c bf a \bar ":|"
  }
  \header {  piece = "G Minor Harmonic"
  }
  \layout {
    indent = 0\in
  }
}
% G Minor Melodic
\score {
\relative c'' {
    \key g \minor
    g,4 a bf c d e fs g a bf c d e fs
    g fs ef d c bf a g f ef d c bf a \bar ":|"
  }
  \header {  piece = "G Minor Harmonic"
  }
  \layout {
    indent = 0\in
  }
}
  } % bookpart

   \bookpart {
    \header {
    	subtitle    = "3rd Position"
    	title       = "3rd Position"
    	parttagline = "3rd Position"
    }

 % G Major - 3rd
\score {
\relative c''  {
    \key g \major
    g8-1 a  b c d-1 e fs g-4
    g  fs e d c b a  g  \bar ":|"
    
    { g b d g d b }
  }
  \header {  piece = "G Major"
  }
  \layout {
    indent = 0\in
  }
}
  }
  }
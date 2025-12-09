\version "2.19.11"

%% Examples of using the title-formatting.ly include file

%% ============================================
%% EXAMPLE 1: Simple Style
%% ============================================
\include "title-formatting.ly"

\header {
  title = "My Beautiful Song"
  composer = "John Doe"
  genre = "Folk"
  tagline = ""
}

\paper {
  \simpleTitle
}

\score {
  \new Staff {
    \relative c' { c4 d e f g1 }
  }
}

%% ============================================
%% EXAMPLE 2: Real Book Style
%% ============================================
\bookpart {
  \header {
    title = "Jazz Standard"
    subtitle = "from The Great American Songbook"
    composer = "Cole Porter"
    arranger = "Marc Mouries"
    style = "jazz"
    tagline = ""
  }

  \paper {
    \realBookStyle
  }

  \score {
    \new Staff {
      \relative c' { c4 d e f g1 }
    }
  }
}

%% ============================================
%% EXAMPLE 3: Classical Style
%% ============================================
\bookpart {
  \header {
    title = "Sonata in D Major"
    subtitle = "Opus 12 No. 3"
    composer = "Wolfgang Amadeus Mozart"
    style = "classical"
    tagline = ""
  }

  \paper {
    \classicalStyle
  }

  \score {
    \new Staff {
      \relative c' { c4 d e f g1 }
    }
  }
}

%% ============================================
%% EXAMPLE 4: Minimal Style
%% ============================================
\bookpart {
  \header {
    title = "Practice Exercise"
    composer = "Anonymous"
    style = "exercise"
    tagline = ""
  }

  \paper {
    \minimalStyle
  }

  \score {
    \new Staff {
      \relative c' { c4 d e f g1 }
    }
  }
}

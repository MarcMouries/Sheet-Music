\version "2.24.4"
\language "english"

\header {
  title    = "Score Preview Example"
  subtitle = "4-Bar Systems with Preview Tags"
  composer = "Example Composer"
}

\paper {
  indent = 0
  top-margin = 0
  bottom-margin = 0
  left-margin = 0
  right-margin = 0
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  ragged-right = ##t
  tagline = ##f
}

global = {
  \key g \major
  \time 4/4
}

fullMusic = \relative c'' {
  \global

  % ============================================
  % PREVIEW: FIRST 4 BARS
  % ============================================
  \tag #'preview
  \tag #'preview-4 {
    g4 g a b |          % bar 1
    c2 b4 a |           % bar 2
    d4 d e f |          % bar 3
    g1 |                % bar 4
    \break               % force new system after 4 bars
  }

  % ============================================
  % PREVIEW: FIRST 8 BARS
  % ============================================
  \tag #'preview-8 {
    % Bars 1–4
    g4 g a b |
    c2 b4 a |
    d4 d e f |
    g1 |
    \break

    % Bars 5–8
    e4 d c b |
    a2 g4 a |
    b4 c d e |
    g1 |
    \break
  }

  % OPTIONAL: untagged continuation of full score
  e4 e d c |
  b2 g4 a |
  d4 c b a |
  g1 \bar "|."
}

\score {
  \new Staff \fullMusic
  \layout {
    indent = 0
    ragged-last = ##f
    ragged-bottom = ##f
  }
}

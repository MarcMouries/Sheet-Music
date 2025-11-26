\version "2.24.4"
\language "english"

\header {
  title = \markup \concat {"A-major pentatonic  " \flat "7"}
  tagline = ""
}

lick = \relative a {
  \key a \major
  \time 4/4

  % --- ASCENDING: start on G and climb to A on the E string (a'') ---
  g8  a  cs  d  e        % G–A–C#–D–E
  cs8 d  e  g            % C#–D–E–G
  d8  e  g  a            % D–E–G–A
  e8  g  a  cs           % E–G–A–C#'
  g8  a  cs d            % G–A–C#'–D'
  a8  cs d  e            % A–C#'–D'–E'
  cs8 d  e  g            % C#'–D'–E'–G'
  d8  e  g              % D'–E'–G'–  

\break
% --- DESCENDING: bring it back down using the same idea ---
  a8 g e d cs          % ...then A on the E string and down from high A area
  e8  d cs a           % E'–D'–C#'–A
  d8  cs a  g           % D'–C#'–A–G
  cs8 a  g  e           % C#'–A–G–E
  a8  g  e  d            % A–G–E–D
  g8  e  d  cs           % G–E–D–C#
  e8  d  cs a            % E–D–C#–A
  d8  cs a  g4 \fine            % D–C#–A–G (resolve toward G)
}

\score {
  \new Staff {
    \lick
  }
  \layout { }
}

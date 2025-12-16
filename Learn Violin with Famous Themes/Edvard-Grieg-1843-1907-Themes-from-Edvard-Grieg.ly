\version "2.24.4"
\language "english"

\header {
  title    = "Themes from Edvard Grieg"
  composer = "Edvard Grieg (1843–1907)"
  tagline  = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MORNING MOOD – MAIN THEME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

morningTheme = \relative b'' {
  \time 6/8
  \key e \major
  \tempo "Allegretto pastorale" 4 = 72

  | b8( gs fs8  e8 fs gs8)
  | b8([ \grace {gs16 a} gs8 fs8]       e8  fs8  gs8)
  | \appoggiatura {gs16 a} b8( gs8  b8)   cs8( gs8  cs8)
  | b8( gs fs e4) r8 

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IN THE HALL OF THE MOUNTAIN KING – MAIN THEME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mountainTheme = \relative c''' {
  \time 4/4
  \key b \minor
  \tempo "Allegro (In the Hall of the Mountain King)" 4 = 132
%\clef bass
  <fs,, fs'>1\p\fermata->
  b,8-.\pp cs-._\markup {\italic {e sempre staccato}} d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  \break
  b8-. cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. <a, a'>2->
  \break
  fs8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs8-.-> as-. cs4-.
  fs,8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs2->
  \break
  fs8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs8-.-> as-. cs4-.
  fs,8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. <cs, cs'>2->
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOLVEIG'S SONG – MAIN THEME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

solveigTheme = \relative e' {
  \time 4/4
  \key a \minor
  \tempo "Andante (Solveig's Song)" 4 = 60

  
  % e2 c8 e a b |   g2 ~ g4 r4
  
  r2 r4 e4 |
  \repeat volta 2 {
  a4( b8 c) d4 ( e8 f  )
  f( e) e c a4 \(a8( c8)\) |
  | c8( b) b gs gs16( e8.) ~ e4 ~
  e8 r8 r4 r2 }
  \break
  | r1
  | r1
  | r1
  | r1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SCORES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \new Staff { \clef treble \morningTheme }
  \header { piece = "Morning Mood (Peer Gynt, Op. 23)" }
  \layout {}
  \midi {}
}

\score {
  \new Staff { \clef treble \mountainTheme }
  \header { piece = "In the Hall of the Mountain King" }
  \layout {}
  \midi {}
}

 \score {
   \new Staff { \clef treble \solveigTheme }
   \header { piece = "Solveig's Song" }  
  \layout {}
  \midi {}
}

\version "2.24.4"
\language "english"

\header {
  title = "Im Hashem Lo Yivneh Bayis"
  subtitle = "Psalm 127:1"
  composer = "Traditional"
  arranger = "A minor"
  tagline = ""
}

global = {
  \key a \minor
  \time 4/4
}

melody = \relative c' {
  \global
  \partial 8 a16 c
  % === Replace these placeholders with the exact melody for your version ===
  % A phrase
  e4 a a a | a a a a |
  g4 g g g | g g g g |
  f4 f f f | e4 e e e |
  d4 d e2  | r1 |
  % B phrase
  a8 b c a f' e d4  c4 c b a |
  g4 g a b | c2 r2 |
  b4 b a g | a g f e |
  d4 e f g | a1
}

lyricsVerse = \lyricmode {
  Im Ha -- shem lo yiv -- neh ba -- yis,
  sha -- v' a -- mu -- lu bo -- noy vo.
  Im Ha -- shem lo yish -- mar ir,
  sha -- v' sho -- kad sho -- mer.
}

harmony = \chordmode {
  % Adjust these to match your preferred changes
  a1:m | a:m | g | g |
  f | e:7 | d:m | e:7 |
  a:m | c | g | c |
  e:7 | a:m | d:m e:7 | a:m
}

\score {
  <<
    \new ChordNames { \harmony }
    \new Voice = "mel" { \melody }
    \new Lyrics \lyricsto "mel" { \lyricsVerse }
  >>
  \layout { }
}

% --- Optional: quick transpose helper ---
% \score {
%   \transpose a c {  % example: transpose from A minor to C minor
%     <<
%       \new ChordNames \with { \set chordChanges = ##t } { \harmony }
%       \new Voice = "mel" { \melody }
%       \new Lyrics \lyricsto "mel" { \lyricsVerse }
%     >>
%   }
%   \layout { }
% }

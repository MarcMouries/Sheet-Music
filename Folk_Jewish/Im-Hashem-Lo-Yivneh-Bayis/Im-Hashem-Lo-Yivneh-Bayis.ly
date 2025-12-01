\version "2.24.4"
\language "english"
\layout { indent = 10\mm}
#(set-global-staff-size 20)


\header {
  title = "Im Hashem Lo Yivneh Bayis"
  subtitle = "Psalm 127:1"
  composer = "Traditional"
  country = "Jewish"
}

\include "../../common/common-header.ily"


global = {
  \key a \minor
  \time 4/4
}

melody = \relative c' {
  \global
  \partial 8 a16 c |
  \repeat volta 2 {
    % A phrase
    | e8 e f e a, e' ~ e4
    | g4 f8 e f16( g) f( e) d8 d16 d

    | d8 d e d a8( d4)  d8
    \break
    | f8 f e( d) c4. c16 d

    | e8 e f e a, e' r4
    | g4 f8 e f16( g) f( e) d8 d16 d
    \break
    | d8 d e d g8( f4)  f8
  }
  %\break
  \alternative {
    { e8 d c( b) a4. a16 c }
    { e8 c' b( c) a2}
  }
  \break
  % B phrase
  \repeat volta 2 {

    a8 c b c d c a4
    a8 b c a f' e d4
    f8 e d4  f8 e d4
    
    \alternative {
      { b8 c d f e d c b }
      { b8 d c b a2}
    }
  }
}

  lyricsVerse = \lyricmode {
    Im Ha -- shem lo yiv -- neh ba -- yis,
    sha -- v' a -- mu -- lu bo -- noy vo.
    Im Ha -- shem lo yish -- mar ir,
    sha -- v' sho -- kad sho -- mer.
  }

  harmony = \chordmode {
    % Adjust these to match your preferred changes
    \skip 8
    a1:m | a:m | g | g |
    f | e:7 | d:m | e:7 |
    a:m | c | g | c |
    e:7 | a:m | d:m e:7 | a:m
  }

  \score {
    <<
      % \new ChordNames { \harmony }
      \new Voice = "mel" { \melody }
      %\new Lyrics \lyricsto "mel" { \lyricsVerse }
    >>
    \layout { }
    \midi { \tempo 4 = 120 }
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

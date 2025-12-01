\version "2.24.0"
\language "english"

\header {
  title = "Reflections"
  composer = "Toshifumi Hinata"
  country = "Japan"
  style = "classical"
  video = "https://www.youtube.com/watch?v=MJenceQ9IEw"
}

\include "../../common/common-header.ily"

\paper {
  %system-system-spacing = #'((basic-distance . 0.1) (padding . 0))
  %ragged-last-bottom = ##f
  %ragged-bottom = ##f
  left-margin = 1\in
  right-margin = 1\in

}

%\pointAndClickOff


global = {
  \time 3/4
  \key c \major
  %\tempo 4=100
}

%break = {}
chordNames = \chordmode {
  \global
}

melody_intro ={

}

melody = \relative c' {
  \global
  R2.
  | r2  r8 e8\upbow

  \repeat volta 2 {

    % PART 1
    | b'4-3( c4.) g8
    | a2.
    \break
    | c4( b4.) g8
    | e2.\downbow
    | e4( f4.) a,8
    | e'4-3_4\downbow( d4.) c8 b2.


    \break
    | R2.
    | c'4\downbow( b4.) g8     | c2 c4          | d4( b4.) g8
    | e2.
    \break
    | e2 ~ e8  f16 g | e4.( d8~) d8[ c8]
    | b2.
    | R2.
    | e4\upbow a4. a8
    \break
    | e2\downbow r8 c8
    | d2.
    d4. g4 f8
    | e4 a4. a8
    | e2 r8 c8
    \break
    | d2. ~
    d2.
    | e4 a4. a8
    | e2 r8 c8
    d2.
    d4. g4 f8
    \break
    e4 a4. a8
    | e2 r8 c8
  }
  \alternative {
    { d2 r8 e8 | }
    { d2. ~ d2.  \bar "|."}
  }
}

%\book {
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { indent= 1\in}
  \midi { }
}
%\paper { annotate-spacing = ##t }


%}


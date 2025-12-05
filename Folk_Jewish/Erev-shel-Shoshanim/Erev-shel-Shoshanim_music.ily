\version "2.24.4"
\language "english"

% This file contains the shared music content for Erev shel Shoshanim
% Include this file from key-specific versions

global = { \time 4/4 }

% --- Chords ---
songChords = \chordmode {
  % A section
  e1:m a1 a2:m d2 e1:m
  e1:m d1 b1:m e1:m
  % B section
  e1:m a1 a1:m e1:m
  a1:m e1:m d1 e1:m
}

% --- Melody  ---
songMelody = \relative c' {
  \global
  \repeat volta 2 {
    e4 e8 d8 e4 g4
    a2. e4
    a4 a8 g8 a4 b4
    g2. r4
    \break
    g4 g8 fs8 g4 a4
    fs4. e8 d2
    fs4 fs8 e8 fs4 g4
    e2. r4
  }
  \break
  \repeat volta 2 {
    b'4 b8 a8 b4 g4
    a2. e4
    a4 a8 g8 a4 b4
    g2. r4
    \break
    a4 a8 g8 a4 b4
    g4. fs8 e2
    fs4 fs8 e8 fs4 g4
    e2. r4
  }
}

% --- Lyrics ---
verseOne = \lyricmode {
  E -- rev shel sho -- sha -- nim,
  ne -- tse na el ha -- bu -- stan;
  mor be -- sa -- mim u -- le -- vo -- na,
  l' -- ra -- g' -- lech mif -- tan.

  Lai -- la yo -- red le -- at,
  ve -- ru -- ach sho -- shan nosh -- va;
  ha -- va el -- chash lach
  shir ba -- lat, ze -- mer shel a -- ha -- va.
}

verseTwo = \lyricmode {
  Sha -- char ho -- ma yom,
  ro -- shech ma __ ley l' tla -- lim;
  Pich el ha -- bo -- ker
  sho -- sha -- na ek -- te __ fey -- nu li.

  La -- la yo -- red le -- at,
  ve -- ru -- ach sho -- shan nosh -- va;
  ha -- va el -- chash lach
  shir ba -- lat, ze -- mer shel a -- ha -- va.
}

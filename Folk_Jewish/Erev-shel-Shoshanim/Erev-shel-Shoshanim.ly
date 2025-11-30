\version "2.24.4"
%\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\header {
  title = "Erev shel Shoshanim"
  composer = "Yosef Hadar"
  country = "Jewish"
  poet = "Moshe Dor"
  style = "klezmer"
  tagline = ""
}

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

% --- Lyrics stitched to match merged melody (A then B) ---
verseOne = \lyricmode {
  E -- rev shel sho -- sha -- nim,
  ne -- tse na el ha -- bu -- stan;
  mor be -- sa -- mim u -- le -- vo -- na,
  l’ -- ra -- g’ -- lech mif -- tan.

  La -- la yo -- red le -- at,
  ve -- ru -- ach sho -- shan nosh -- va;
  ha -- va el -- chash lach
  shir ba -- lat, ze -- mer shel a -- ha -- va.
}

verseTwo = \lyricmode {
  Sha -- char ho -- ma yo -- na,
  ro -- shech ma __ ley l’ tla -- lim;
  Pich el ha -- bo -- ker
  sho -- sha -- na ek -- te __ fey -- nu li.

  La -- la yo -- red le -- at,
  ve -- ru -- ach sho -- shan nosh -- va;
  ha -- va el -- chash lach
  shir ba -- lat, ze -- mer shel a -- ha -- va.
}

\book {
  % -------- E minor --------
  \bookpart {
    \header { subtitle = "Key: E minor" }
    \score {
      <<
        \new ChordNames { \songChords }
        \new Staff <<
          \key e \minor
          \new Voice = "mel" { \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    \midi { \tempo 4 = 120 }
    }
  }

  % -------- F# minor --------
  \bookpart {
    \header { subtitle = "Key: F# minor" }
    \score {
      <<
        \new ChordNames { \transpose e fs \songChords }
        \new Staff <<
          \key fs \minor
          \new Voice = "mel" { \transpose e fs \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    }
  }

  % -------- F minor --------
  \bookpart {
    \header { subtitle = "Key: F minor" }
    \score {
      <<
        \new ChordNames { \transpose e f \songChords }
        \new Staff <<
          \key f \minor
          \new Voice = "mel" { \transpose e f \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    }
  }

  % -------- C minor --------
  \bookpart {
    \header { subtitle = "Key: C minor" }
    \score {
      <<
        \new ChordNames { \transpose e c \songChords }
        \new Staff <<
          \key c \minor
          \new Voice = "mel" { \transpose e c \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    }
  }

  % -------- G minor --------
  \bookpart {
    \header { subtitle = "Key: G minor" }
    \score {
      <<
        \new ChordNames { \transpose e g \songChords }
        \new Staff <<
          \key g \minor
          \new Voice = "mel" { \transpose e g \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    }
  }

  % -------- D minor --------
  \bookpart {
    \header { subtitle = "Key: D minor" }
    \score {
      <<
        \new ChordNames { \transpose e d \songChords }
        \new Staff <<
          \key d \minor
          \new Voice = "mel" { \transpose e d \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    }
  }

  % -------- A minor --------
  \bookpart {
    \header { subtitle = "Key: A minor" }
    \score {
      <<
        \new ChordNames { \transpose e a \songChords }
        \new Staff <<
          \key a \minor
          \new Voice = "mel" { \transpose e a \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    }
  }

  % -------- B minor --------
  \bookpart {
    \header { subtitle = "Key: B minor" }
    \score {
      <<
        \new ChordNames { \transpose e b \songChords }
        \new Staff <<
          \key b \minor
          \new Voice = "mel" { \transpose e b \songMelody }
          \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
          \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
        >>
      >>
      \layout {
        \override Lyrics.LyricText.font-size = #-2
      }
    }
  }
}

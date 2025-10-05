\version "2.24.4"
\language "english"

\header {
  title = "Something's Got a Hold on Me"
  subtitle = "Blues style"
  composer = "Leroy Kirkland & Pearl Woods"
  tagline = ""
}


\layout {
  indent =0
  \context {
    \Lyrics
    \override LyricText.font-size = #-1
  }
}

% --- CHORDS (from the page, incl. N.C. gaps) ---
chordNames = \chordmode {
  % System 1
  c1:7 s1 s2 c1:7 s1 
  s1 s1 s1 c1:7 
  s1 s1 f1:7 
  
}

% --- MELODY ---
melody = \relative c''' {
  \clef treble

  % ===== System 1 =====
  % m1  (C7) — pickup-like blues lick, tied syncopations kept
    g2( f2)
  % m2  (rough contour for “some-times, I get a…”)
  | ef8 c4.~ c8 bf 8 g16 f16 ef8 
  % m3  (C7) “I get a good feeling, yeah”  
  | \time 2/4 c'8 c8 g16(f16 ef8\fermata )
  % m4  (N.C.) tail + fermata note on the page
  | \time 4/4  g'1\fermata 
  
  bf1 ~
  \break
  % m5  (N.C.) “I get a feeling that I…”
  | bf4 bf8 g bf bf bf g
  % m6  (F7) “…never, never, never had before…”
  | c8 c8 bf bf f f ef c
  % m7  (N.C.) “no, no…”
  | ef8. c16( g8) c8 ( ~ c16 g16) bf8 f16( ef8.\fermata)
  % m8  (N.C.) “I just gotta tell you right now…”
  g'1
  \break
  | g2 ( f8) f f f
  | ef8 c ef!8 c16( bf16 g8) g8 g4\fermata
  | a'1\fermata
  | bf,4 c8 ef16 ( c16 ~ c16 bf g8 ~ g8) bf8
  \break
  | c8 bf c bf c16 ( bf g8) g4
  | r1
  | r1
  | r1
}

lyricsOne = \lyricmode {
  % m1
  Oh,__

  % m2  
  some -- times, I get a good

  % m3 
  feel -- ing,  yeah.__

  % m4  
  \skip 1 
  
  % m5 
  I__ __
   
  % m6 
  get a feel -- ing that I  

  % m7
  nev -- er,  nev -- er,  nev -- er, nev -- er  

  % m8
  had be -- fore,  no,  no.__
  
  % m9
  \skip 1 

  % m10
  I __ just got -- ta
  
  % m11
  tell you right now__ that I,
  
  % m12
  \skip 1 
  
  % m13
  I be -- lieve,__ __ I  
  
  % m14
  real -- ly do be -- lieve __ __ that
}

\score {
  <<
    \new ChordNames { \set chordChanges = ##f \chordNames }
    \new Voice = "Mel" { \melody }
    \new Lyrics \lyricsto "Mel" { \lyricsOne }
  >>
  \layout { }
  \midi { \tempo 4=96 }
}



\markup "in key"


% Transpose everything up a semitone (so first note is G♯)
melodyGs = \transpose g gs \melody
chordsCs = \transpose c cs \chordNames

\score {
  <<
    \new ChordNames { \set chordChanges = ##t \chordsCs }
    \new Voice = "MelGs" {
      \time 4/4
      \melodyGs
    }
    \new Lyrics \lyricsto "MelGs" { \lyricsOne }
  >>
}

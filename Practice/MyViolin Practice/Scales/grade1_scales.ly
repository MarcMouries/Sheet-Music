\version "2.5.25"  % necessary for upgrading to future LilyPond versions.
\header{
  title = "ABRSM Grade 1 Scales"
  arranger = \markup { \small "arr. Paul Makepeace" \teeny "http://paulm.com/music" }
  instrument = "Flute"
  meter = "slurred and tongued"
}

%{ 
SCALES AND ARPEGGIOS * : from memory, to be played both slurred and tongued in the following keys:
F, G majors; E minor (one octave)
Scales: in the above keys (minor in melodic or harmonic form at candidate's choice)
%}


\score {
  \header {
    piece = "F Major"
  }
  \relative{
    \key f \major
    f8 g8 a8 bes8 c8 d8 e8 f8
    e8 d8 c8 bes8 a8 g8 f4
  }
}

\score {
  \header {
    piece = "G Major"
  }
  \relative{
    \key g \major
    g'8 a8 b8 c8 d8 e8 fis8 g8
    fis8 e8 d8 c8 b8 a8 g4
  }
}

\score {
  \header {
    piece = "E Minor (harmonic)"
  }
  \relative{
    \key e \minor
    % w    h    w  w  h    wh     h
    e8 fis8 g8   a8 b8 c8     dis8 e8
    % w   w  h  w  w  h    w
       d?8 c8 b8 a8 g8 fis8 e4
  }
}

\score {
  \header {
    piece = "E Minor (melodic)"
  }
  \relative{
    \key e \minor
    % w    h  w  w  w    w    h
    e8 fis8 g8 a8 b8 cis8 dis8 e8
    % w   w   h  w  w  h    w
       d?8 c?8 b8 a8 g8 fis8 e4
  }
}
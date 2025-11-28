\version "2.12.3"
\include "english.ly"
#(set-global-staff-size 32)
\header {
  title = "Greensleeves"
  country = "England"
  % Enlever le pied de page par défaut
  tagline = ##f
}
\paper {
   #(set-paper-size "a4"'landscape)
   page-count = 1
    top-margin = 3\mm
      %pour répartir les systèmes dans la page
       ragged-last-bottom = ##f
 }
global = {
  \key d \minor
  \time 6/8
  \partial 8
}
chordNames = \chordmode {
  \global
  % Ajouter ici des chiffrages.
 r8
 d2.:m   c  d:m  a
 d2:m     c
 d4.:m a
 d2.:m
 f
 c
 d:m
 a
 f
 c
 d4.:m a
 d2.:m
}
melody = \relative c'' {
  \global
  % En avant la musique !
  d,8
  (f4) g8 a8. bf16 a8
  g4 e8 c8. d16 e8
  f4 d8 d8. cs16 d8
  e4 cs8 a4 \bar "" \break d8
  (f4) g8 a8. bf16 a8
  g4 e8 c8. d16 e8
  f8. e16 d8 cs8. b16 cs8
  d4 d8 d4. \break
  c'4.  c8. bf16 a8
  g4 e8 c8. d16 e8 \noBreak
  f4 d8 d8. cs16 d8
  e4 cs8 a4.
  c'4.  c8. bf16 a8
  g4 e8 c8. d16 e8
  f8. e16 d8 cs8. b16 cs8
  d4 d8 d4.\bar "||"
}
%verse = \lyricmode {
  % Ajouter ici des paroles.}
\score {
  \new StaffGroup \with {
    \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #20
  } <<
       \new Voice { \melody }
       % \addlyrics { \verse }
       \new ChordNames \with {
            % creer portee
            \consists "Staff_symbol_engraver"
            % epaisseur des lignes de la portée
            \override StaffSymbol #'thickness = #(magstep -10)
            \consists "Chord_name_engraver"
            \override BarLine #'bar-size = #4
            \consists "Bar_engraver"
            % deplacer accords (horizontal . Vertical)
              \override ChordName #'extra-offset = #'(0 . -1)
             \override ChordName   #'font-size = #1
        }\chordNames
      >>
  \layout {
     indent = 0.0\mm
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}


\score { 
  << 
    \context ChordNames { \chordNames }
    \new Staff {
      \context Voice = "voiceMelody" { \melody }
    }   
  >> 
\midi {} 
\layout {} 
} 
\version "2.18.2"

% Count-in Clave
"count-in clave" = { \new DrumStaff { \drummode { cl4 cl4 cl4 cl4 } } }

% Piano
 

%% PDF
\score {
  \piano
  \layout { }
}

%% MIDI
\score {
  {
    \"count-in clave"  \piano
  }
  \midi {
    \tempo 4 = 120
  }
}
\version "2.24.4"
\language "english"

\header {
  title = "Badinerie"
  subtitle = "Orchestral Suite No. 2 in B minor"
  composer = "Johann Sebastian Bach (1685–1750)"
  country = "Germany"
  opus = "BWV 1067"
  style = "baroque"
  video = ""
  tagline = ""
}

melody = {
  \clef treble
  \key b \minor
  \time 2/4
  %\tempo "Vivace" 4 = 156
\repeat volta 2 {
  \partial 4
  b''8 d'''16 b''16 |
  fs''8 b''16 fs''16 d''8 fs''16 d''16 |
  b'4 fs'16 b'16 d''16 b'16 |
  cs''16 b'16 cs''16 b'16 as'16 cs''16 e''16 cs''16 |
  \break
  d''8 b'8 b''8 d'''16 b''16 |
  fs''8 b''16 fs''16 d''8 fs''16 d''16 |
  %\break
  b'4 d''16 cs'' d''8 |
  d''16 cs'' d''8 b''8 d''8 |
  \break
  d''8\trill cs''8 fs''16 es''16 fs''8 |
  fs''16 es''16 fs''8 d'''8 fs''8 |
  fs''8 es''8 cs''16 fs''16 a''16 fs''16 |
  gs''16 fs''16 gs''16 fs''16 es''16 gs''16 b''16 gs''16 |
  \break
  
  a''16 gs''16 a''16 gs''16 fs''16 a''16 fs''( f'' 
  
  fs'') b''16 fs''( f'' fs'') cs'''16 fs''( f'' 
  fs'')
  d'''16 fs''( f'' fs'') d'''16 cs'''16 b''16 |
  
  cs'''16 a''16 gs''16 fs''16 a''8 
  
  gs''8\trill |

fs''4
}

  % ===== SECOND SECTION =====
  \repeat volta 2 {
    %{ 18 %} fs''8 a''16 fs''16 |                          
    %{ 19 %} cs''8 fs''16 cs''16 a'8 cs''16 a'16 |       
    %{ 20 %} fs'4 c''8 b'8 |                                 
    e''8 ds''16 fs''16 a''8 g''16 fs''16 |        % m21
    g''8 e''8 g''8 b''16 g''16 |                     % m22
    e''8 g''16 e''16 cs''8 e''16 cs''16 |          % m23
    a'4 a'16 d''16 fs''16 d''16 |                   % m24
    e''16 d''16 e''16 d''16 cs''16 e''16 g''16 e''16 | % m25
    fs''16 e''16 fs''16 e''16 d''16 fs''16 d''16 cs''16 | % m26
    d''16 g''16 d''16 cs''16 d''16 a''16 d''16 cs''16 |     % m27
    d''16 b''16 d''16 cs''16 d''16 b''16 a''16 g''16 |       % m28
    a''16 fs''16 e''16 d''16 fs''8 e''8 |          % m29
    d''4 fs''8 fs''8 |                             % m30
    fs''8 fs''8 d'''8 fs''8 |                     % m31
    fs''8 e''8 e''8 e''8 |                          % m32
    e''8 e''8 cs'''8 e''8 |                         % m33
    e''8 d''8 b''8 d'''16 b''16 |                    % m34
    g''4 g''8 b''32 a''32 g''32 fs''32 |            % m35
    e''4 e''8 g''32 fs''32 e''32 d''32 |            % m36
    c''16 e''16 g''16 e''16 c''16 b'16 c''16 b'16 |  % m37
    as'8 fs'8 g'8 fs'8 |                          % m38
    b'8 as'16 cs''16 e''8 d''16 cs''16 |          % m39
    d''8 b'32 cs''32 d''32 e''32 fs''8 d''16 fs''16 | % m40
    b''8 fs''8 e''16 d''16 cs''16 d''16 |          % m41
    b'4                                           % m42
  }
}

\score {
  \new Staff {
      \set Staff.midiInstrument = "flute"

    \melody
  }
  \layout { }
  \midi {
    \tempo 4 = 72
  }}


\score { \new Staff { \transpose b a \melody   }}
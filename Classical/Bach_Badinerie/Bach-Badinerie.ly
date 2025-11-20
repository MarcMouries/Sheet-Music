\version "2.24.4"

\header {
  title    = "Badinerie"
  subtitle = "from Orchestral Suite No. 2 in B minor, BWV 1067"
  composer = "Johann Sebastian Bach"
  tagline  = ""
}

melody = {
  \clef treble
  \key b \minor
  \time 2/4
  \tempo "Vivace" 4 = 156
\repeat volta 2 {
  \partial 4
  b''8 d'''16 b''16 |
  fis''8 b''16 fis''16 d''8 fis''16 d''16 |
  b'4 fis'16 b'16 d''16 b'16 |
  cis''16 b'16 cis''16 b'16 ais'16 cis''16 e''16 cis''16 |
  d''8 b'8 b''8 d'''16 b''16 |
  \break
  fis''8 b''16 fis''16 d''8 fis''16 d''16 |
  b'4 d''8^. d''8^. |
  d''8^. d''8^. b''8 d''8 |
  d''8\trill cis''8 fis''8 fis''8 |
  fis''8 fis''8 d'''8 fis''8 |
  
  fis''8\trill eis''8 cis''16 fis''16 a''16 fis''16 |
  
  gis''16 fis''16 gis''16 fis''16 eis''16 gis''16 b''16 gis''16 |
  \break
  a''16 gis''16 a''16 gis''16 fis''16 a''16 fis''( f'' 
  fis'') b''16 fis''( f'' fis'') cis'''16 fis''( f'' 
  fis'')
  d'''16 fis''( f'' fis'') d'''16 cis'''16 b''16 |
  
  cis'''16 a''16 gis''16 fis''16 a''8 gis''8\trill |
  fis''4
}
\break
  % ===== SECOND SECTION =====
  \repeat volta 2 {
    fis''8 a''16 fis''16 |                           % m18
    cis''8 fis''16 cis''16 a'8 cis''16 a'16 |        % m19
    fis'4 c''8 b'8 |                                 % m20
    e''8 dis''16 fis''16 a''8 g''16 fis''16 |        % m21
    g''8 e''8 g''8 b''16 g''16 |                     % m22
    e''8 g''16 e''16 cis''8 e''16 cis''16 |          % m23
    a'4 a'16 d''16 fis''16 d''16 |                   % m24
    e''16 d''16 e''16 d''16 cis''16 e''16 g''16 e''16 | % m25
    fis''16 e''16 fis''16 e''16 d''16 fis''16 d''16 cis''16 | % m26
    d''16 g''16 d''16 cis''16 d''16 a''16 d''16 cis''16 |     % m27
    d''16 b''16 d''16 cis''16 d''16 b''16 a''16 g''16 |       % m28
    a''16 fis''16 e''16 d''16 fis''8 e''8 |          % m29
    d''4 fis''8 fis''8 |                             % m30
    fis''8 fis''8 d'''8 fis''8 |                     % m31
    fis''8 e''8 e''8 e''8 |                          % m32
    e''8 e''8 cis'''8 e''8 |                         % m33
    e''8 d''8 b''8 d'''16 b''16 |                    % m34
    g''4 g''8 b''32 a''32 g''32 fis''32 |            % m35
    e''4 e''8 g''32 fis''32 e''32 d''32 |            % m36
    c''16 e''16 g''16 e''16 c''16 b'16 c''16 b'16 |  % m37
    ais'8 fis'8 g'8 fis'8 |                          % m38
    b'8 ais'16 cis''16 e''8 d''16 cis''16 |          % m39
    d''8 b'32 cis''32 d''32 e''32 fis''8 d''16 fis''16 | % m40
    b''8 fis''8 e''16 d''16 cis''16 d''16 |          % m41
    b'4                                           % m42
  }
}

\score {
  \new Staff {
    \melody
  }
  \layout { }
    \midi {
    \tempo 4 = 156
  }
}

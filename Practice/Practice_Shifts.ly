\language "english"



%=============================================
% Shift in Third Position
%=============================================
\tocItem \markup "Shift in Third Position"
\markup \bold "Shift in Third Position"
shift_ThirdPosition = \relative c'' {
  \tempo 4 = 40 - 60
  \repeat volta 10 {
    b4   \glissando d   d  \glissando b
    cs4  \glissando e   e  \glissando cs
    d4   \glissando fs  fs \glissando d
    e4   \glissando g   g  \glissando e
    \break
  }
}
\score {    \new Staff { \shift_ThirdPosition }
    \layout { ragged-right = ##f  indent = 0\cm }
}





\tocItem \markup "Shift in Fourth"
\markup \bold "Shift in Fourth"
shift_Fourth = \relative c' {
  \time 2/4
  \slurUp
  \phrasingSlurDown
   e4-1( \( \grace g8) a4-2 \)
   a4-2( \( \grace f8) e4-1 \)
   f4-2( \( \grace a8) b4-3 \)
   b4-3( \( \grace g8) f4-2 \)
   g4-3( \( \grace b8) c4-4 \)
   c4-4( \( \grace a8) g4-3 \)
}
\score {    \new Staff { \shift_Fourth }
    \layout { ragged-right = ##f  indent = 0\cm }
}

%=============================================
% SHIFT : Mel Bonis
%=============================================
\tocItem \markup "Shift in Second Position (Mel Bonis)"
\markup \bold "Shift in Second Position (Mel Bonis)"
SHIFT_Mel_Bonis = \relative c'' {
 \repeat volta 2 { b8 a b a g fs g fs }
 \repeat volta 2 {e8( fs) g( a) b( c) b( c) b c b c b a g fs}
 \tuplet 3/2 { c'8( b a)} \tuplet 3/2 { g8( fs e)}
}
\markup { \writeMusic ##{ \SHIFT_Mel_Bonis #} }
          
\score {    \new Staff { \SHIFT_Mel_Bonis }
    \layout { ragged-right = ##f  indent = 0\cm }
}

          
          

%=============================================
% Shift from 1 to 5th Position
%=============================================
\tocItem \markup "Shift from 1 to 5th Position"
\markup \bold "Shift from 1 to 5th Position"
shift_OneToFifthPosition = \relative c'' {
  \tempo 4 = 40 - 60
  \repeat volta 10 {
    g4.  fs8 e  fs g4
    a4.  g 8 fs g  a4
    b4.  a 8 g  a  b4
    c4.  b 8 a g   c4
  }
}
%\markup { \writeMusic ##{ \shift_OneToFifthPosition #} }
\score {    \new Staff { \shift_OneToFifthPosition }
    \layout { indent = 0\cm }
}

%=============================================
% Shift from 2 to 5th Position
%=============================================
\tocItem \markup "Shift from 2nd to 5th Position"
\markup \bold "Shift from 2nd to 5th Position"
shift_TwoToFifthPosition = \relative c' {
  \tempo 4 = 40 - 60
  \repeat volta 10 {
    f-1 g a bf-1 c d
  }
}
\markup { \writeMusic ##{ \shift_TwoToFifthPosition #} }

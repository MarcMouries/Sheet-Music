%\include "../../common/violin-functions.ly"
\include "..\common\violin-functions.ly"
\language "english"
#(set-global-staff-size 18	)
%\paper {    indent = 0\cm} 

%\version "2.14.0"
\header {
  title = "Canon Rock"
  % subtitle = "Subtitle"
  composer = "J. Pachelbel (1653-1706)"
  instrument = "Violin I"
  % copyright = "Copyright"
  tagline = ""
}

\score {
  \relative c' {
    #(set-accidental-style 'modern-cautionary)
    \clef treble
    \key d\major
    \override Score.MetronomeMark #'padding = #3
    \tempo 4 = 95
    %\compressFullBarRests
\new CueVoice {
    \stemUp d'2^"Cello"  a b fs  g d g a 
  }
\new CueVoice {
    \stemUp fs'2^"Tutti"  e  d   cs b a
 b cs
  }
\break
  | fs2-3^"Solo"  e  d   cs % 3
  | b  a  b2  cs4 d8 e8 
  |  
<<
    { fs2 e8  fs16( g fs8) e8}
    \new Staff 
        \with {
		   \remove "Time_signature_engraver"
 			\override Clef #'stencil = ##f
		    \override KeySignature #'stencil = ##f
		    \override TimeSignature #'stencil = ##f
           firstClef = ##f   % remove the part of the staff to support the Clef
		   fontSize = #-2
		   \override StaffSymbol #'staff-space = #(magstep -2)  
	     }
      { 
        \key d\major
        fs2 e8 g  \tri {fs16( g fs)} e8 
      }
>>
\break
  | d4. e16 d cs8-\shift -2( fs) a b 
% 15
  | g8\ub \tri{fs16([ g fs)]}  e8 g fs e \tri{d16([ e d)]} a8
  | b8 a g d' cs2\trill
% 17 - PART B
  | d8-.\db d,16 d  g'16( fs) d,-> d a'8 a,16 a  e''( fs) a,,-> a
  | b'8-\shift -4 b,16 b  e'16-3 b, fs'' b,,  fs'8-.-\shift -2 a,16 a   e'16 a, fs' a,
  | g'8 g,16 g  g  b'~b cs d8-. d,16 d  b''16( a) g fs
  | g,8-. g,16 g  b'16 cs d cs  a8-. a,16 a  e''16 fs g fs
% REPEAT
  | d8-.\db d,16 d  g'16( fs) d,-> d a'8 a,16 a  e''( fs) a,,-> a
  | b'8-\shift -4 b,16 b  e'16-3 b, fs'' b,,  fs'8-.-\shift -2 a,16 a   e'16 a, fs' a,
  | g'8-. g,16 g  g  b'~b cs d8 d,16 d  b''16( a) g fs
% 24
  | g,8-. g,16 g  b'16 cs d cs  a4-\shift -2   e'16-\shift -1 fs e fs
    \glissando fs'2-\shift -4 e4. \glissando e,8 
    \glissando d'4-\shift -3 d16 e8 d16 cs4 a8-\shift -1 d,8
  | b'4 b16 a8 g16   a8( d)  fs,4-3
% 28
  | b4   b16  a8 g16   cs4. d16-\shift -1 e 
  | fs4\db  fs16( g8 fs16)  e4. \glissando e,8
    \glissando d'4-\shift -2 d16[ e8 d16] cs8-1 fs-\shift-1 a4 
  | b8 a g b  a g fs a 
% 32
  | b8 a g b^\markup { \circle \finger 3 }  cs4. r8
  | d,,8-\shift-3\db  cs d fs, a4-4  b8( cs) 
  | d cs d fs  a2 \mordent
  | g8 fs e g  fs16 e d b a4-4
% 36
  | b8 a  g d' cs8 a16 e d16 cs a8 
  | d'8-3 cs d fs,   a4-\shift-2  b8( cs)
  | d16-1 fs-\shift-1 b d  fs16 d b fs b4-\shift-2  \acciaccatura { a16[ b16] } a4
  | g8 \tri{fs16([ g fs)]}  e8 g  fs8 a-1  d-\shift-1 fs-3
% 40 
  | g16 fs e d   cs16-\shift-3 b a g   cs16 b a g    fs16 e a,8
  | \sext{ a,  16[ (cs e  a cs e ) ]}
    \sext{ a   16[ (e  cs a e  cs) ]} 
    \times 4/6 { cs''16-4[ (a  e)  a-\shift-3( e  cs )]}  
    \tri{ e,  16[ (cs a~) ]} a8  
 | a''8-3\mf [ fs16 g]  a8 [fs16 g] a-. [a,b cs ] d  [ e fs g ]  
      fs8\ub [d16-\shift-2 e ]  fs8-.[fs,16-1  g ]  a  [ b a  g ]  a  [ fs g  a ]    
 | g8 [ b16 a ]  g8  [fs16-\shift-2 e] fs [e  d  e ] fs [ g-\shift-2 a  b ]  g8[b16 a  ]  b8  [cs16  d ]  a  [ b cs d ]  e [ fs g  a]   % 20
   | fs8   [ d16-\shift-2 e ]   fs8  [e16 d] e  [cs d  e ] fs [ e d  cs]  
   
   | d8[b16 cs]  d8-.[d, 16  e ]  fs[ g fs e ]  fs [ d' cs d ]      
% 48
 |   b8    [ d16 cs]   b 8  [a16 g] a  [g  fs g ] a  [ b cs d ]
     b8[d16 cs]  d8  [cs 16  b ]  cs[ d e  d ]  cs [ d  b  cs]   
  %%%% SAME AS PART B
  | d8-.\db d,16 d  g'16( fs) d,-> d a'8 a,16 a  e''( fs) a,,-> a
  | b'8-\shift -4 b,16 b  e'16-3 b, fs'' b,,  fs'8-.-\shift -2 a,16 a   e'16 a, fs' a,
% 53  
  | g'8 g,16 g  g  b'~b cs d8-. d,16 d  b''16( a) g fs
  | g,8 g,16 g  b'16 cs d cs  
	\times 4/6{ e16-0( fs  gs  a-\shift-1  b cs) }  
	\times 4/6{ a16  ( b   cs  cs-\shift-1 d e ) } 
  | fs2 e4. \glissando e,8 \glissando 
  | d'4-\shift-3 d16 e8 d16 cs4 a8-\shift-1( d,8)
% 55  
  | b'4 b16 a8 g16   a8( d)  fs,4-3
  | \sext{ g 16 g  g   b b b}       \sext{ cs16-\shift-1 cs cs  d d d} 
% Subdividing beams
  \set subdivideBeams = ##t
 % Set beam sub-group length to an eighth note
  \set baseMoment = #(ly:make-moment 1 8)
  \set beatStructure = #'(2 2 2 2)
    cs32 d e-\shift-1 fs   g32 a g fs   e32 d cs a  b32 cs d e
  \set subdivideBeams = ##f
  | fs4. a8 e4. d16-\shift-2 cs 
% 59
  | d4 d16 e8 d16 cs8 fs-\shift-1  a4-3
% 60
  | b8-4 a-3 g-2 b-\shift-2 a-1 cs-3 d8-4 r8
  | \sext{ b,16 -\shift-4 g d  b  d  g}   
    \sext{ b 16 g d  b  d  g}
    \sext{ cs16 -\shift-4 a e  cs e  a}  
    \sext{ cs16 a e  cs a  e}
  | d' 16  d cs cs      d,16  d fs g     a 16  b a  g    a 16  b cs a 
  | d  16  b cs b       d 16  b fs' b,   a'8. cs,16  d16 e fs  a
  | b  16  b, a' b,     g'16  b, b' b,   a'8 \tri { d,16-\shift-1 fs a } d4
% 65
  | \sext{ d 16 b  g  d  g  b }       \sext{ d 16 b  g  d  g-\shift-3  d'-3 }
    \sext{ e 16 cs a  e-1  a  cs}     \sext{ e 16 cs a-4  e-0  cs-\shift-2 a-0 }
  | d  16  d cs cs      d,16  d fs g     a 16  b a  g    a 16  b cs a 
  | d  16  b cs b       d 16  b fs' b,     a'2\mordent
  | b  16  b, a' b,     g'16  b, b' b,   a'4 \sext { d16 a fs  d fs a }
  | \sext { g'16 d b g b d } \sext { g16 d b g b d }
    \sext { a'16 e cs a cs e } cs'4
% 70 - SAME AS # 42 - 48

  |  

}
}
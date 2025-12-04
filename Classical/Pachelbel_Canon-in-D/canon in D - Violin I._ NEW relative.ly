\include "../../common/violin-functions.ly"
\language "english"
%S#(set-global-staff-size 21	)



\version "2.14.0"
\header {
  title = "Canon"
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
    \tempo "Sostenuto" 4 = 50
    \compressFullBarRests
 | R1*2   % 1 & 2
 | fs'4-3\p  e  d   cs     % 3
 | b   a     b  cs         % 4
 | d   cs    b  a          % 5
 | g4  fs-\shift-2  g  e          % 6
 | d8 ( [ fs) ]  a([ g )]  fs ( [ d ) ] fs ( [ e )]  % 7
 | d8 ( [ b ) ]  d([ a'-\shift-2)]  g  ( [ b ) ] a  ( [ g )]  % 8
 | fs8-\shift-2 ([ d ) ]  e ( [ cs') ]   d ( \<  [fs )]  a ([a,)]         % 9
 | b8   ([g) ]  a ( [ fs ) ]  d ([ d' )]  d8.\trill ([cs16)]     % 10
 | d16\! \mf  cs d d,  cs16 a'-4 e fs  d16 d' cs b  cs16 fs a b    % 11
 | g16   fs e g  fs16 e d cs  b16  a  g  fs  e16  g  fs  e       % 12
 | d16\mp e  fs g   a16 e  a  g   fs16 b-\shift-3 a g   a16 g fs-\shift-2 e        % 13
 | d16   b  b'  cs  d16 cs b  a   g16 fs e b'-\shift-3  a16 b a  g        % 14
 | fs8-1 fs'8-3-.\mf  e4 r8  d8-.\db fs4                                % 15
 | b4 a4 b4 cs4                                    % 16
 | d8-. [  d,8-. ]  cs4-\shift-2 r8  b8-.\mp  d4   % 17
 | d4. d8 d8 [ g8 ]  e8 [a8 ]                      % 18
 | a16\mf ([ fs32 g)]  a 16 ([fs32 g)] a-. [a,(b cs ] d  [ e fs g )]  
   fs16\ub ([d32-\shift-2 e) ]  fs16-.[fs,32-1 ( g) ]  a  ([ b a  g ]  a  [ fs g  a )]      % 19
 | g16 ([ b32 a ]  g16  [fs32-\shift-2 e)] fs ([e  d  e ] fs [ g-\shift-2 a  b )]  g 16([b32 a  ]  b 16  [cs 32  d) ]  a  ([ b cs d ]  e  [ fs g  a )]      % 20
 | fs16   ([ d32 e ]   fs16  [e 32 d)] e  ([cs d  e ] fs [ e d  cs)]  d 16([b32 cs)]  d 16-.[d, 32( e) ]  fs ([ g fs e ]  fs [ d' cs d )]      % 21
 | b16    ([ d32 cs]   b 16  [a 32 g)] a  ([g  fs g ] a  [ b cs d )]  b 16([d32 cs ]  d 16  [cs 32  b) ]  cs ([ d e  d ]  cs [ d  b  cs)]    % 22
 | d8-.\mp  r8  cs8-. r8  b8-. r8  d8-. r8      % 23
 | d,8-. r8  d8-. r8   d8-. r8  e8-. r8         % 24
 | r8    a8-.\p   r8   a8-. r8  fs8-. r8  a8-.  % 25
 | r8    g8-. r8  fs8-. r8  g8-. r8  e'8-.      % 26
 | fs16\mf [ fs, g fs]  e [ e'  fs e  ]  d [ fs, d b']  a [ a,  g  a  ]    % 27
 | b16  [ b'   cs  b ]  a [ a,  g  a  ]  b [ b' a  b ]  cs[ cs, b  cs ]    % 28
 | d16  [ d'   e   d ]  cs[ cs, d  cs ]  b [ b' a  b ]  cs[ cs, fs e  ]    % 29
 | d16  [ d'   e   g ]  fs[ fs, a  fs']  d [ g  fs g ]  e [ a,  g  a  ]    % 30
 | fs16 [ a\mp a   a ]  a [ a   a  a  ]  fs[ fs fs fs]  fs[ fs  a  a  ]    % 31
 | g16  [ g    g   d']  d [ d   d  d  ]  d [ d  b  b ]  a [ a   e' cs ]    % 32
 | a16  [ fs'  fs  fs]  e [ e   e  e  ]  d [ d  d  d ]  a'[ a   a  a  ]    % 33
 | b16  [ b    b   b ]  a [ a   a  a  ]  b [ b  b  b ]  cs[ cs, cs cs ]    % 34
 | d16  [ d ,32( e  fs16) d-.  ]  
   cs16 [ cs'32( d  e 16) cs-. ]  
   b 16 [ b ,32( cs d 16) b-.  ]  
   cs16 [ a '32( g  fs16) e-.  ]      % 35
 | d16  [ g  32( fs e 16) g-.  ]
   fs16 [ d  32( e  fs16) a-.  ] 
   g    [ b  32( a  g 16) fs-. ]
   e16  [ a  32( g  fs16) e-.  ]      % 36
 | fs16 [ d' 32( cs d 16) fs,-.]
   a16  [ a  32( b  cs16) a-.  ]  
   fs16 [ d' 32( e  fs16) d-.  ]  
   fs16 [ fs 32( e  d 16) cs-. ]      % 37
 | b16  [ b  32( a  b 16) cs-. ]
   d16  [ fs 32( e  d 16) fs-. ]      
   g16  [ d  32( cs b 16) b-.  ]      
   a16  [ e a a]                       % 38
 | a 4. a8 d,4. a'8                    % 39
 | g 4  a4 g8 [ d8 ]  d8. [ cs16 ]     % 40
 | d 8  [ d'8\f  ]  cs4 b4 a4          % 41
 | d,8. [ e  16 ]  fs4 b4 e,8.[ e16 ]  % 42
 | fs8. [ fs'16 ]  fs( [  g)  fs( e)]  d8.[ d16] d([ e)  d( cs) ]     % 43
 | b 4  d4 d16 ( [ c16 )  b16 (  c16 )  ]  a8. [  a16 ]               % 44
 | a8. [ a'16 ] a( [ b) a( g ) ]   fs8.[ fs16 ] fs ( [ g ) fs( e ) ]  % 45
 | d16( [ c16 ) b16( c16 ) ] a8.[ a16 ] g8[ d'8 ]  cs8. [ cs16 ]      % 46
 | d8  d4 cs4 b4 a8 ~                              % 47
 | a8  g4 fs8 ~ fs8. [  e16 ]  e4                  % 48
 | fs8 fs'4 e8  d8 \<  d'4 c8                      % 49
 | b4  d8( [ a8 ) ]  b4 a4                         % 50
 | a4\! \f  a,8.( [ g16 ) ]  fs4 fs'8.( [ e16 ) ]  % 51
 | d4. d8 d4 cs4                                   % 52
 | d8 [ d, ]  cs [ cs' ] b [ b, ] a8 [ a' ]        % 53
 | g8 [ g' ]  fs [ fs, ] e\< [ b' ]  e, [ e' ]     % 54
 | fs8\! \ff [ fs,]  e [ e']  d [ d,]  cs [ cs' ]  % 55
 | b8 [ b' ]  a8 [ a, ]  b8. [ e16 ]  a,8 [  a ]   % 56
 | a4\fermata  r4  r2  \bar "|."
 }
}
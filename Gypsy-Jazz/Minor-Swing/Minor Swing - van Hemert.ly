\version "2.24.0"
\language "english"
\include "../../common/includes.ly"
\include "../../common/improviso.ily"


date = #(strftime "%B, %d %Y" (localtime (current-time)))

\header {
  title = "Minor Swing"
  subtitle = "Christiaan van Hemert"
  composer = "Django Reinhardt & Stéphane Grappelli"
  country = "France"
    video = ""
    style = "gypsy jazz"     % Remove default LilyPond tagline
  poet =  "Transcribed by Marc & Maxence Mouries"
  % tagline = \markup
  % \column {
  %   {
  %     "(cc)(by)(sa) me Rights Reserved."
  %    \with-url "https://www.youtube.com/watch?v=mNejZlpOpAU"
  %    { "Youtube Video Gypsy Jazz Violin Lessons - Minor Swing" }

\include "../../common/common-header.ily"}
  % {
  %   \line {  $(format "Typeset with LilyPond ~a. ," (lilypond-version)) \date  }
  % }
  %}
}

%\markup \vspace #1
%\markup \fill-line {
%   \override #'(line-width . 100)
%   \box \pad-markup #2
%     \justify-string "
%         Notes: Focus on how it sounds rather than how it's produced.
%         Start by playing everything super legato with no accents and
% 	straight, then if that feels comfortable add a little swing.
% 	Don't worry to much about accents. Legato with light swing
% 	produces the right sound all by itself."
% }

#(set-global-staff-size 21)


\paper {
  #(set-paper-size "letter")
}


global = {
  \key a \minor
  \time 4/4
  \tempo 4=200
}
chordNames = \chordmode {
  \global

  % INTRO
  a1:m d1:m    e1:7 e1:7
  a1:m d1:m     e1:7 e1:7


  % SOLO
  \repeat unfold 2 {
    a1:m a1:m   d1:m d1:m
    e1:7 e1:7   a1:m a1:m
    d1:m d1:m   a1:m a1:m
    e1:7 bf1:7  a1:m e1:7
  }
}

minorSwingTheme = {
  a,4  c e r8 f16( e) d4 f8  gs16 \glissando a16 ~ a4 r4
}


voltaAdLib = \markup {"x"\small\italic { "3" } }

melody = \relative c'' {
  \global
  \mark "Intro"
  \set Score.repeatCommands = #(list (list 'volta voltaAdLib) 'start-repeat)
  \minorSwingTheme
  \set Score.repeatCommands = #'((volta #f) (volta "4.") end-repeat)
  \set Score.repeatCommands = #'((volta #f))
  r1
  r1
  \set Score.repeatCommands = #(list (list 'volta voltaAdLib) 'start-repeat)
  \minorSwingTheme
  \set Score.repeatCommands = #'((volta #f) (volta "4.") end-repeat)
  \set Score.repeatCommands = #'((volta #f))
  r1

  r8  b,->\downbow (  gs)  b->  d e->(f) a(
  e) -> d  c  b->(  a)  b->(c) d
  e   gs  b  d( \tuplet 3/2 { c d c} a) e(
  g) -> e  f  c-> cs  e->( d ) a(
  c) a b4 b2

  %  2nd
  r8 g -> (    a)  b-> ( gs) b ->  d    e(
  f -> ) gs b  d->  f  a -> ( gs! ) b(
  a -> )e  c  a-> ( d ) c -> ( b   ) c(
  a8)
  \hideNotes
  \grace { c,16\glissando }
  \unHideNotes
  e8 ~ e4

  % Part  3

  bf'8\upbow( b d) b(
  c) g gs b( a) e( g) e
  f4 e'8\upbow cs( d4) gs8-3( \glissando a ~
  a)a( gs) a( e)ef( f)g16(f
  e8)c( b) d c4\downbow \tuplet 3/2 {d8( c b}
  bf) gs(f) d( b) a( gs)b
  | d e( f) g( e) f16( e  d8) c(
  | b) c16( b a8)b( c) d e gs
  | b^"1:21" d( c) e,8 ~ e4 bf'4\upbow (
  b!8)  d8( c)a e4 bf'(
  b!8) d8( c) a  e4
  {c'8(d16 c} a8)



  f4\downbow f8\downbow \tuplet 3/2 {c'8(d c)} a8 f ~
  f4 c'4( a8) f4 d'8~  \tuplet 3/2 {d8\upbow(  ef d} b) gs(
  f) gs! b d f\db a( gs) a b( a gs!) b\db( a) e c
  a( d) c( b) c a b c d( e) g bf gs( a) cs4
  d8( a4 ) gs( \glissando g) f d f
  ds'8( \glissando e8 \glissando ds) c a e
  b'( \glissando c)
  \tuplet 3/2 {a( bf a)} e  ds( d) c( a)f( e)
  g f g16( f d8) bf4 a8
  ( af) b d e f g
  e( d) c b a4 a2
  r8 e'4  f16 gs b8 d f g16( f)
  e8 c b d c d16( c  \tuplet 3/2 {b8) c b}
  a b c e b' gs b gs
  a f d b g f d c
  b4 g''8( \glissando b2)
  a8( gs) b gs f e ds( \glissando d) cs c b gs f d b c b
  a b c d e gs b d( \tuplet 3/2
  {c d c} a8) ef4( e8) g e
  f g16( f \tuplet 3/2 {e8 f e} d8) e f a
  c e g2( e16) g8 bf16( \glissando
  b8) a e c b a d b
  c8( a) e d'4 c8 bf gs
  f d b a  gs b d e
  f g e f16( e d8) c b c16( b
  a8) b c d e4 e( e)
  ef8(\glissando e) a b c4
  ef,( e8) a b c4 e,8
  f a b4 c f,(
  f8) a b c4 f, e8
  ( \glissando ef) fs a b c a \tuplet 3/2 {fs( e ef)}
  d e f gs b d b( d)
  \tuplet 3/2 {c d( c)} a f e4 r
  c'4. bf8 c bf( a)g
  ( e4) e'8 cs( d) g( e) f
  bf e, gs( a) a4 gs8( \glissando a4) a8 gs a( e) ds f
  g16( f e8) c( b) d( c) a f g16( f
  d8) c b a( \glissando af) b d e(
  f) g e d c b a b(
  c) d e gs( b) d( c4)
  e,2( e16 f e d) c8( b)
  a4 c e2
  a,4 c8 e4 e4 f16( e
  d4) f a2
  d,4 f8 a4 a4 d,8
  e4 gs b \tuplet 3/2 {c8( b a)}
  e4 gs8 b4. c4
  a4 r2.
  r1
  e4.( f8 e d c b)
  a4 c e2
  gs,8(\glissando a) c e4 e( f16 e)
  d4 f a2
  d,4 f8 a4 a d,16( ef)
  e4 gs b2
  e,4 gs8 b4 c4.
  r8 e ds e f fs g gs
  a4 e8\harmonic a4\harmonic r4. \bar"||"
}

\include "../../common/score.ly"

\version "2.19.15"
\language "english"
\include "../../common/violin-functions.ly"
\include "../../common/markups.ly"


\score {
  \new Staff {
  \relative c'{

    \repeat volta 2 {
    g8 c-3 ef
    g8 c ef
    g8 c-3 ef-4
    c-3 g ef
    c g ef
    c
    }
    \repeat volta 2 {
    c-3 d-4 ef g af g ef d

    }
    \repeat volta 2 {
    c'-2 d ef g af g ef d
    }
    \break


    \repeat volta 2 {

    f,2-2^\markup "f -c : Presto, In the mood for Love"  c2-1
    }
    \repeat volta 2 {
     bf8^"" ef f g bf c ef f
     g    f
    }
    \repeat volta 2 {
     g,,8^"" c d e g a c d e
    }

    g,, 8 a bf d f
    g  a bf d f
    g  a bf  a
    g f d  bf a
    g f d  bf a
  }
  }
}
\score {
      \new Staff {
     \relative  bf {
  \time 6/8
%g8 bf
%c8 d
bf8 d ef8  f  g bf
c8 d ef  f  g bf
c8 d ef

d c bf  g f ef
d c bf  g f ef
d c bf
}

      }
  \layout {indent=0}
}

\header {
  title = "In the Mood for Love"
  subtitle = "Yumeji's Theme"
  composer = "Shigeru Umebayashi"
  country = "Japan"
  style = "soundtrack"
}

\include "../../common/common-header.ily"

%#(set-global-staff-size 20)
\paper {
  %paper-width = 21.59\cm
  %paper-height = 35.56\cm
  top-margin = 1.0\cm
  bottom-margin = 2.0\cm
  left-margin = 1.0\cm
  right-margin = 1.0\cm
}
\layout {
  \context {
    \Score
   % skipBars = ##t
    %autoBeaming = ##f
  }
}

cueNotes = \relative c' {
  c4 ef' g    c,,4 ef' g
  c,,4 f' af  c,,4 f' af

}

melody =  \relative c'' {
  \clef "treble" \key ef \major
  \time 3/4
% Rest measures contracted to single measure
\compressFullBarRests
  \repeat volta 2 {


  \new CueVoice { \set instrumentCueName = "cue" }
  \cueDuring #"flute" #UP { R2. R2.R2. R2. }
  }
  \break
  \repeat volta 2 {

  bf2.-3\downbow ~  bf4 af g    af2. ~ af2  r4
  \stemNeutral
  af2.-3 (  af4 ) g4. f8  g2.  ~ g2 r4
\break


\acciaccatura f8 ef2.-3
  r2. \acciaccatura f8 ( ef2. ~ )
  ef4 d c
  d2. ~   d2.  r2. r4 r4 g,4
\break
  g'4. f8 ef [ d ~ ]
  d2.  d2.

  r4 r af'4 ~ af8 ( g8)
   g2 ~ g4 r4 r

}
\alternative {
 { g,4\downbow   d'   f    g2.-3}
 {r2.  r2.}
}
\break
  r4 ef( g)  c4 d ef  ef2 c4\upbow
  \acciaccatura af8 g2.

  r4 ef-3\upbow d  ef4 g c  c2 c,4  c2.

\break
  r4 a8 \upbow( [ bf) ] c4 c4 ef c'  c4 d4.-\shiftUp"1"( ef8) ef2.
  ~ ef4 ef \acciaccatura ef8 d4 \glissando
  c2^\shiftUp"2" g'4 ~ g8[ af  ] \acciaccatura af g  ( [ f )  ] ef4
  c4  g2
\break
  r4 d'8-.\downbow[ ef-.] \acciaccatura ef d( c )
  g'4 ef8 d  d(  c )
  c8 ( [ g ) ] g ( [ ef ) ] ef( [ d) ]
  d8(  c)  c2 ~

  c8 \glissSize #3 g8\upbow g8 d' ef g

  d'4-4\flageolet  c b8-1( c )

  \tuplet 3/2 {ef4\upbow  g4 c4 ~ } c4~
  \break

  c4. c8 ~ c b16(c)

  \tuplet 3/2 {c4\downbow c, c } c4 ~

  c8 \noBeam a'8 ~ a4.  a8
  \tuplet 3/2 {a4\downbow c,4 c}   c4

  g'8[  af!] \acciaccatura af g  f  ef[  f ]
\tuplet 3/2 {g4 c,  c   }
  c8 g
  g[  \acciaccatura g8 f]  ef4 f4
  g4 c, c ~   c2.
\break
  r4 g8 \downbow c_1  ef4 g c c c2( f,4)  f2.
  g4.-3( af8) \acciaccatura af g[(  f])
     g4 f g  af2 c,4 ~   c4 c2-1
\break
  bf'2.-3\upbow  af2 g4  af2( f4-2)  c2-1 d4
  ef4 g,8 ef'4. g2 f8 ([ ef )]  f2.  c2.
  \bar "|."
}

\addQuote "flute" { \cueNotes }


% The score definition

\score {
  \new Staff { \melody }
  \layout {indent=0}
  \midi {}
}
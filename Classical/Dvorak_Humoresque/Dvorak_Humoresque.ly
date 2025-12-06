%\version "2.14.0"
\include "english.ly"
\include "../../common/violin-functions.ly"


% english.ly     c   d   e   f   g   a   b   -s/-sharp   -f/-flat

#(set-global-staff-size 20)

\paper{
  % obsolete-between-system-space = 30\mm  system-system-spacing #'basic-distance = #(/ obsolete-between-system-space staff-space)  score-system-spacing #'basic-distance = #(/ obsolete-between-system-space staff-space)  %Default is 20mm
  %paper-width = 2\cm
  % obsolete-after-title-space = 5\cm  markup-system-spacing #'basic-distance = #(/ obsolete-after-title-space staff-space) % Default is 5mm
  top-margin    = 2\cm   % Default is 5mm
  left-margin   = 5\mm
  right-margin  = 5\mm
  bottom-margin = 1.5\cm
  ragged-last-bottom = ##t
}



\header {
  title    = "Humoresque"
  subtitle = "(Opus 101, No 7 )"
  composer = "A. Dvorak (1841-1904)"
  tagline  = ""
  arrangerM = "Marc Mouries"
}

Common = {
  \clef violin
  \set Staff.midiInstrument = #"violin"
  \tempo "Poco lento e grazioso"
}

Violin =  \relative g' {
  \Common
  \key fs \major

  \repeat volta 2 {
    % 1
    fs64-1[\db \p r128 gs128\ub ( fs64) r128 gs128\ub](as64)[ r128 cs128\ub ( ds64) r128 cs128\db](
    | fs64-3)[ r128 es128\db (gs64-4) r128 fs128\ub](es64)[ r128 gs128-4\ub( fs64) r128 ds128\db](
    | cs64)[ r128 cs128\ub(ds64) r128 cs128\db]( fs64)[ r128 ds128\ub ( cs64) r128 as128\db](
    | gs8)(
    % 5
    \break
    | fs64)[\db  r128 gs128 ( fs64) r128 gs128]( as64)[ r128 cs128 ( ds64) r128 cs128](
    | fs64)[     r128 es128( gs64-4) r128 fs128]( es64)[ r128 gs128-4( fs64) r128 ds128](
    |  cs64)[    r128 cs128 ( fs64) r128 fs,128]( gs32) cs
    | fs,16. r32
  }
  % 9
  \break
  | as32-2\mf as'64.-3( gs128) gs32 fs32
  | fs32-3 es64.( ds128) ds32 \f cs32-4
  | cs32-2 b64 ds64 cs32 b
  | as64-2 gs fs16-4  fs64 gs
  \break
  %13
  | as32  as'64.-3( gs128) gs32 fs32
  | fs32-3 es64.( ds128) ds32 cs32-4
  | cs64-2 ( b) cs ds  as-2( gs) as \acciaccatura cs-4 b
  | as32 a16(  _\rit gs32)
  \break
  %17
  | fs64-2[\db ^\markup { \small "III" } \p r128 gs128 ( fs64) r128 gs128](
  as64-3)[ \db ^\markup { \small "IV" } r128 cs128 ( ds64) r128 cs128](
  | fs64)[ r128 es128( gs64-4) r128 fs128]( es64)[ r128 gs128-4( fs64) r128 ds128](
  | cs64)[ r128 cs128 ( ds64) r128 cs128]( fs64)[ r128 ds128 ( cs64) r128 as128](
  | gs8)(
  \break
  % 21
  | fs64-1)[\db  r128 gs128 ( fs64) r128 gs128]( as64)[ r128 cs128 ( ds64) r128 cs128](
  | fs64-3)[ r128 es128( gs64-4) r128 fs128]( es64)[ r128 gs128-4( fs64) r128 ^\markup { \small "III"} ds128-3 ](
  | cs64)[ r128 cs128 ( a'64) r128 cs,128]( bs64)[ r128 a'128 ( gs64) r128 ds128](
  | \acciaccatura cs32 fs8)
  \break
  %25
  | \key a \major
  fs,64-2\downbow \f ( gs) a gs  a32 gs64 fs64
  | e32 b cs64( e32.)
  | fs64-2\downbow( gs) a gs  a32 gs64 fs64
  | e32 cs' a16
  \break
  % 29
  fs64-2\downbow \f ( gs)  a gs  a32 gs64 fs64
  | e64( fs) d b cs64( e32.)
  | fs64-2\downbow( gs) a gs  a32 gs64 fs64
  | fs32 d' cs16
  \break
  % 33
  fs64-1\downbow( gs) a gs  a32 gs64 fs64
  | e64( gs128 fs128) e64 b64 cs128( fs128 e32.)
  | fs64 \downbow( gs) a gs  b( a) gs fs
  | e32 b' cs128( b a32.)
  \break
  % 37
  fs64\db( gs) a gs  a32 gs64 fs64
  | e64( gs128 fs128) e64 b64 cs128( fs128 e32.)
  | fs64 \db( gs) a gs  b( a) gs fs
  | fs32 e'64( _\rit d)  cs16 \fermata
  \break
  % 41
  \key fs \major

  | fs,,64-2[\db ^\markup { \small "III" } \p r128 gs128 ( fs64) r128 gs128](
  as64-3)[ \db ^\markup { \small "IV" } r128 cs128 ( ds64) r128 cs128](
  | fs64)[ r128 es128( gs64-4) r128 fs128]( es64)[ r128 gs128-4( fs64) r128 ds128](
  | cs64)[ r128 cs128 ( ds64) r128 cs128]( fs64)[ r128 ds128 ( cs64) r128 as128](
  | gs8)(
  \break
  % 45
  | fs64-1)[\downbow  r128 gs128 ( fs64) r128 gs128]( as64)[ r128 cs128 ( ds64) r128 cs128](
  | fs64-3)[ r128 es128( gs64-4) r128 fs128]( es64)[ r128 gs128-4( fs64) r128 ^\markup { \small "III"} ds128-3 ](
  | cs64)[ r128 cs128 ( a'64) r128 cs,128]( bs64)[ r128 a'128 ( gs64) r128 ds128](
  | \acciaccatura cs32 fs8)
  \break
  % 49
  \break
  | as,32-2\mf as'64.-3( gs128) gs32 fs32
  | fs32-3 es64.( ds128) ds32 \f cs32-4
  | cs32-2 b64 ds64 cs32 b
  | as64-2 gs fs16-4  fs64 gs
  \break
  % 53
  | as32  as'64.-3( gs128) gs32 fs32
  | fs32-3 es64.( ds128) ds32 cs32-4
  | cs64-2 ( b) cs ds  as-2( _\rit gs) as \acciaccatura cs-4 b
  | as32 cs \acciaccatura cs fs16-4 \pp \fermata
  \bar "||"
}

% The score definition

\score {
  %\new Staff { \time 2/4 \Violin  }
  \new Staff { \looksSlower {\time 4/4 \Violin  }}
  \layout {
    indent = 0\in
  }
  \midi {
  }
}
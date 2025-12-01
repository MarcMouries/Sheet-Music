\language "english"
\version "2.19.2"

%\paper{ ragged-right=##t }
#(set-global-staff-size 20)

\header {
	title = \markup { \concat { "Exercises in Thirds" \flat }

\include "../common/common-header.ily" }
}



\markup { "C Major Scale in Broken Thirds - One Octave" }

\score {
  \relative d' {
   \time 4/4
   \key c \major
   d8 fs
   e  g
   fs  a
   g  b
   a  cs
   b  d
   cs  e
   d  fs
   d  e
   cs  d
   b  cs
   a  b
   g  a
   fs  g
   e  fs
   d  e
   cs  d
  }
	\layout {    indent = 0\in
    }
}

\markup { "Scale in Thirds - One Octave" }

\score {
  \relative d' {
  \set Staff.midiInstrument = #"violin"
   \time 4/4
   \key c \major

   <c  e>
   <d  f>
   <e  g>
   <f  a>
   <g  b>
   <a  c>
   <b  d>
   <c  e>
   <b  d>
   <a  c>
   <g  b>
   <f  a>
   <e  g>
   <d  f>
   <c  e>
   <b  d>
  }
	\layout {    indent = 0\in
    }
}

\markup { "D Major Scale in Broken Thirds - Two Octave" }

\score {
  \relative d' {
  \set Staff.midiInstrument = #"violin"
   \time 4/4
   \key c \major

%{
   d16  f
   e  g
   f  a
   g  bf
   a  c
   bf  d
   c  e
  %}
   d16  f
   e  g
   f  a
   g  bf
   a  c
   bf  d
   c  e
   d  f
   e  g
   f  d
   e  c
   d  bf
   c  a
   bf  g
   a  f
   g  e
   f  d
   e  c
   d  bf
   c  a
   bf  g
   a  f
   g  e
   f  d
   e  c
  }
	\layout {    indent = 0\in
    }
}


\markup { "A Major Scale in Broken Thirds - Two Octave" }

\score {
  \relative d' {
  \set Staff.midiInstrument = #"violin"
   \time 4/4
   \key c \major

   a16  c
   b  d
   c  e
   d  f
   e  g
   f  a
   g  b
   a  c
   b  d
   c  e
   d  f
   e  g
   f  a
   g  b
   a  c
   b  d
   c  a
   b  g
   a  f
   g  e
   f  d
   e  c
   d  b
   c  a
   b  g
   a  f
   g  e
   f  d
   e  c
   d  b
   c  a
   b  g
  }
	\layout {    indent = 0\in
    }
}


 \markup {
	  \concat {
	    "B D F A" \small \flat
	" – Aka B diminished 7"} }

\markup { "B D F Ab – Aka B diminished 7" }

\score {
  \relative d' {
  \set Staff.midiInstrument = #"violin"
   \time 4/4
   \key c \major

   b d f af
   b d f af


  }
	\layout {    indent = 0\in
    }
    \midi {  }
}

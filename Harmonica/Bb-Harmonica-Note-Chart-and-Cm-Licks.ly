\version "2.24"

\language "english"

\header {
  title = "Bb Harmonica Note Chart and Cm Licks"
  composer = ""
  instrument = "Harmonica in Bb"
}



%C     D E G  A C
%4    -4 5 6 -6 7
\markup { \bold "Pentatonic Major" }
\markup {       "In C: 4th position, key of C" }
\score {
  \new Staff \relative c'' {
          \override TextScript.staff-padding = 0.0

    {
      c4_"4" d8_"-4" e^"5" g^"6" a^"-6" c^"7" a_"-6" ~ a^"-6"
    }
  }
}




\markup { \bold "Notes for Bb Harmonica" }
\score {

  \new Staff \relative c' {
      \override TextScript.staff-padding = 1.0

    {
      % Ascending Scale
      bf^"1" c^"-1" d^"2" f^"-2" f^"3" a^"-3" bf^"4" c^"-4" 
      d^"5" ef^"-5" f^"6" g^"-6" a^"-7" bf^"7" c^"-8" 
      % Descending Scale
      c^"-8" bf^"7" a^"-7" g^"-6" f^"6" ef^"-5" d^"5" 
      c^"-4" bf^"4" a^"-3" f^"3" f^"-2" d^"2" c^"-1" bf^"1"
    }
  }
}

\markup { \bold "Cm Pentatonic Scale (Ascending)" }
\score {
  \new Staff \relative c' {
      \override TextScript.staff-padding = 1.0
    {
      % Ascending scale
      c^"-4" ef^"-5" f^"6" g^"-6" bf^"7" c^"-8"
    }
  }
}

\markup { \bold "Cm Pentatonic Scale (Descending)" }
\score {
\new Staff \relative c' {
      \override TextScript.staff-padding = 1.0    {
      c'^"-8" bf^"7" g^"-6" f^"6" ef^"-5" c^"-4" bf^"4" c^"-4"
    }
  }
}

\markup { \bold "Cm Pentatonic Lick 1" }
\score {
\new Staff \relative c' {
      \override TextScript.staff-padding = 1.0    {
      \partial 4 c4^"-4" ef8^"-5" c^"-4" d^"5" bf^"4"
    }
  }
}

\markup { \bold "Cm Pentatonic Lick 2" }

\score {
  \new Staff \relative c' {
    {
      % Lick 2
      c^"-4" d^"5" ef^"-5" f^"6" ef^"-5" f^"6" g^"-6"
    }
  }
}




\markup { \bold "I'm a Man Riff" }
\markup {       "In C: 2nd position, key of G" }
\score {
  \new Staff \relative c'' {
    {
      r4 r4 r8 g^"-2" c^"4"[ bf^"-3"] g^"-2" r r4 r r
    }
  }
}
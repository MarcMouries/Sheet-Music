
\version "2.24"
\language "english"

\header {
  title = "Practice Arpeggios - Schubert Serenade"
  composer = "Marc Mouries"
  style = "practice exercise"
  tagline = ""
}

\markup \bold "Practice Arpegios - Schubert Serenade"
% String indication

\relative c' {
  \once \override TextSpanner.bound-details.left.text = \markup { "Sul D" }
  \once \override TextSpanner.style = #'dashed-line

  c-1 e g-1 \startTextSpan  c-1 e c g c e c g\stopTextSpan  e 
  d-2 f a d-1 f d a d f d a f

}


\markup \bold "Major 7th Arpegios Circle of Fifth"
\relative c'' {
g, 8  b  d   f   g   f   d   b
c8  e  g   bf  c   bf  g   e


}


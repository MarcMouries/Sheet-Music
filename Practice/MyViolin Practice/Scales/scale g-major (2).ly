\version "2.10"

% large staff
#(set-global-staff-size 27)

\header
{
  title = "Scale of G Major"
  %arranger =
  composer = "Marc Mouries"
  genre = "Exercise"
}

violin = \relative c''
{
  \time 4/4
  \key g \major

  g,4 a b c d e fis g a b c d e fis 
  g fis e d c b a g fis e d c b a g0
}

\score
{
  \context Staff = violin \violin
  \layout
  {
  }
}
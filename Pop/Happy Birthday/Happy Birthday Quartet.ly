\version "2.19.2"
\header {
  title = "Happy Birthday"
  composer = "Patty Hill and Mildred J. Hill (1893)"
  arranger = "arr. Benjamin Crowell"
  style = "traditional"
  tagline = "The melody to Happy Birthday (although possibly not the words) is public domain. This arrangement is (c) 2004 Benjamin Crowell, and is available for free copying under the Creative Commons Attribution-ShareAlike license, http://creativecommons.org/licenses/by-sa/1.0/."
}


  \score {
    
    \new StaffGroup << \new Staff {
        \key c\major
        \time 3/4
        \clef violin
        \relative c'' {
           \partial 4
           g8.-. g16 |
           g4 g g8.-. g16 | g4 g g8.-. g16 | g4 g g8.-. g16 | g2 g8. g16 |
           a4 g c | b2 g8. g16 | a4 g d' | c2 g8. g16 | g'4 e c | b a\fermata f'8. f16 | e4 c d | c2 \bar "||"
        }
      }
      \new Staff {
         \key c\major
         \clef violin
         \relative c' {
           \partial 4
           r4 |
           g4 g r | d' d r | e d r | r2. |
           e4 c f | f2 r4 | es4 d g | g2 r4 | e'4 c g | f f\fermata d'8. d16 | g,4 f g | g2 \bar "||"
         }
      }
      \new Staff {
         \key c\major
         \clef C
         \relative c {
           \partial 4
           r4 |
           e4 e r | b' b r | c b r | r2. |
           g4 c d | d2 r4 | c4 b b | c2 r4 | c'4 g e | f f\fermata a8. a16 | c,4 f f | e2 \bar "||"
         }
      }
      \new Staff {
         \key c\major
         \clef bass
         \relative c {
           \partial 4
           r4 |
           c c r | f f r | g g g8.-. g16 | g2 r4 | 
           c,4 e g | g2 r4 | fis4 g f | e2 r4 | c'4 c c | c c\fermata d8. d16 | g,4 a b | c,2 \bar "||"
         }
      }
    >>
    \layout {}
  }

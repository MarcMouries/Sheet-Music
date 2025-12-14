\version "2.24.4"
\language "english"

global = {
  \key d \minor
  \time 3/4
  \tempo 4 = 120
}

emmaMelody = \relative c' {
  \global

  % Pickup: EA c
  \partial 4. a8 d f |

  %==== A PART – played twice ====
  \repeat volta 2 {
    a4. bf8 a4 |
    f4 d8 a d f |
    a4. bf8 a g |
    f4 d8 e f d |
\break
    % Bar 5 – "Dm" B3^A Bc (simplified to natural A)
    e4. ds8 e f |
    % Bar 6 – "E7" dE cE B2
    g8 a, f' a, e'4 |
    % Bar 7 – "Am" A3 B cd
    d4. e8 d cs |
    % Bar 8 – "E7" eE Ac ef

  \alternative {
    {
      % 1st ending – "Am" e3 f ed + "AE Ac ef"
      d8 a d f a bf |
    }
    {
      % 2nd ending – "Am" e3 f ed + "AB cd e^g" (g simplified)

      d,8 e f g a cs |
    }
  }
  }


 \break
  %==== B PART ====
  %"Dm" a3 a aA
  d4. d8 d d, |
  % "G7" a2 gG f2
  d'4 d8 c, bf'4 |
  % "C" e3 e ef
  a4. a8 a bf |
  % "Am" eEd2c2
  a8 a, g'4 f4 |
    % "B7" B3 ^A Bc  (A-sharp = as)
   e4. ds8 e f |
 \break
 % "E7" dE cEB2
    g8 a, f' a, e'4 |


  % "Am" A3 B cd
  d4. e8 f g |
  % "A7" eE Ac e^g  (G-sharp = gs)
  a8 a, d f a cs |
\break

  % "Dm" a3 a aA
  d4. d8 d d,
  % "G7" aA g2 f2
  d'4 d8 c, bf'4 |


  % "C" e3 e ef
  a4. a8 a bf |
  % "Am" (3efe d2c2  (simplified as e f e d c)
  \tuplet 3/2 {a8 bf a} g4 f4 |

  % "B7" B3 ^A Bc
  e4. ds8 e f |
  \break
  % "E7" dE cEB2
    g8 a, f' a, e'4 |
  % "Am" A3 B A^G  (G-sharp = gs)
  d4. e8 d cs |
  d2. |

}

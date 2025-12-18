\version "2.14.1"

violinOne = \relative f' {
%1
           f4. (  g8) f4 d2. |
           f4. (  g8) f4 d2 r4 |
           c'2 c4 a2 r4 |
           bes2 bes4 f2. |
%5
           g2 g4 bes4.(  a8) g4 |
           f4.( g8) f4 d2 r4 |
           g2 g4 bes4.(  a8) g4 |
           f4.( g8) f4 d2 r4 |
%9         
           c'2 c4 es4.( c8) a4 |
           bes2.~ ( <bes d >2)-- r4 |
           bes4 (  f) d f4.(  es8)  c4 | 
           bes2. ~ bes2 r4 \bar "|."
}

Two = \relative c' {
           d4. es8 d4 bes2. |
           d4. es8 d4 bes2 r4 |
           es2 es4 ges2 r4 |
           f2 es4 d2. |
%5
          es2 es4 es4. f8 es4 |
          d4. es8 d4 bes2 r4 |
          es2 es4 es4. f8 es4 |
          d4. es8 d4 c(  bes) r4 |
%9
        es4(  f) g a4. a8 ges4|
        f2.~ e!2-- r4 |
        d2 bes4 d4. c8 c4 |
        bes2. ~ bes2 r4 \bar "|."
}

ten = \relative c' {
            bes2 bes4 f2. |
            bes2 a4 f2 r4 |
            a2 a4 c2 r4 |
            bes2 a4 f2 (  bes4) |
            bes2 bes4 g4. a8 bes4 |
            bes4. bes8 bes4 f2 r4 |
            bes2 bes4 g4. a8 bes4 |
            bes4. bes8 bes4 f2 r4 |
            g2 bes4 c4. c8 c4 |
            bes2. ~ g2-- r4 |
            bes2 g4 a4. bes8 a4 | bes2. ~ bes2 r4 \bar "|."
}

bass = \relative c {
            bes2 bes4 bes2. |
            bes2 bes4 bes2 r4 |
            f'2 f4 es2 r4 |
            d2 c4 bes2. |
            es2 es4 es2 es4 |
            bes4. bes8 bes4 bes2 r4 |
            es2 es4 es4. es8 es4 |
            bes4. bes8 bes4 bes2 r4 |
            c4 d es f4. f8 es4 |
            d2. ~ c2-- r4 |
            f2 f4 f4. g8 a4 |
            bes2. ~ bes2 r4 \bar "|."
}
\version "2.24.0"
\language "english"

\header {
  title = "The Trip To Sligo"
  composer = "Traditional"
  country = "Ireland"
  style = "jig"
  session = "https://thesession.org/tunes/397#setting54304"
  tagline = ""
}
voicedefault =  {
  \set Score.measureBarType = ""

  \repeat volta 2 {
    \time 6/8 \key e \minor   \repeat volta 2 {
      e'4[    e''8]    b'8[    g'8
      e'8]  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]  \bar "|"   e'4[
      e''8]    b'8[    g'8    e'8]  \bar "|"   b'8[    a'8    g'8]    e''4[    fs''8
      ] \bar "|"     g''8[    fs''8    e''8]    d''8[    c''8    b'8]  \bar "|"
      a'8[    b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]
      a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4.
    }
    \repeat volta 2 {
      e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"
      d''8[    a'8    d''8]    g''8[    a''8    g''8]  \bar "|"   e''8[    b'8
      e''8]    g''8[    fs''8    e''8]  \bar "|"   fs''8[    a''8    fs''8]
      g''8[    b''8    g''8]  \bar "|"     fs''8[    a''8    fs''8]    g''8[
      fs''8    e''8]  \bar "|"   d''8[    c''8    b'8]    a'8[    g'8    fs'8]
      \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[
      g'8    fs'8]    e'4.
    }   \time 6/8 \key e \minor   \repeat volta 2 {
      b'8
      \bar "|"   e'4[    c''8]    b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]
      a'8[    fs'8    d'8]  \bar "|"   e'4. ^"~"    b'8[    a'8    fs'8]  \bar "|"
      g'8[    fs'8    e'8]    e''4[    fs''8]  \bar "|"     g''8[    fs''8
      e''8]    d''8[    cs''8    b'8]  \bar "|"   a'8[    d''8    fs'8]    fs'8[
      e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8    c''8]
      \bar "|"   b'8[    g'8    e'8]    e'4
    }   b'8  \bar "|"     e''8[    b'8
    a'8]    g''8[    fs''8    e''8]  \bar "|"   d''8[    a'8    d''8]    fs''8[
    e''8    d''8]  \bar "|"   e''8[    b'8    e''8]    g''8[    fs''8    e''8]
    \bar "|"   fs''16[    g''16    a''8    fs''8]    g''8[    fs''8    e''8]
    \bar "|"     fs''16[    g''16    a''8    fs''8]    g''8[    fs''8    e''8]
    \bar "|"   d''8.[    cs''16    d''8]    a'8[    fs'8    d'8]  \bar "|"   e'8[
    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    e'8]    e'4
  }   \time 6/8 \key g \major   \repeat volta 2 {
    d'8  \bar "|"   e'4[    b'8]
    b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]
    \bar "|"   e'4[    b'8]    b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8]
    e'8[    e''4    fs''8]  \bar "|"     g''8[    fs''8    e''8]    d''8[    c''8
    b'8]  \bar "|"   a'8[    fs'8    d''8]    a'8[    fs'8    d'8]  \bar "|"
    e'4[    b'8]    b'8[    g'8    b'8]  \bar "|"   a'8[    g'8    fs'8    e'4]
  }
  \repeat volta 2 {
    b'8  \bar "|"   e''8[    b'8    e''8]    g''8[    b''8
    e''8]  \bar "|"   fs''8[    d''8    fs''8]    fs''8[    g''8    fs''8]
    \bar "|"   e''8[    b'8    e''8]    g''8[    b''8    e''8]  \bar "|"     fs''8
    [   a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"   e''8[    b'8
    e''8]    g''8[    b''8    e''8]  \bar "|"   d''8[    cs''8    d''8]    a'8[
    fs'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8    c''8]
    \bar "|"   b'8[    g'8]    fs'8[    e'4]
  }   \time 6/8 \key e \minor
  \repeat volta 2 {
    b8  \bar "|" <<   b4[    e'4   >>]   c''8    b'8[    g'8
    e'8]  \bar "|"   d'4    d''8    a'8[    fs'8    d'8]  \bar "|" <<
      b4[    e'4
    >>]   c''8    b'8[    a'8    fs'8]  \bar "|"   g'8[    fs'8    e'8]    e''4
    e''16 ([   fs''16]  \bar "|"     g''8  -)[   fs''8    e''8]    d''8[
    c''8    b'8]  \bar "|"   a'16 ([   b'16    a'8  -)   g'8 -.]   fs'8[    e'8
    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[
    g'8    fs'8]    e'4
  }     \repeat volta 2 {
    b'8  \bar "|"   e''8[    b'8
    e''8]    g''16 ([   b''8.  -)   e''8 -.] \bar "|"   d''8[    a'8    d''8]
    fs''16 ([   a''8.  -)   fs''8 -.] \bar "|"   e''8[    b'8    e''8]    g''16 ([
    b''8.  -)   e''8 -.] \bar "|"   fs''16 ([   a''8.  -)   fs''8 -.]   g''16 ([
    b''8.  -)   e''8 -.] \bar "|"     fs''16 ([   a''8.  -)   fs''8 -.]   g''8[
    fs''8    e''8]  \bar "|"   d''8    \grace {    e''16 ([   d''16]  }   c''8
    -)[   d''8]    a'8[    fs'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[
    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4
  }   \time 6/8
  \key e \minor   \repeat volta 2 {
    b8  \bar "|"   e'4    c''8    b'8[    g'8
    e'8]  \bar "|"   d'4    d''8    a'8[    fs'8    d'8]  \bar "|"   e'4.    b'8[
    a'8    fs'8]  \bar "|"   g'8[    fs'8    e'8]    e''4    fs''8  \bar "|"
    g''8[    fs''8    e''8]    d''8[    c''8    b'8]  \bar "|"   b'8[    a'8
    g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8
    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4
  }     \repeat volta 2 {
    b'8
    \bar "|"   e''8[    b'8    e''8]    g''8[    b''8    e''8]  \bar "|" \grace {
      d''16[    e''16]
    }   d''8.[    c''16    d''8]    fs''8[    a''8    fs''8]
    \bar "|"   e''8[    b'8    e''8]    g''8[    b''8    e''8]  \bar "|"   fs''8[
    a''8    fs''8]    g''8[    b''8    e''8]  \bar "|"     fs''8[    a''8
    fs''8]    g''8[    fs''8    e''8]  \bar "|" \grace {    d''16[    e''16]  }
    d''8.[    c''16    d''8]    a'8[    fs'8    d'8]  \bar "|"   e'8[    fs'8
    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4
  }
  \time 6/8 \key e \minor   \repeat volta 2 {
    e'4[    e''8]    b'8[    g'8
    e'8]  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]  \bar "|"   e'4[
    e''8]    b'8[    g'8    e'8]  \bar "|"   b'8[    a'8    g'8]    e''4[    fs''8
    ] \bar "|"     g''8[    fs''8    e''8]    d''8[    cs''8    b'8]  \bar "|"
    a'8[    b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]
    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4.
  }     e''8
  \bar "|"   e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"   d''8[
  a'8    d''8]    fs''8[    e''8    d''8]  \bar "|"   e''8[    b'8    e''8]
  g''8[    fs''8    e''8]  \bar "|"   fs''8[    a''8    fs''8]    g''8[
  fs''8    e''8]  \bar "|"     fs''8[    a''8    fs''8]    g''8[    fs''8
  e''8]  \bar "|"   d''8[    cs''8    b'8]    a'8[    fs'8    d'8]  \bar "|"
  e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]
  e'4.
}   \time 6/8 \key e \minor   \repeat volta 2 {
  e'4[    e''8]    b'8[
  g'8    e'8]  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]  \bar "|"
  e'4[    e''8]    b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8    e'8]    e''4[
  fs''8]  \bar "|"     g''8[    fs''8    e''8]    d''8[    cs''8    b'8]
  \bar "|"   a'8[    b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[
  fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4.
}     e''8  \repeat volta 2 {
  e''8[    b'8    e''8]    g''8[    fs''8
  e''8]  \bar "|"   d''8[    a'8    d''8]    fs''8[    e''8    d''8]  \bar "|"
  e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"   fs''16[    g''16
  a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"     fs''16[    g''16
  a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"   d''8[    cs''8
  b'8]    a'8[    fs'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8
  c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4.
}   \time 6/8 \key e \minor
\repeat volta 2 {
  d'8  \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]
  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]  \bar "|"   e'4[    e''8]
  b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8    e'8]    e''4[    fs''8]
  \bar "|"     g''8[    fs''8    e''8]    d''8[    c''8    b'8]  \bar "|"   a'8[
  b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]
  fs'8[    g'8    a'8]  \bar "|"   b'8[    g'8    fs'8]    e'4
}
\repeat volta 2 {
  b'8  \bar "|"   e''8[    b'8    e''8]    g''8[    fs''8
  e''8]  \bar "|"   d''8[    a'8    d''8]    fs''8[    e''8    d''8]  \bar "|"
  e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"   fs''8[    a''8
  fs''8]    g''8[    fs''8    e''8]  \bar "|"     fs''16[    g''16    a''8
  fs''8]    g''8[    fs''8    e''8]  \bar "|"   d''8[    c''8    b'8]    a'8[
  fs'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    fs'8[    g'8    a'8]
  \bar "|"   b'8[    g'8    fs'8]    e'4
}   \time 6/8 \key a \minor
\repeat volta 2 {
  a'4[    e''8]    e''8[    c''8    e''8]  \bar "|"   d''8[
  b'8    g''8]    d''8[    b'8    g'8]  \bar "|"   a'4[    e''8]    e''8[
  c''8    e''8]  \bar "|"   d''8[    c''8    b'8]    a'8[    g''8    a''8]
  \bar "|"     b''8[    a''8    g''8]    a''8[    g''8    f''8]  \bar "|"   e''8[
  f''8    e''8]    d''8[    b'8    g'8]  \bar "|"   a'8[    b'8    c''8]
  d''8[    f''8    e''8]
} \alternative{
  {
    d''8[    c''8    b'8]    a'4[    g'8
    ]
  } {
    d''8[    c''8    b'8]    a'8[    g''8    f''8]  \bar "||"
    \repeat volta 2 {
      e''8[    c''8    a'8]    a'8[    g'8    a'8]  \bar "|"
      c''8[    d''8    e''8]    f''8[    e''8    d''8]  \bar "|"   e''8[    c''8
      a'8]    a'8[    g'8    a'8]  \bar "|"   c''8[    d''8    e''8]    g''8[    e''8
      d''8]  \bar "|"     e''8[    a''8    a''8]    g''8[    a''8    g''8]
      \bar "|"   c''4. ^"~"    b'8[    a'8    g'8]  \bar "|"   a'8[    b'8    c''8]
      d''8[    f''8    e''8]
    } \alternative{
      {
        d''8[    c''8    b'8]    a'8[
        g''8    f''8]
      } {
        d''8[    c''8    b'8]    a'4[    g'8]  \bar "||"
        \time 6/8 \key e \minor   \repeat volta 2 {
          b8  \bar "|"   e'4    c''8    b'8
          [   g'8    e'8]  \bar "|"   d'4    d''8    a'8[    fs'8    d'8]  \bar "|"
          e'4    c''8    b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8    e'8]    e''4
          fs''8  \bar "|"     g''8[    fs''8    e''8]    d''8[    c''8    b'8]
          \bar "|"   a'16[    b'16    a'8    g'8]    fs'8[    e'8    d'8]  \bar "|"
          e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]
          e'4
        }
      }      \repeat volta 2 {
        b'8  \bar "|"   e''8[    b'8    e''8]
        g''8[    b''8    g''8]  \bar "|"   d''8[    a'8    d''8]    fs''8[    a''8
        fs''8]  \bar "|"   e''8[    b'8    e''8]    g''8[    b''8    g''8]  \bar "|"
        fs''8[    a''8    fs''8]    g''8[    b''8    g''8]  \bar "|"     g''8[
        fs''8    e''8]    d''8[    c''8    b'8]  \bar "|"   a'16[    b'16    a'8
        g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8
        c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4
      }   \time 6/8 \key e \minor
      \repeat volta 2 {
        e'4[    e''8]    b'8[    g'8    e'8]  \bar "|"   d'4[
        d''8]    a'8[    fs'8    d'8]  \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]
        \bar "|"   g'8[    fs'8    e'8]    e''4[    fs''8]  \bar "|"     g''8[
        fs''8    e''8]    fs''8[    d''8    b'8]  \bar "|" \grace {    a'8  }   b'4[
        g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    fs'8[
        g'8    a'8]
      } \alternative{
        {   b'8[    g'8    fs'8]    e'4[    d'8]  } {
          b'8[    g'8    fs'8]    e'4[    b'8]  \bar "||"     \repeat volta 2 {
            e''8[
            b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"   d''8[    a'8    d''8]
            fs''8[    e''8    d''8]  \bar "|"   e''8[    b'8    e''8]    g''8[    fs''8
            e''8]  \bar "|"   fs''16[    g''16    a''8    fs''8]    g''8[    fs''8
            e''8]  \bar "|"     fs''16[    g''16    a''8    fs''8]    g''8[    fs''8
            e''8]  \bar "|"   fs''8[    d''8    b'8]    a'8[    fs'8    d'8]  \bar "|"
            e'8[    fs'8    g'8]    fs'8[    g'8    a'8]
          } \alternative{
            {
              b'8[    g'8
              fs'8]    e'4[    b'8]
            } {
              b'8[    g'8    fs'8]    e'4[    d'8]
              \bar "||"   \time 6/8 \key e \minor   d'8  \repeat volta 2 {
                e'4[    e''8]
                b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]
                \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8
                e'8]    e''4[    fs''8]  \bar "|"     g''8[    fs''8    e''8]    d''8[    b'8
                g'8]  \bar "|"   a'8[    b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"
                e'8[    fs'8    g'8]    a'8[    b'8    c''8]
              } \alternative{
                {
                  b'8[    g'8
                  fs'8]    e'4[    d'8]
                } {
                  b'8[    g'8    fs'8]    e'4.  \bar "||"
                  \repeat volta 2 {
                    e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"
                    d''8[    a'8    d''8]    fs''8[    e''8    d''8]  \bar "|"   e''8[    b'8
                    e''8]    g''8[    fs''8    e''8]  \bar "|"   fs''16[    g''16    a''8
                    fs''8]    g''8[    fs''8    e''8]  \bar "|"     fs''8[    a''8    fs''8]
                    g''8[    fs''8    e''8]  \bar "|"   d''8[    cs''8    b'8]    a'8[    fs'8
                    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8
                    [   g'8    fs'8]    e'4.
                  }
                }    \time 6/8 \key e \minor   \repeat volta 2 {
                  d'8  \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]
                  a'8[    fs'8    d'8]  \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]
                  \bar "|"   g'8[    fs'8    e'8]    e'8[    fs'8    d'8]  \bar "|"     e'4[
                  e''8]    b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]
                  \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]  \bar "|"   e'8[    fs'8
                  g'8]    a'8[    b'8    c''8]  \bar "|"     b'8[    g'8    fs'8]    e'4[    d'8
                  ] \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]
                  a'8[    fs'8    d'8]  \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]
                  \bar "|"     g'8[    fs'8    e'8]    e''4[    fs''8]  \bar "|"   g''8[
                  fs''8    e''8]    d''8[    c''8    b'8]  \bar "|"   a'8[    b'8    g'8]
                  fs'8[    e'8    d'8]  \bar "|" \time 9/8 e''4[    fs''8]    g''8[    fs''8
                  e''8]    d''8[    c''8    b'8]  \bar "|"   \time 6/8   a'8[    b'8    g'8]
                  fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8    c''8]
                  \bar "|"   b'8[    g'8    fs'8]    e'4
                }     \repeat volta 2 {
                  e''8
                  \bar "|"   e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"   d''8[
                  a'8    d''8]    fs''8[    e''8    d''8]  \bar "|"   e''8[    b'8    e''8]
                  g''8[    fs''8    e''8]  \bar "|"   fs''16[    g''16    a''8    fs''8]
                  g''8[    fs''8    e''8]  \bar "|"     fs''16[    g''16    a''8    fs''8]
                  g''8[    fs''8    e''8]  \bar "|"   d''8[    c''8    b'8]    a'8[    fs'8
                  d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[
                  g'8    fs'8]    e'4
                }   \time 6/8 \key e \minor   \repeat volta 2 {
                  e'4[
                  e''8]    b'8[    g'8    e'8]  \bar "|"   d'4[    d''8]    a'8[    fs'8
                  d'8]  \bar "|"   e'4[    e''8]    b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8
                  e'8]    e''4[    fs''8]  \bar "|"     g''8[    fs''8    e''8]    d''8[
                  c''8    b'8]  \bar "|"   a'8[    b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"
                  e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8
                  fs'8]    e'4.
                }     \repeat volta 2 {
                  e''8[    b'8    e''8]    g''8[
                  fs''8    e''8]  \bar "|"   d''8[    a'8    d''8]    fs''8[    e''8    d''8]
                  \bar "|"   e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"
                  fs''16[    g''16    a''8    fs''8]    g''4[    e''8]  \bar "|"     fs''16[
                  g''16    a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"   d''8[    c''8
                  b'8]    a'8[    fs'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[
                  b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4.
                }   \time 6/8
                \key g \major   \repeat volta 2 {
                  e'4[    e''8]    b'8[    g'8    e'8]
                  \bar "|"   d'4[    d''8]    a'8[    fs'8    d'8]  \bar "|"   e'4[    e''8]
                  b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8    e'8]    e''4[    fs''8]
                  \bar "|"     g''8[    fs''8    e''8]    d''8[    c''8    b'8]  \bar "|"   a'8[
                  b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8[    fs'8    g'8]    a'8
                  [   b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4.
                }
                \repeat volta 2 {
                  e''16 ^"~"[    e''16    b'8    e''8]    g''8[    fs''8
                  e''8]  \bar "|"   d''8[    a'8    d''8]    fs''8[    e''8    d''8]  \bar "|"
                  e''8[    b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"   fs''16[    g''16
                  a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"     fs''16[    g''16
                  a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"   d''8[    c''8    b'8]
                  a'8[    fs'8    a'8]  \bar "|"   e'8[    fs'8    g'8]    a'8[    b'8
                  c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4.
                }   \time 6/8 \key e \minor
                \repeat volta 2 {
                  fs'8  \bar "|"   e'4    b'8    b'8[    g'8    e'8]
                  \bar "|"   d'4    d''8    a'8[    fs'8    d'8]  \bar "|"   e'4    b'8    b'8[
                  g'8    e'8]  \bar "|"   g'8[    fs'8    e'8]    e''4    fs''8  \bar "|"
                  g''8[    fs''8    e''8]    d''8[    c''8    b'8]  \bar "|"   a'8[    fs'8
                  d''8]    a'8[    fs'8    d'8]  \bar "|"   e'4    b'8    b'8[    g'8    b'8]
                  \bar "|"   a'8[    g'8    fs'8]    e'4
                }     \repeat volta 2 {
                  b'8
                  \bar "|"   e''8[    b'8    e''8]    g''8[    b''8    e''8]  \bar "|"   d''8[
                  a'8    d''8]    fs''8[    a''8    fs''8]  \bar "|"   e''8[    b'8    e''8]
                  g''8[    b''8    g''8]  \bar "|"   e''8[    b'8    e''8]    g''8[    b''8
                  e''8]  \bar "|"     fs''8[    a''8    fs''8]    g''8[    fs''8    e''8]
                  \bar "|"   d''8[    cs''8    d''8]    a'8[    fs'8    d'8]  \bar "|"   e'8[
                  fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8[    g'8    fs'8]    e'4
                }   \time 6/8 \key e \minor   \repeat volta 2 {
                  e'4 ^"Em"[   e''8]    b'8[
                  g'8    e'8]  \bar "|"   d'4 ^"D"[   d''8]    a'8[    fs'8    d'8]  \bar "|"
                  e'4 ^"Em"[   e''8]    b'8[    g'8    e'8]  \bar "|"   g'8[    fs'8    e'8]
                  e''4[    fs''8]  \bar "|"       g''8 ^"G"[   fs''8    e''8]    d''8[    c''8
                  b'8]  \bar "|"   a'8[    b'8    g'8]    fs'8[    e'8    d'8]  \bar "|"   e'8
                  [   fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8 ^"Em"[   g'8    fs'8
                  ]   e'4.
                }     \repeat volta 2 {
                  e''8 ^"Em"[   b'8    e''8]    g''8[
                  fs''8    e''8]  \bar "|"   d''8 ^"D"[   a'8    d''8]    fs''8[    e''8
                  d''8]  \bar "|"   e''8 ^"Em"[   b'8    e''8]    g''8[    fs''8    e''8]
                  \bar "|"   fs''16[    g''16    a''8    fs''8]    g''8[    fs''8    e''8]
                  \bar "|"       fs''16 ^"G"[   g''16    a''8    fs''8]    g''8[    fs''8
                  e''8]  \bar "|"   d''8[    c''8    b'8]    a'8[    fs'8    a'8]  \bar "|"
                  e'8[    fs'8    g'8]    a'8[    b'8    c''8]  \bar "|"   b'8 ^"Em"[   g'8
                  fs'8]    e'4.
                }   \time 6/8 \key e \minor   \repeat volta 2 {
                  d'8  \bar "|"
                  e'4 ^"Em"[   e''8]    b'8[    g'8    e'8]  \bar "|"     d'4 ^"D"   d''8
                  a'8[    fs'8    d'8]  \bar "|"   e'4 ^"Em"[   e''8]    b'8[    g'8    e'8]
                  \bar "|"   g'8 ^"Em"[   fs'8    e'8]    e''4[    fs''8]  \bar "|"       g''8
                  ^"G"[   fs''8    e''8]    d''8[    b'8    g'8]  \bar "|"     a'8 ^"D"[   b'8
                  g'8]    fs'8[    e'8    d'8]  \bar "|"     e'8 ^"C"[   fs'8    g'8]    a'8[
                  b'8    c''8]  \bar "|"   b'8 ^"D"[   g'8    fs'8]      e'4 ^"Em"
                }
                \repeat volta 2 {
                  b'8  \bar "|"   e''8 ^"Em"[   b'8    e''8]    fs''8[
                  e''8    d''8]  \bar "|"   d''8 ^"D"[   a'8    d''8]    fs''8[    e''8    d''8]
                  \bar "|"   e''8 ^"Em"[   b'8    e''8]    g''8[    fs''8    e''8]  \bar "|"
                  fs''8 ^"D"[   a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"
                  fs''8 ^"D"[   a''8    fs''8]    g''8[    fs''8    e''8]  \bar "|"     d''8
                  ^"D"[   c''8    b'8]    a'8[    fs'8    d'8]  \bar "|"   e'8 ^"C"[   fs'8
                  g'8]    a'8[    b'8    c''8]  \bar "|"   b'8 ^"D"[   g'8    fs'8]      e'4
                  ^"Em"
                }
              }

              \score{
                <<

                  \context Staff="default"
                  {
                    \voicedefault
                  }

                >>
                \layout {
                }
                \midi {}
              }

\version "2.24.0"
\language "english"

\header {
  title = "T'es Cap"
  subtitle = "from The Adventures of Pinocchio (1972)"
  composer = "Fiorenzo Carpi"
  country = "Italy"
  style = "Soundtrack"
}

\include "../../common/common-header.ily"

% \paper {
%   paper-width = 21.0\cm
%   paper-height = 29.7\cm
%   top-margin = 1.0\cm
%   bottom-margin = 2.0\cm
%   left-margin = 1.0\cm
%   right-margin = 1.0\cm
% }

stanzaOne = \lyricmode {
  \set stanza = #"1. "
  \skip 1 bla1

}
stanzaTwo = \lyricmode {
  \set stanza = #"2. "
}

practice =  \relative c' {
  \clef "treble"
  \key ef \major
  \time 2/4
  \repeat volta 2 {
    ef4 f g bf
    ef-1 f g bf
    ef bf g f
    ef bf g f
  }
  \repeat volta 2 {
    g'8 f  ef4
    d-1 f 8 ef d4
    c-1 ef8 d  c4
  }
}

\score {
  <<
    \new Staff { \practice }
  >>
  \layout { }
  \midi { }
}



skips = {

  \skip 4 \skip 4 \skip 4 \skip 4  \skip 4
  \skip 4 \skip 4 \skip 4 \skip 4  \skip 4
  \skip 4 \skip 4 \skip 4 \skip 4  \skip 4
  \skip 4 \skip 4 \skip 4 \skip 4  \skip 4
  \skip 4 \skip 4 \skip 8 \skip 8  \skip 8
  \skip 4 \skip 8 \skip 8 \skip 8  \skip 8
  \skip 4 \skip 4 \skip 8 \skip 8  \skip 8

  \skip 4 \skip 8 \skip 8 \skip 8  \skip 8
  \skip 4 \skip 4
}

stanzaOne = \lyricmode {
  \skips

  \set stanza = #"1. "
  T'es cap, pas cap, de te rou -- ler dans la boue
  T'es cap, pas cap, mar -- cher "3" ki -- lo -- mètres sur les ge -- noux
  T'es cap, pas cap, d'hur -- ler comme un fou
  T'es cap, pas cap, que tu l'ai -- mes Ma -- ry -- Lou
}
stanzaTwo = \lyricmode {
  \skips
  \set stanza = #"2. "
  T'es cap, pas cap de mon -- ter sur la ta -- ble
  T'es cap, pas cap, pour al -- ler dé -- fier Zo -- rro sous sa cape
  T'es cap, l'em -- bra -- sser sur la bou -- che
  T'es cap, pas cap de cho -- pper u -- ne mou -- che
}
stanzaThree = \lyricmode {
  \skips
  \set stanza = #"3. "
  T'es cap, pas cap de mon -- ter sur la ta -- ble
  T'es cap, pas cap, pour al -- ler dé -- fier Zo -- rro sous sa cape
  T'es cap, l'em -- bra -- sser sur la bou -- che
  T'es cap, pas cap de cho -- pper u -- ne mou -- che
}

Theme = {g'4 fs8 g8 af g fs g f!4 ef8 f g4 ef}
voltaAdLib = \markup {"x"\small\italic { "3" } }


\score {
  <<
    \new Staff {
      \relative c'' {
        \time 2/4

        \mark "Intro"
        g'4  fs8 g8 af g fs g f!4 d8 ef g f ef d c4 r4
        \break

        \repeat volta 3 {
          g'4^\markup { \bold "2×" } fs8 g8 af g fs g f!4 ef8 f g4 ef
          \break
          g4  fs8 g8 af g fs g f!4 d8 ef g f ef d
        }
        \alternative
        {
          %\volta 2 { }
          \volta 4 { c8 r8 r4 }
        }

        %\break
        %\set Score.repeatCommands = #(list (list 'volta voltaAdLib) 'start-repeat)

        % \set Score.repeatCommands = #'((volta #f) (volta "4.") end-repeat)
        % \set Score.repeatCommands = #'((volta #f))
        \break

        \repeat volta 2 {
          r8 ef8
          c8 r r ef c r r  g'
          g g f g af g r8  ef8
          c r r ef c r
          r  g' g g f g
          %\break
          af   g   f8  ef8
          d8   r   r   f
          d8   r   r   g
          g8   g   f   g
          af   g   r   f
          d   r   r   f
          d8   r   r   g
          bf8  g   f8  d
          ef   c8

        }
        \break
        \mark "Refrain"
        \repeat volta 2 {
          r   g'8
          af8. f16   f8  f8
          g8   ef8   d8  c8
          bf4  bf'4  g4  r8 g8
          af8. f16  f8 f8
          g8   ef8  d8 c8
          bf4  bf'4
          \break
          g8.  f16  ef4  % 27
          g8.  f16  ef4  % 28
          g8.  f16  ef8 bf'8  % 29
          bf8  bf8  bf8 af8
          g8.  f16  ef4
          g8.  f16  ef4
          g8.  f16  ef8 bf'8
          bf8  bf8  bf8 af8
          g8.  f16  ef4
          f8.  ef16 d4
          ef8. d16  c4
          d4 g4
          c,4 d8 ef8
          f8 f8 ef8 d8
          c4 d8 ef8
          f8 f8 ef8 d8
          c4 r8 ef8 \bar "|."
        }
      }
    }
    \addlyrics { \stanzaOne }
    \addlyrics { \stanzaTwo }
    \addlyrics { \stanzaThree }
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #-2
  }  %\midi { }
}


%{
{Refrain 1:}
Toi dis moi si vraiment t'es cap ou t'es pas cap
Ca fait tellement longtemps que je me cache sans qu' tu m'attrapes
pour de vrai, pour de faux
moi je n'suis pas une marionnette
pour de vrai, pour de faux
j'ai pas de fils ni de clochettes
même si tout l'monde ment comme des grands,
on est tous des Pinocchio,
des enfants de Gepetto


{stanzaThree}
T'es cap, pas cap de t'moquer d'la boulangère
T'es cap, pas cap
ah non, tu n'peux pas puisque c'est ta mère
T'es cap
Y a pas que les grands qui osent
T'es cap, pas cap
qui font de grandes choses
%}
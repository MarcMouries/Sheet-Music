\version "2.24.0"
\language "english"

\header {
  title = "Pinocchio - T'es Cap"
  tagline = ""
}

#(set-global-staff-size 22)
\paper {
  paper-width = 21.0\cm
  paper-height = 29.7\cm
  top-margin = 1.0\cm
  bottom-margin = 2.0\cm
  left-margin = 1.0\cm
  right-margin = 1.0\cm
}

stanzaOne = \lyricmode {
  \set stanza = #"1. "
  \skip \breve bla\breve

}
stanzaTwo = \lyricmode {
  \set stanza = #"2. "
}

PartPOneVoiceOne =  \relative c'' {
  \clef "treble"
  \key ef \major
  \time 2/4



}

practice =  \relative c' {
  \clef "treble"
  \key ef \major
  \time 2/4
  \repeat volta 2 {
    ef f g bf
    ef-1 f g bf
    ef bf g f
    ef bf g f
  }
  \repeat volta 2 {
    g'4 f  ef2
    d-1 f 4 ef d2
    c-1 ef4 d  c2
  }
}

\score {
  <<
    \new Staff { \practice }
  >>
  \layout { }
  \midi { }
}

\score {
  <<
    %\new ChordNames \chordNames
    \new Staff { \PartPOneVoiceOne }
    \addlyrics { \stanzaOne }
  >>
  \layout { }
  %\midi { }
}

skips = {

  \skip 2 \skip 2 \skip 2 \skip 2  \skip 2
  \skip 2 \skip 2 \skip 2 \skip 2  \skip 2
  \skip 2 \skip 2 \skip 2 \skip 2  \skip 2
  \skip 2 \skip 2 \skip 2 \skip 2  \skip 2
  \skip 2 \skip 2 \skip 4 \skip 4  \skip 4
  \skip 2 \skip 4 \skip 4 \skip 4  \skip 4
  \skip 2 \skip 2 \skip 4 \skip 4  \skip 4

  \skip 2 \skip 4 \skip 4 \skip 4  \skip 4
  \skip 2 \skip 2
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

Theme = {g'2 fs4 g4 af g fs g f!2 ef4 f g2 ef}
voltaAdLib = \markup {"x"\small\italic { "3" } }


\score {
  <<
    \new Staff {
      \relative c'' {
        \time 2/4

        \mark "Intro"
        g'2  fs4 g4 af g fs g f!2 d4 ef g f ef d c2 r2
        \break

        \repeat volta 3 {
          g'2^\markup { \bold "2×" } fs4 g4 af g fs g f!2 ef4 f g2 ef
          \break
          g2  fs4 g4 af g fs g f!2 d4 ef g f ef d
        }
        \alternative
        {
          \volta 1 { }
          \volta 2 { c4 r4 }
        }

        %\break
        %\set Score.repeatCommands = #(list (list 'volta voltaAdLib) 'start-repeat)

        % \set Score.repeatCommands = #'((volta #f) (volta "4.") end-repeat)
        % \set Score.repeatCommands = #'((volta #f))
        \break
        r4 r4 
        \repeat volta 2 {
r4 ef4
          c4 r r ef c r r  g'
          g g f g af g r4  ef4
          c r r ef c r
          r  g' g g f g
          %\break
          af   g   f4  ef4
          d4   r   r   f
          d4   r   r   g
          g4   g   f   g
          af   g   r   f
          d   r   r   f
          d4   r   r   g
          bf4  g   f4  d 
          ef   c4
          
        }
          \break
          \mark "Refrain"
        \repeat volta 2 {
          r   g'4
          af4. f8   f4  f4
          g4   ef4   d4  c4
          bf2  bf'2  g2  r4 g4
          af4. f8  f4 f4
          g4   ef4  d4 c4
          bf2  bf'2
          \break
          g4.  f8  ef2  % 27
          g4.  f8  ef2  % 28
          g4.  f8  ef4 bf'4  % 29
          bf4  bf4  bf4 af4
          g4.  f8  ef2
          g4.  f8  ef2
          g4.  f8  ef4 bf'4
          bf4  bf4  bf4 af4
          g4.  f8  ef2
          f4.  ef8 d2
          ef4. d8  c2
          d2 g2
          c,2 d4 ef4
          f4 f4 ef4 d4
          c2 d4 ef4
          f4 f4 ef4 d4
          c2 r4 ef4 \bar "|."
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
\language "english"
\version "2.19.11"
#(set-global-staff-size 22)
#(set-default-paper-size "letter")
%=============================================
%   created by MuseScore Version: 1.3
%          September 30, 2014
%=============================================
\paper {
  line-width    = 195.9\mm
  left-margin   = 10\mm
  top-margin    = 10\mm
  bottom-margin = 20\mm
  %%indent = 0 \mm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  %% in orchestral scores you probably want the two bold slashes
  %% separating the systems: so uncomment the following line:
  %% system-separator-markup = \slashSeparator
  }

\header {
    title = "Greensleeves"
    subtitle = "for Vioin"
    composer = "Traditional English Folk Song"

    }

melody = \relative c'{
    \clef treble
    \key e \minor
    \repeat volta 2 {
    \time 3/4
    \partial 4*1
    e4\upbow      g2 a4
    b4.( c8) b4        | % 2
    a2 fs4      | % 3
    d4.( e8) fs4      | % 4

    \break
    g2 e4
    e4.( ds8) e4
    fs2 ds4
    b2 e4

    \break
    g'2 a4
    b4.( c8) b4
    <fs a>2 fs4
    d4.( e8) fs4

    \break
    <e g>4. fs8( e4)
    ds4.( cs8) ds4
    <b e>2.
    e2.
    \break
    d'2.\upbow  ^\markup {\upright  "Chorus"}
    d4.( cs8) b4
    a2 fs4
    d4.( e8) fs4

    \break
    <cf g'>2( e4)
    e4.( ds8) e4
    <b fs'>2( ds4)
    b2.

    \break
    d2.
    d'4.( cs8) b4
    <fs a>2 fs4
    d4.( e8) fs4

    \break
    <e g>4.( fs8) e4
    <ds fs>4. cs8 ds4
    e2.      | % 31
    e2. \bar "|."
}
}

\score {
    \new Staff {
      \melody
    }
    \layout {
      indent = 0
    }
    \midi { }
}
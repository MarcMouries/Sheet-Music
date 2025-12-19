\version "2.19.80"
\language "italiano"


%%\include "LilyJAZZ.ily"

\include "articulate.ly"




%%%%%%%%%%%%%%%%%%%%%%%%
%%%  STYLE SHEET
%%%%%%%%%%%%%%%%%%%%%%%%
#(set-global-staff-size 20)
\paper {
  #(define fonts (set-global-fonts
                  #:roman "LilyJAZZ Text"
                  #:sans "LilyJAZZ Chord"
                  #:factor (/ staff-height pt 20)
                  ))
}
\header {  title = "Rythmes Gitans (Daisy)"
  composer = "Traditional"
  country = "France" }

\include "../../common/common-header.ily"


\layout{
  indent = 0\in

  \context {
    \Score
    \override MetronomeMark.extra-offset = #'(-5 . 0)
    \override MetronomeMark.padding = #'3

  }
  \context {
    \Staff
    \override TimeSignature.style = #'numbered
  }
  \context {
    \Voice
    \override Glissando.thickness = #3
    \override Glissando.gap = #0.1
  }
}

tempoMarkup = \markup {
  "Tempo Swing"
  \hspace #0.25 \fontsize #-1 \medium
  \concat {
    \raise #0.4 \fontsize #-2 \note-by-number #2 #0 #0.85
    \hspace #0.5 "="
    \hspace #0.2 \bold 150
  }
}

%---------------------------
Title    = "Rythmes Gitans"
Subtitle = "for two violins and strings"
Composer = "Jo Privat"
arranger = "Arranger"
instrument = "Violin I"
%---------------------



global = {
  \time 4/4
  \key sol \minor
  %\tempo "swing" 4=150
}

chords_A = \chordmode {
  sol1:m  la2:m7.5- re2:7
  sol1:m  la2:m7.5- re2:7
}
chords_B = \chordmode {
  mib1:7  mib1:7   re1:m re1:m
  do1:m   do1:m    re1:7 re1:7
}
chordNames = \chordmode {
  % INTRO
  s1 s1 s1 s1

  % A
  \chords_A
  \chords_A
  % B
  \chords_B
  % A
  \chords_A
  \chords_A

  % IMPROV
  % A
  \chords_A
  \chords_A
  % B
  \chords_B
  % A
  \chords_A
  \chords_A
}
\markup \vspace #0.1
\markup {
  \override #'(baseline-skip . 40) %% changes distance between title/subtitle and composer/arranger
  \column {
    \override #'(baseline-skip . 3.5) %
    \column {
      \fill-line {
        { \tempoMarkup}                % LEFT
        { \fontsize #6 \bold \Title }  % CENTER
        {\Composer}                    % RIGHT
      }
      \fill-line {
        \fromproperty #'header:meter
        \fromproperty #'header:arranger
      }
    }
  }
}
\markup \vspace #1

section_A_base = \relative do'' {
  \mark \markup { \box \bold " A " }
  \repeat volta 2{
    re8 do sib re8 ~  re4 r4
    r8 la\downbow( do) mib( sol) fad-1( fa-1) mib
    re8 do( sib) re8 ~ re4 r
    r8 fad,\downbow( la) do( mib)  re( reb) do
    \break
    sib8 do16( sib sol8) sib  ~sib4 r4
    \acciaccatura {do16\upbow sib}
    la8 sib( do) dod ~ dod re sib sol
    sol4 r4 r2
    
  }
}

section_AA = \relative do'' {
  \section_A_base
  r1
}
section_AB = \relative do'' {
  \section_A_base
  \acciaccatura {do16\upbow sib}
    la8 sib( do) dod ~ dod re sib sol
}
section_B = \relative do'' {
  \mark \markup { \box \bold " B " }
  \repeat volta 2{
    sol8\downbow (la16 sol mib8) fa8( sol2)
    r8 sol\downbow( fad sol) sib\upbow la( sol) fa
    ~fa8( sol16 fa re8) mi8(  fa2~)
    fa1
    \break
    mib8 fa16 mib do8 re8 mib2
    r8    \acciaccatura { fa16\upbow mib}
    re8 mib( fad) sol fad!  mib re
    re4 r4 r2
    r8 re( mi) fad( sol) la sib do
  }
}
melody = \relative do' {
  % \jazzOn
  \global
  \mark \markup { \box \bold Intro }
  r1 r8 re( mi) fad( sol) la sib do
  r8 re,( mi) fad( sol) la sib do
  r8 re,( mi) fad( sol) la sib do
  \section_AA
  \break
  \section_B
  \section_AB


  \break
  \mark \markup { \box \bold " Improv " }
  la8 sib( la) sol( fad) re
  fa8 mi ~
  mi mib8
  mib8  fa16\upbow( mib  re8) do\downbow( sib) sib
  do8 re4 sib4 sol8 sib8 sol8
  la8 la8( sib) la8 ~ la4  r4
  \break
  r4 \acciaccatura {sib16\downbow la}
  sol8 la( sib) re( sol8) la
  sib re( sol) la( sib) fad( la) sold(
  la2) sol8 re4 fa8 ~
  fa8 mi8( mib4)
  dod8 re8  dod re ~
  \break

  re4 sib4  sol8 do4
  la8  ~
  la8
  fad8 ~ fad8
  mib8 ~ mib8
  do8 ~ do8
  dod8 ~ dod8
  re8 ~ re8
  sib4  sol8  do8 re8 ~re8
  r8 r8 sol,8 sib do re fa\upbow(
  \break
  sol8) sib( do8)  dod8( dod8
  \tuplet 3/2 {re16 do sib)}
  do8\downbow sib8 do dod( \glissando re8) fa( sol)


  fa8( sol8) sib8\downbow ~ sib4. la8 sol8
  re4  do8
  ~ do8   sib4  la4 re,8 sol8 re8
  \break
  sol4.  fa8  mib4 re8 fa8
  sol4.  fa8  mib4 sol8 fa8
  ~ fa8 fa4  mib8( re4)  do8 re8
  ~ re4 r4  r4  r4
  \break
  r4  r4 r4 r4
  r4  r4 r4 r4
  r4  r4 r4 r4
  r4  r4 r4 r4
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { 
     % \articulate <<
      \melody
  %  >>
  }
  >>
  \layout { }
  \midi { }
}
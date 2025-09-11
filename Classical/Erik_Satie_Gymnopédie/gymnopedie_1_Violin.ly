\language "english"
\version "2.24.3"
%\pointAndClickOff

\header{
  tagline = ""
  title = "1ere. Gymnopédie"
  composer = "Erik Satie"
}

% ===== Violin sections matching your analysis =====
mRests = { R2. R2. R2. R2. }

% Theme A — D major; melody floats over Gmaj7 ↔ Dmaj7, F# on top (pedal color)
themeA = \relative c'' {
  \mark \markup \box "A — Theme (D: Gmaj7 ↔ Dmaj7, F♯ pedal color)"
  \break
  r4 fs4\p(\<\downbow a) g\upbow( fs cs) b\downbow( cs d\!) a2.\upbow
}

% F♯ plateau — sustained top note across four bars (ties the harmony)
pedalFs = \relative c' {
  \mark \markup \box "B — F♯ plateau"
  fs2.--~\f\downbow fs2.--~ fs2.--~ fs2.--
}

% Pivot — gentle shift, setting up the arching phrase (D → colorations incl. minor inflection)
pivotToMinor = \relative c'' {
  \mark \markup \box "C — Pivot (color shift)"
  cs2.\downbow fs2.\>\upbow e,2.~\downbow e2.~ e2.\!
}

% Arching wave (rise/fall) — long quarter-note line
archUp = \relative c'' {
  \mark \markup \box "D — Arch 1 (wave up)"
  a4\p(\upbow b c) e(\downbow d b) d4(\upbow c b) d2.~\downbow d2 d4
}
archCont = \relative c'' {
  \mark \markup \box "E — Arch 2 (wave continues)"
  e4\< f g a(\downbow c, d)\! e4(\upbow d b) d2.~\>\downbow d2 d4
}

% Ending 1 — first time: “original” path back (fits your first pass)
endingOne = {
  \mark \markup \box "F — Ending 1 (first time)"
  \relative c''' { g2.\< fs2.\downbow b,4\!(\upbow a b) cs(\downbow d e) }
  \relative c''  { cs4(\>\upbow d e) fs,2\downbow g4(\!\upbow c2.) d2.\downbow }
}

% Ending 2 — second time: variant (mirror motion & final cadence with fermata)
endingTwo = {
  \mark \markup \box "G — Ending 2 (second time, mirror motion)"
  \relative c''' { g2.\< f2.\downbow b,4\!(\upbow c f) e(\downbow d c) }
  \relative c''  { e4(\>\upbow d c) f,2\downbow g4(\!\upbow c2.) d2.\fermata\downbow }
}

% ===== Build the repeated violin line once =====
violinRepeated = {
  \clef treble
  \time 3/4
  \tempo "Lent et douloureux"
  \key d \major

  \repeat volta 2 {
    \mRests
    \themeA
    
      \break

    \pedalFs
      \break

    \themeA
      \break

    \pivotToMinor
      \break

    \archUp
      \break

    \archCont
      \break

  }
  \alternative {
    { \endingOne 
      \break
      \tag #'full { \pageBreak } } % full-score-only if you ever include it
    { \endingTwo \bar "|." }
  }
}

\book {
  \bookpart {
    \header { piece = "Violin part" }
    \paper {
      % one page; adjust to taste
      %system-count = 11
      ragged-last-bottom = ##t
      indent = 0
    }
    \score {
      \removeWithTag #'full
      \new Staff  {
        \autoBeamOff
        \violinRepeated
      }
      \layout { \context { \Staff \RemoveEmptyStaves } }
      \midi { }
    }
  }
}

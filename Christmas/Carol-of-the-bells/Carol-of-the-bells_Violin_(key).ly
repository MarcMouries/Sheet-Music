\version "2.24.0"
\include "english.ly"
\header {
  title = "Carol of the Bells"
  subtitle = "Shchedryk (Щедрик)"
  composer = "Mykola Leontovych (1877–1921)"
  poet = "Peter J. Wilhousky"
  country = "Ukraine"
  style = "christmas carol"
}

\include "../../common/common-header.ily"
setStaffElements = {
  \override Staff.Clef.font-size = #-2
  \override Staff.TimeSignature.font-size = #-1
  \override Staff.KeySignature.font-size = #-1.5
  \override Staff.BarLine.hair-thickness = #1
  \override Staff.BarLine.thick-thickness = #5
  \override Staff.MultiMeasureRest.font-size = #-1.5
}

setNoteSize = {
  \override NoteHead.font-size = #-1.5
  \override Script.font-size = #-1.5
  \override Rest.font-size = #-1.5
  \override Accidental.font-size = #-1.5
  \override Dots.font-size = #-1.5
  \override DynamicText.font-size = #-1
}

setLyricSize = { \override LyricText.font-size = #-1.5 }

ten = \markup { \smaller \italic \halign #-0.5 "ten." }
dim = \markup { \smaller \italic "dim." }
rit = \markup { \smaller \italic "rit." }
solo = \markup { "Solo" }
all = \markup { "All" }



\paper {
  paper-width = 8.5\in
  paper-height = 11\in
  left-margin = 0.725\in
  right-margin = 0.725\in
  top-margin = 0.625\in
  bottom-margin = 0.625\in
  
  markup-system-spacing.basic-distance = #10
%  page-count = #3
%  max-systems-per-page = #2
  ragged-last-bottom = ##f
  
  % Define the three document fonts - serif, sans serif, and monospaced
  #(define fonts
     (make-pango-font-tree 
      "Linux Libertine" "Luxi Sans" "Luxi Mono"
       (/ staff-height pt 20)))
}

global = {
  \key g \minor
  \time 3/4
}

sopMusic = \relative c'' {
  \global \clef treble

  bf4->-\mf^\solo a8 bf g4-\ten
  \repeat volta 2 {
    bf-> a8 bf g4-\ten
    bf-\markup { \smaller\dynamic "pp" \italic\smaller "simile" }^\all a8 bf g4
    bf a8 bf g4
    bf-\markup { \smaller\italic "poco cresc." } a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf^\mp a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
    d'4^\mf c8 d bf4
    d^\< c8 d bf4
    d c8 d bf4
    d c8 d bf4-\!
    g'^\f g8 g f( ef)
    d4 d8 d c( bf)
    c4 c8 c d( c)
    g4^\dim g8 g g4
    d8^\mf^\<( e fs g a bf-\!)
    c^\>( d) c4 bf-\!
    d,8^\pp^\<( e fs g a bf-\!)
    c^\>( d) c4 bf-\!
    bf4^\mp a8^\markup { \smaller\italic "poco a poco dim." } bf g4
    bf a8 bf g4
    bf a8 bf g4
    bf a8 bf g4
  }
  \alternative {
    { bf4^\mf^\solo a8 bf g4 }
    { g2.~ g~ g d'4->^\solo c8^\rit[ d] g, r}
  }
}



\score {
  \new Staff {
    %\setStaffElements
    %\setNoteSize 
    \sopMusic
  }
  \layout { }
}

\score {
  \unfoldRepeats \sopMusic
  \midi { \tempo 4 = 184 }
}

\version "2.19.19"
\language "english"
\include "../../stylesheets/stylesheet_fiddle.ly"

\header {
  title = "ii-V-I Lick in D. Em A7 D"
  composer = "Marc Mouries"
  genre = "Exercise"
}

\include "../../common/common-header.ily"

startParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list (car par-list) point-stencil )))
}

endParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list point-stencil (cadr par-list))))
}


chordNames_iiVI = \chordmode {
  d1:m7 g1:7 c1
}
melody_iiVI = \relative c' {
  d8 e( f) a( c4) a8 b( 
  c) d 
    \stemUp b g( f d) b g c4  
}
\markup "Lick ii V I"

targetKey = b

\score {
  
  <<
    \new ChordNames{ \chordNames_iiVI}
    \new Staff     { \melody_iiVI }
  >>
  \layout { }
  \midi { }
}

chordNames = \chordmode {
  e2:m a2:7 d1

}

melody = \relative c' {
  \acciaccatura ds8
  % bf = _"flat 6 of D"
  e8 g b d cs e g bf a8
 fs8 d8 cs d cs a fs
}



%%%%%% Example:

\relative c'' {

a'4
  \override ParenthesesItem.font-size = #5
  \startParenthesis
  \parenthesize fs8
   d8 ~
    \endParenthesis
   \parenthesize d4
  r4
}


words = \lyricmode {
}

\markup "Em"
\score {
  <<
    \new ChordNames{ \chordNames}
    \new Staff     { \melody }
  >>
  \layout { }
  \midi { }
}

\markup "Bm"
\score {
  <<
    \new ChordNames{ \transpose e \targetKey, \chordNames}
    \new Staff     { \transpose e \targetKey, \melody }
  >>
  \layout { }
}

\score {
  <<
    \new ChordNames{ \transpose e g, \chordNames}
    \new Staff     { \transpose e g, \melody }
  >>
  \layout { }
}
\score {
  <<
    \new ChordNames{ \transpose e d \chordNames}
    \new Staff     { \transpose e d \melody }
  >>
  \layout { }
  \midi { }
}
\score {
  <<
    \new ChordNames{ \transpose e a \chordNames}
    \new Staff     { \transpose e a, \melody }
  >>
  \layout { }
  \midi { }
}
\score {
  <<
    \new ChordNames{ \transpose e c \chordNames}
    \new Staff     { \transpose e c \melody }
  >>
  \layout { }
  \midi { }
}%%%% http://lsr.di.unimi.it/LSR/Item?id=972
% added by PPS on Jan. 2015.
%% => https://code.google.com/p/lilypond/issues/detail?id=155
%% => http://lilypond.1069038.n5.nabble.com/Pitched-trill-glissando-tc170876.html
%%
%% The functionality of this snippet is default for 2.19.20


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LSR workaround:
%#(set! paper-alist (cons '("snippet" . (cons (* 210 mm) (* 50 mm))) paper-alist))
\paper {
 % #(set-paper-size "snippet")
%  ragged-right = ##f
}
\markup\vspace #1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\paper {
  indent = 0
}

parentheAll = #(define-music-function (parser location note) (ly:music?)
#{
  \once \override ParenthesesItem.font-size = #-1
  \once \override ParenthesesItem.stencil = #(lambda (grob)
       (let* ((acc (ly:grob-object (ly:grob-parent grob Y) 'accidental-grob))
              (dot (ly:grob-object (ly:grob-parent grob Y) 'dot)))
         (if (not (null? acc)) (ly:pointer-group-interface::add-grob grob 'elements acc))
         (if (not (null? dot)) (ly:pointer-group-interface::add-grob grob 'elements dot))
         (parentheses-item::print grob)))
  \parenthesize $note
#})

\score {
   {
    \mark\markup\small\column {
      \italic "Using:" \vspace #.3
      \typewriter "\parenthesize"
    }
    \parenthesize cs''4.
    s1
    \stopStaff
    s1
    \startStaff
    s4 \bar ""
    \mark\markup\small\column {
      \italic "Using:" \vspace #.3
      \typewriter "\parentheAll"
    }
    \parentheAll cs''!4.
    s1 s4
    \stopStaff
    s1
    \startStaff
    s4 \bar ""
    \tweak extra-offset #'(1 . 1.5)
    \mark\markup\small\column {
      \typewriter "\pitchedTrill"  \vspace #.2
      \italic "context:"
    }
  \pitchedTrill b2\startTrillSpan
  -\tweak minimum-length #10
  -\tweak springs-and-rods #ly:spanner::set-spacing-rods
  -\tweak bound-details.right.Y #-2.7
  -\tweak bound-details.left.padding #3.5
  -\tweak bound-details.right.padding #.8
  \glissando ~ cf'
  \once \omit Staff.Flag
  \once \omit Staff.Stem
  \once \override NoteHead.font-size = #-4
  \once \override NoteHead.X-offset = #-.4
  \grace {  \parentheAll c'!8\stopTrillSpan }
  b8 r8
  }
  \layout {
    \context {
      \Score
      \omit TimeSignature
      \override Clef.transparent = ##t
      \override BarLine.transparent = ##t
      \override RehearsalMark.self-alignment-X = #LEFT
    }
  }
}
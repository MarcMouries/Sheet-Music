\version "2.19.38"
\language "english"

\header {
  title = ""
}

\markup \huge "C minor"
%%
%%
Do_minor = \relative c' {
  c8 d ef g 
  c8 d ef g 
  c8 d ef  c ef c ef  
  
  d c g ef
  d c g ef
  d 
 
}

\score {    \new Staff { \Do_minor }
  \layout { }
}


global = {
  \time 4/4
  \key c \major
}

theChords = { <c ef>2  <ef! g> 
              <b d>    <b d>4 
              <d f>4   <f af>2 (<ef g>2) }

chordNames = \chordmode {
  \global
  
  c2:m ef b:dim b4:dim d4:m f2:m ef2 
}


melody = \relative c' {
  \global
  \theChords
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
}


%________________________
%   __       _           
%  / _\ __ _| |___  __ _ 
%  \ \ / _` | / __|/ _` |
%  _\ \ (_| | \__ \ (_| |
%  \__/\__,_|_|___/\__,_|
%________________________

\markup \bold "Salsa"

salsaMelody = \relative c' {
  ef8 g bf8 af r8 c8 r bf r d r af r c r ef,
  ef8 g bf8 af r8 c8 r bf r d r af r c r ef,
\break
r8 g4 g8 r8 g4 g8
  e8 g[ b8] d8 c8 r8 e8 r8 d8
  r8 g4 g8 r8 g4 g8
}

\score {
  <<
    \new RhythmicStaff
    \with {
      \override VerticalAxisGroup.default-staff-staff-spacing = #'()
    }
    {
      \repeat unfold 4 { s4^1 s^2 s^3 s^4 }
    }
    
    \new Staff {
   
     % \numericTimeSignature
     % \clef percussion
      \set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
      %\override NoteHead #'style = #'slash
      %\override NoteHead #'font-size = #-4

\salsaMelody
    }
  >>
  \layout {
    indent = 0
    \context {
      \RhythmicStaff
      \remove "Time_signature_engraver"
      \remove "Clef_engraver"
      \override BarLine.transparent = ##t
      \override StaffSymbol.line-count = #0
    }
  }
}
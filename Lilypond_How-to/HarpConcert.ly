%=============================================
%
%   Konservatorium Schwerin
%
%   author: Helge Kruse   
%
%=============================================

\version "2.16.0"


#(ly:set-option 'midi-extension "midi") 
#(ly:set-option 'delete-intermediate-files #t)
#(ly:set-option 'point-and-click #f)

#(set-default-paper-size "a4")

%\include "../../Tools/Tools.ily"
%% Bookpart first page and last page predicates
  #(define (not-part-first-page layout props arg)
     (if (= (chain-assoc-get 'page:page-number props -1)
            (ly:output-def-lookup layout 'first-page-number))
         empty-stencil
         (interpret-markup layout props arg)))

  #(define (part-first-page layout props arg)
     (if (= (chain-assoc-get 'page:page-number props -1)
            (ly:output-def-lookup layout 'first-page-number))
         (interpret-markup layout props arg)
         empty-stencil
         ))


\paper {
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##t
  ragged-bottom = ##f  

  oddFooterMarkup = \markup { \on-the-fly #part-first-page \teeny { Notensatz: Helge Kruse } }
  oddHeaderMarkup = \markup \fill-line {
    ""
    \on-the-fly #not-part-first-page \fromproperty #'header:composer
    \on-the-fly #not-part-first-page \fromproperty #'header:title
    \on-the-fly #not-part-first-page \fromproperty #'header:instrument
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup \fill-line {
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
    \on-the-fly #not-part-first-page \fromproperty #'header:instrument
    \on-the-fly #not-part-first-page \fromproperty #'header:title
    \on-the-fly #not-part-first-page \fromproperty #'header:composer
    ""
  }
  
  tocTitleMarkup = \markup \huge \column {
    \hspace #1
    \hspace #1
    \fill-line { \null "Inhaltsverzeichnis" \null }
    \hspace #1
    \hspace #1
  }
  tocItemMarkup = \markup \fill-line {
    \fromproperty #'toc:text \fromproperty #'toc:page
  }
}

changeBeaming = \set beamExceptions =
#'((end . (
((1 . 8) . (2 2 2 2))
((1 . 16) . (4 4 4 4))
((1 . 24) . (3 3 3 3 3 3 3 3))
((1 . 32) . (8 8 8 8))
))) 

revertBeaming = \set beamExceptions = #'() 

hideTuplet = {
  \override TupletNumber #'stencil = ##f
  \override TupletBracket #'bracket-visibility = ##f
}

showTuplet = {
  \revert TupletNumber #'stencil
  \override TupletBracket #'bracket-visibility = ##t
}


%\include "Allegro.ly"
AllegroCornoOne = \relative c'' { c }
AllegroCornoTwo = \relative c'' { c }
AllegroViolinoOne = \relative c'' { c }
AllegroViolinoTwo = \relative c'' { c }
AllegroViola = \relative c'' { c }
AllegroBasso = \relative c' { c }
AllegroHarpRight = \relative c'' { c }
AllegroHarpLeft = \relative c' { c }

%\include "Affettuoso.ly"
AffettuosoFlautoOne = \relative c'' { c }
AffettuosoFlautoTwo = \relative c'' { c }
AffettuosoViolinoOne = \relative c'' { c }
AffettuosoViolinoTwo = \relative c'' { c }
AffettuosoViola = \relative c'' { c}
AffettuosoBasso = \relative c' { c }
AffettuosoHarpRight= \relative c'' { c }
AffettuosoHarpLeft = \relative c' { c }

%\include "AllegroNonTroppo.ly"
AllegroNonTroppoCornoOne = \relative c'' { c }
AllegroNonTroppoCornoTwo = \relative c'' { c }
AllegroNonTroppoViolinoOne = \relative c'' { c }
AllegroNonTroppoViolinoTwo = \relative c'' { c }
AllegroNonTroppoViola = \relative c'' { c }
AllegroNonTroppoBasso = \relative c' { c }
AllegroNonTroppoHarpRight = \relative c'' { c }
AllegroNonTroppoHarpLeft = \relative c' { c }

\book {
  \bookpart {
    \header {
      title = \markup \center-column { " " " " " " " " "Concerto in G" " " "per la Arpa o il Cembalo concertato" " " " " }

\include "../common/common-header.ily"
      subtitle = \markup \center-column { "accompagnate " "da due Violini e Basso," "con due Corni e due Flauti per rinforza" " " " " " " " " }
      dedication = "Giovanni Guglielmo Hertel"
      date = "1727-1789"
      copyright = ##f
    }
    \markuplist \table-of-contents
    \pageBreak
  }
 
  \bookpart {
    \tocItem \markup {Partitur}
    \header {
      title="Concerto per la Arpa"
      composer = "Hertel"
    }

    \tocItem \markup {"   Allegro"}
    \score {
      <<
        \new StaffGroup <<
          \new Staff=CornoOne \with { instrumentName = #"Corno 1" } { \AllegroCornoOne  }
          \new Staff=CornoTwo \with { instrumentName = #"Corno 2" } { \AllegroCornoTwo }
        >>
        \new StaffGroup <<
          \new Staff=ViolinoOne \with { instrumentName = #"Violino 1" } { \AllegroViolinoOne }
          \new Staff=ViolinoTwo \with { instrumentName = #"Violino 2"  }{ \AllegroViolinoTwo }
        >>
        \new Staff=Viola \with { instrumentName = #"Viola" } { \AllegroViola }
        \new Staff=Basso \with { instrumentName = #"Basso" }  { \AllegroBasso }
        \new PianoStaff \with { instrumentName = #"Arpa"  }  <<
          \context Staff=right \AllegroHarpRight
          \context Staff=left \AllegroHarpLeft
        >>
      >>
      \layout {
      }
    } % score allegro

    \tocItem \markup {"   Affettuoso"}
    \score {
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = #"Flauto 1"} { \AffettuosoFlautoOne }
          \new Staff \with { instrumentName = #"Flauto 2" } { \AffettuosoFlautoTwo }
        >>
        \new StaffGroup <<
          \new Staff \with { instrumentName = #"Violino 1" } { \AffettuosoViolinoOne }
          \new Staff \with { instrumentName = #"Violino 2" } { \AffettuosoViolinoTwo }
        >>
        \new Staff \with { 	instrumentName = #"Viola" } { \AffettuosoViola }
        \new Staff \with { 	instrumentName = #"Basso" } { \AffettuosoBasso }
        \new PianoStaff \with { instrumentName = #"Arpa" } <<
          \context Staff=right \AffettuosoHarpRight
          \context Staff=left \AffettuosoHarpLeft
        >>
      >>
      \layout {
      }
    } % score affettuoso

    \tocItem \markup {"   Allegro non troppo"}
    \score {
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = #"Corno 1" } { \AllegroNonTroppoCornoOne }
          \new Staff \with { instrumentName = #"Corno 2" } { \AllegroNonTroppoCornoTwo }
        >>
        \new StaffGroup <<
          \new Staff \with { instrumentName = #"Violino 1" } { \AllegroNonTroppoViolinoOne }
          \new Staff \with { instrumentName = #"Violino 2"  } { \AllegroNonTroppoViolinoTwo }
        >>
        \new Staff \with { 	instrumentName = #"Viola" } { \AllegroNonTroppoViola }
        \new Staff \with { 	instrumentName = #"Basso" } { \AllegroNonTroppoBasso }
        \new PianoStaff \with { instrumentName = #"Arpa" } <<
          \context Staff=right \AllegroNonTroppoHarpRight
          \context Staff=left \AllegroNonTroppoHarpLeft
        >>
      >>
      \layout {
      }
    } % score allegro non troppo

  } % bookpart
%%{
  %%%%% Bläser %%%%%
  
  \bookpart {
    \tocItem \markup {Corno 1}
    \paper { ragged-last-bottom = ##t }
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Corno 1" }
    \score { \new Staff=CornoOne { \compressFullBarRests \tempo Allegro \AllegroCornoOne }
             \layout { \context { \Score \override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 16) } }
    }
    \pageBreak
    \score { \new Staff=CornoOne { \compressFullBarRests \tempo "Allegro non troppo" \AllegroNonTroppoCornoOne } 
             \layout { \context { \Score \override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 16) } }
    }
  }

  \bookpart {
    \tocItem \markup {Corno 2}
    \header {
      title = "Concerto per la Arpa" composer = "Hertel"       instrument = "Corno 2" }
    \score { \new Staff { \compressFullBarRests \tempo Allegro \AllegroCornoTwo }
             \layout { \context { \Score \override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 16) } }
    }
    \pageBreak
    \score { \new Staff { \compressFullBarRests \tempo "Allegro non troppo" \AllegroNonTroppoCornoTwo } 
             \layout { \context { \Score \override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 16) } }
    }
  }
  
  \bookpart {
    \tocItem \markup {Flauto 1}
    \paper { ragged-last-bottom = ##t }
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Flauto 1" }
    \score { \new Staff { \compressFullBarRests \tempo Affettuoso \AffettuosoFlautoOne } }
  }
  
  \bookpart {
    \tocItem \markup {Flauto 2}
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Flauto 2" }
    \score { \new Staff { \compressFullBarRests \tempo Affettuoso \AffettuosoFlautoTwo } }
  }

  %%%% Streicher %%%%%

  \bookpart {
    \tocItem \markup {Violino 1}
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Violino 1" }
    \score { \new Staff { \compressFullBarRests \tempo Allegro \AllegroViolinoOne } }
    \score { \new Staff { \compressFullBarRests \tempo Affettuoso \AffettuosoViolinoOne } }
    \score { \new Staff { \compressFullBarRests \tempo "Allegro non troppo" \AllegroNonTroppoViolinoOne } }
  }

  \bookpart {
    \tocItem \markup {Violino 2}
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Violino 2" }
    \score { \new Staff { \compressFullBarRests \tempo Allegro \AllegroViolinoTwo } }
    \score { \new Staff { \compressFullBarRests \tempo Affettuoso \AffettuosoViolinoTwo } }
    \score { \new Staff { \compressFullBarRests \tempo "Allegro non troppo" \AllegroNonTroppoViolinoTwo } }
  }

  \bookpart { 
    \tocItem \markup {Viola}
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Viola" }
    \score { \new Staff { \compressFullBarRests \tempo Allegro \AllegroViola } }
    \score { \new Staff { \compressFullBarRests \tempo Affettuoso \AffettuosoViola } }
    \score { \new Staff { \compressFullBarRests \tempo "Allegro non troppo" \AllegroNonTroppoViola } }
  }

  \bookpart { 
    \paper {
      ragged-last-bottom = ##f
    }
    \tocItem \markup {Basso}
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Basso" }
    \score { \new Staff { \compressFullBarRests \tempo Allegro \AllegroBasso } }
    \score { \new Staff { \compressFullBarRests \tempo Affettuoso \AffettuosoBasso } }
    \score { \new Staff { \compressFullBarRests \tempo "Allegro non troppo" \AllegroNonTroppoBasso } }
  }

  %%%%% Harfe %%%%%
  
  \bookpart {
    \tocItem \markup {Harpa}
    \header { title = "Concerto per la Arpa" composer = "Hertel" instrument = "Arpa" }
    \tocItem \markup {"   Allegro"}
    \score {
      <<
        \context PianoStaff <<
          \context Staff = right <<
            \context Voice = AllegroHarpRight \AllegroHarpRight
            \set Staff.instrumentName = #""
            \set Staff.shortInstrumentName = #""
          >>
          \context Staff = left <<
            \context Voice = AllegroHarpLeft \AllegroHarpLeft
            \set Staff.instrumentName = #""
            \set Staff.shortInstrumentName = #""
          >>
        >> %end of PianoStaffA
      >>
      %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
      %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
      %% If you want the Eulenburg/Lilypond style, comment out the following line:
      \layout {
        \context {
          \Score
          \consists Span_bar_engraver
          \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 16)
        }
      }
    }%% end of score-block 

    \tocItem \markup {"   Affettuoso"}
    \score {
      \context PianoStaff <<
        \context Staff=right {
          \context Voice=AA \AffettuosoHarpRight
        }
        \context Staff=left {
          \context Voice=AB \AffettuosoHarpLeft
        }
      >>
      \layout {
        \context { \Score \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 16)  }
      }
    }

    \tocItem \markup {"   Allegro non troppo"}
    \score {
      \context PianoStaff <<
        \context Staff=right {
          \context Voice=AA \AllegroNonTroppoHarpRight
        }
        \context Staff=left {
          \context Voice=AB \AllegroNonTroppoHarpLeft
        }
      >>
      \layout {
        \context {\Score \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 16)  }
      }
    } % score
  } % bookpart

  \score {
    \new StaffGroup <<
      \new Staff { 
        \set Staff.midiInstrument = "french horn" \AllegroCornoOne  s1
        \set Staff.midiInstrument = "flute" \AffettuosoFlautoOne s2.*2
        \set Staff.midiInstrument = "french horn" \AllegroNonTroppoCornoOne
      }
      \new Staff { 
        \set Staff.midiInstrument = "french horn" \AllegroCornoTwo s1
        \set Staff.midiInstrument = "flute" \AffettuosoFlautoTwo s2.*2
        \set Staff.midiInstrument = "french horn" \AllegroNonTroppoCornoTwo
      }
      \new Staff { \set Staff.midiInstrument = "violin" \AllegroViolinoOne s1 \AffettuosoViolinoOne s2.*2 \AllegroNonTroppoViolinoOne }
      \new Staff { \set Staff.midiInstrument = "violin" \AllegroViolinoTwo s1 \AffettuosoViolinoTwo s2.*2 \AllegroNonTroppoViolinoTwo }
      \new Staff { \set Staff.midiInstrument = "viola" \AllegroViola s1 \AffettuosoViola s2.*2 \AllegroNonTroppoViola }
      \new Staff { \set Staff.midiInstrument = "contrabass" \AllegroBasso s1 \AffettuosoBasso s2.*2 \AllegroNonTroppoBasso }
      \new PianoStaff <<
        \set PianoStaff.midiInstrument = "orchestral harp"
        \new Staff = right {
          \AllegroHarpRight s1 \AffettuosoHarpRight s2.*2 \AllegroNonTroppoHarpRight
        }
        \new Staff = left {
          \AllegroHarpLeft s1 \AffettuosoHarpLeft s2.*2 \AllegroNonTroppoHarpLeft
        }
      >> %end of PianoStaffA
    >>
    \midi { }
  }
%}
} %% end of book-block

#(set-global-staff-size 20)

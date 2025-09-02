\version "2.19.1"



#(set-global-staff-size 24)


date = #(strftime "%d-%m-%Y" (localtime (current-time)))



\paper {
  #(define (print-positive-page-number layout props arg)
     (if (> (chain-assoc-get 'page:page-number props -1) 0)
         (create-page-number-stencil layout props arg)
         empty-stencil))
  
  #(define (not-last-page layout props arg)
     (if (and (chain-assoc-get 'page:is-bookpart-last-page props #f)
              (chain-assoc-get 'page:is-last-bookpart props #f))
         empty-stencil
         (interpret-markup layout props arg)))
  
  print-all-headers = ##f
  first-page-number = -1
  tocItemMarkup = \tocItemWithDotsMarkup
  oddHeaderMarkup = \markup \fill-line { " " }
  evenHeaderMarkup = \oddHeaderMarkup
  oddFooterMarkup = \markup \fill-line { \column { \fontsize #-1
    \on-the-fly #not-first-page \on-the-fly #not-last-page 
    \on-the-fly #print-positive-page-number \fromproperty #'page:page-number-string
    \on-the-fly #last-page \fromproperty #'header:tagline
  } }
  evenFooterMarkup = \oddFooterMarkup
}

\header {
  title = \markup {
    \lower #50 \left-align \center-column { 
      \fontsize #4 \bold "Learn Violin with Famous Themes"
    }
  }
  subtitle = \markup {
    \lower #4 \left-align \center-column { 
      \fontsize #1 \bold "Marc Mouries"
    }
  }
  tagline = \markup {
    \fontsize #-3.5 {
      \override #'(box-padding . 1.0) \override #'(baseline-skip . 2.7) \box \center-column {
        \line {
          Engraved on \date using \with-url #"http://lilypond.org/"
          \line {
            LilyPond \simple #(lilypond-version) (http://lilypond.org/)
          }
        }
      }
    }
  }
}

\pageBreak

\markuplist \table-of-contents
\markup \null


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FUR ELISE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Fur Elise.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header { 
    title = \markup { \fromproperty #'toc:number "Fur Elise" } % overrides overall title
    subtitle = ##f % prevent overall subtitle from appearing
    composer = "L. V. Beethoven (1770--1827)"
  }
  \tocItem \markup { "Beethoven -  Fur Elise" }
  
  \FurElise
  \markup "Play it an octave lower to stretch the first finger."

 \relative c' {
   \time 3/8
 \partial 8 e16\pp^\markup { \bold "Poco moto." } ds 
 e ds e b d c a8 
 r16 r e'16 ds 
 e ds e b d c a8 
}

}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\include "Ode to Joy.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header { 
    title = \markup { \fromproperty #'toc:number "Ode to Joy" } % overrides overall title
    subtitle = ##f % prevent overall subtitle from appearing
    composer = "L. V. Beethoven (1770--1827)"
  }
  \tocItem \markup { "Beethoven - Ode to Joy" }
  \OdeToJoy
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MOZART
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Mozart-Wolfgang-Amadeus-Symphony-No-40-in-G-minor-K-550.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header { 
    title = \markup { \fromproperty #'toc:number "Symphony No 40 in G minor" } % overrides overall title
    subtitle = ##f % prevent overall subtitle from appearing
    composer = "Mozart"
  }
  \tocItem \markup { "Mozart - Symphony No 40 in G minor" }
  \Mozart_Symphony_No_Forty_in_G_minor
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "L'Apprenti Sorcier.ly"


\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header { 
    title = \markup { \fromproperty #'toc:number "L'Apprenti Sorcier / The Sorcerer's Apprentice" } % overrides overall title
    subtitle = ##f % prevent overall subtitle from appearing
    composer = "Paul Dukas"
  }
  \tocItem \markup { "L'Apprenti Sorcier / The Sorcerer's Apprentice" }
  \The_Sorcerers_Apprentice
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\include "Bach_Brandenburg Concerto No. 3.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header { 
    title = \markup { \fromproperty #'toc:number "Brandenburg Concerto No. 3" } % overrides overall title
    subtitle = ##f % prevent overall subtitle from appearing
    composer = "J. S. Bach"
  }
  \tocItem \markup { "Brandenburg Concerto No. 3" }
  \Bach_Brandenburg_Concerto_Three
}





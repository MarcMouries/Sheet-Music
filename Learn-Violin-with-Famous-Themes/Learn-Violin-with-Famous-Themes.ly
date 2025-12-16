\version "2.19.1"

% Flag to indicate we're compiling a book (not standalone files)
compilingBook = ##t

#(set-global-staff-size 24)


date = #(strftime "%d-%m-%Y" (localtime (current-time)))



\paper {
  #(define (print-positive-page-number layout props arg)
     (if (> (chain-assoc-get 'page:page-number props -1) 0)
         (interpret-markup layout props arg)
         empty-stencil))

  #(define (not-first-page layout props arg)
     (if (= (chain-assoc-get 'page:page-number props -1) 1)
         empty-stencil
         (interpret-markup layout props arg)))

  #(define (not-last-page layout props arg)
     (if (and (chain-assoc-get 'page:is-bookpart-last-page props #f)
              (chain-assoc-get 'page:is-last-bookpart props #f))
         empty-stencil
         (interpret-markup layout props arg)))

  #(define (last-page layout props arg)
     (if (and (chain-assoc-get 'page:is-bookpart-last-page props #f)
              (chain-assoc-get 'page:is-last-bookpart props #f))
         (interpret-markup layout props arg)
         empty-stencil))
  
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
    \center-column {
      \fontsize #6 \bold "Learn Violin with Famous Themes"
    }
  }
  subtitle = \markup {
    \center-column {
      \vspace #2
      \fontsize #2 \bold "Marc Mouries"
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

% Title page in its own bookpart
\bookpart {
  \header {
    title = ##f
    composer = ##f
    subtitle = ##f
  }
  \paper {
    print-page-number = ##f
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
  }
  \markup \vspace #8
  \markup {
    \fill-line {
      \center-column {
        \fontsize #4 \bold "Learn Violin with Famous Themes"
        \vspace #3
        \fontsize #2 "Marc Mouries"
        \vspace #2
        \fontsize #0 "Ordered by Difficulty Level"
      }
    }
  }
}

% Table of Contents page
\bookpart {
  \header {
    title = ##f
    composer = ##f
    subtitle = ##f
  }
  \paper {
    print-page-number = ##f
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
  }
  \markuplist \table-of-contents
  \markup \null
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. ODE TO JOY - Level 1 - Beginner
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Beethoven_Ode-to-Joy.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Ode to Joy" }
    subtitle = ##f
    composer = "L. V. Beethoven (1770–1827)"
  }
  \tocItem \markup { "1. Beethoven - Ode to Joy (Level 1)" }
  \Beethoven_OdeToJoy
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. MINUET IN G - Level 1-2 - Beginner
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Beethoven_Minuet-in-G.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Minuet in G" }
    subtitle = ##f
    composer = "L. V. Beethoven (1770–1827)"
  }
  \tocItem \markup { "2. Beethoven - Minuet in G (Level 1-2)" }
  \Beethoven_MinuetInG
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3. MOZART EINE KLEINE NACHTMUSIK - Level 2 - Early Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Mozart_Eine-kleine-Nachtmusik.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Eine kleine Nachtmusik" }
    subtitle = ##f
    composer = "Wolfgang Amadeus Mozart"
  }
  \tocItem \markup { "3. Mozart - Eine kleine Nachtmusik (Level 2)" }
  \Mozart_Nachtmusik
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4. MOZART SYMPHONY NO. 40 - Level 2 - Early Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Mozart_Symphony-No-40-in-G-minor-K-550.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Symphony No 40 in G minor" }
    subtitle = ##f
    composer = "Mozart"
  }
  \tocItem \markup { "4. Mozart - Symphony No 40 (Level 2)" }
  \MozartSymphony
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5. PACHELBEL CANON IN D - Level 2-3 - Early Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Pachelbel_Canon-in-D.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Canon in D" }
    subtitle = ##f
    composer = "Johann Pachelbel"
  }
  \tocItem \markup { "5. Pachelbel - Canon in D (Level 2-3)" }
  \Pachelbel_Canon
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 6. FÜR ELISE - Level 2-3 - Early Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Beethoven_Fur-Elise.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Für Elise" }
    subtitle = ##f
    composer = "L. V. Beethoven (1770–1827)"
  }
  \tocItem \markup { "6. Beethoven - Für Elise (Level 2-3)" }
  \Beethoven_FurElise
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
%% 7. BIZET TOREADOR SONG - Level 2-3 - Early Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Bizet_Toreador-Song.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Toreador Song" }
    subtitle = ##f
    composer = "Georges Bizet"
  }
  \tocItem \markup { "7. Bizet - Toreador Song from Carmen (Level 2-3)" }
  \Bizet_Toreador
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 8. VIVALDI SPRING - Level 3 - Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Vivaldi_Spring.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Spring (La Primavera)" }
    subtitle = ##f
    composer = "Antonio Vivaldi"
  }
  \tocItem \markup { "8. Vivaldi - Spring from Four Seasons (Level 3)" }
  \Vivaldi_Spring
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 9. MOZART RONDO ALLA TURCA - Level 3 - Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Mozart_Rondo-alla-Turca.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Rondo alla Turca" }
    subtitle = ##f
    composer = "Wolfgang Amadeus Mozart"
  }
  \tocItem \markup { "9. Mozart - Rondo alla Turca (Level 3)" }
  \Mozart_Rondo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 10. L'APPRENTI SORCIER - Level 3 - Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "L'Apprenti-Sorcier.ly"


\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "L'Apprenti Sorcier / The Sorcerer's Apprentice" }
    subtitle = ##f
    composer = "Paul Dukas"
  }
  \tocItem \markup { "10. Dukas - L'Apprenti Sorcier (Level 3)" }
  \Dukas_Sorcerer
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 11. SHOSTAKOVICH WALTZ NO 2 - Level 3-4 - Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Shostakovich_Waltz-No-2.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Waltz No. 2" }
    subtitle = ##f
    composer = "Dmitri Shostakovich"
  }
  \tocItem \markup { "11. Shostakovich - Waltz No. 2 (Level 3-4)" }
  \Shostakovich_Waltz
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 12. BRANDENBURG CONCERTO NO. 3 - Level 3-4 - Intermediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Bach_Brandenburg-Concerto-No-3.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Brandenburg Concerto No. 3" }
    subtitle = ##f
    composer = "J. S. Bach"
  }
  \tocItem \markup { "12. Bach - Brandenburg Concerto No. 3 (Level 3-4)" }
  \Bach_Brandenburg_Concerto_Three
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 13. BADINERIE - Level 4-5 - Advanced
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "Bach_Badinerie.ly"

\bookpart {
  \paper {
    print-page-number = ##t
  }
  \header {
    title = \markup { \fromproperty #'toc:number "Badinerie" }
    subtitle = ##f
    composer = "J. S. Bach"
  }
  \tocItem \markup { "13. Bach - Badinerie (Level 4-5)" }
  \Bach_Badinerie
}

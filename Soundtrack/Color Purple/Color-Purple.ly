\version "2.19.54"
\language "english"

%\include "paganini.ily"
%\include "lv-goldenage.ily"
%\include "improviso.ily"
\include "../../common/violin-functions.ly"

triplet =
#(define-music-function (notes) (ly:music?)
   #{ \tuplet 3/2 { #notes } #})


% \paper {
%   #(define fonts
%     (set-global-fonts
%     #:music "lilyboulez"
%     #:brace "emmentaler"
%     #:roman "copperplate"
%     #:sans "Helvetica"
%     #:typewriter "Andale Mono"
%     #:factor (/ staff-height pt 20)
%   ))
% }

\header {
  title = "Color Purple"
  subtitle = "from The Color Purple (1985)"
  composer = "Quincy Jones"
  country = "USA"
  arranger = "transcription by Maxence Mouriès"
  style = "soundtrack"
  tagline = ""
}

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
%  between-system-space = 2.5\cm
%  between-system-padding = 2\cm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 0)
                             (minimum-distance . 8)
                             (padding . 10))
 % vertical spacing
 system-system-spacing =
    #'((basic-distance . 16)
       (minimum-distance . 12)
       (padding . 1)
       (stretchability . 60))

  % Custom title formatting - pulls from header fields above
  bookTitleMarkup = \markup {
    \fill-line {
      \fontsize #-5
      \column {
        \line { "Transcription" }
        \line { "by Maxence Mouriès" }
      }
      \center-column {
        \fontsize #1 \fromproperty #'header:title
        \fontsize #-5 "As played by Itzhak Perlman"
      }
      \fontsize #-5
      \column {
        \fromproperty #'header:composer
        \line { "arr. " \fromproperty #'header:arranger }
      }
    }
  }
}



global = {
  \time 6/8
  \key a \major
}

break = \break
%break = {}

orchestraNotes = \relative c''{
   cs8  a   cs     a    cs   a 
   b8   gs  b      gs   b    gs
   cs8  a   cs     a    cs   a 
   b8   gs  b      gs   b    gs
}

violinNotes = \relative c' {
  \global
  <>_\markup \tiny { orchestra }
  \cueDuring #"orchestra" #DOWN {  
    r4. r4. r4. r4.  
    r4. r4. r4. r4.  
  }
   \break
  r4. r4 e8 e'4-2( a8-4) fs4( b8) a4. e 
  e4( a8) fs4( d8) e2.
  \break
  cs4-1( fs8) e4( b8-\shift-1) 
  d cs4  a8. cs,16 fs a 
  b8-1 cs-\shift-1 d cs4 fs8 
  e2.
  \break
 fs4 gs8 a8. gs16 fs8 
 e4. cs4.
 fs8 gs a cs8. b16 a8 
 gs4 e8 fs4.
 \break
 fs8. gs16 a8 cs8 b a 
 gs8. e16 gs,8 fs'4 b,8-\shift-1 
 b cs d \acciaccatura {cs16 d } cs4 b8
 %%
 \set beatStructure = 2,2,2
 cs8( a8-0 cs8 a8 cs8 a8 )
 \break
 b8( gs b gs) b'8( gs)
 a8( fs a) fs d'-4 
 cs cs b b a a b 
 cs b e a,-3 gs fs 
 \break
 cs' e,-0 d cs a' b, 
 a gs fs' e16 d cs8 b 
 a gs e' fs, e d 
 \tuplet 3/2{cs8 d cs } \tuplet 3/2{b cs d}  \tuplet 3/2{e fs gs} 
 \break
 \tuplet 3/2{gs a gs}  \tuplet 3/2{fs cs' b} \tuplet 3/2{b e, d} \tuplet 3/2{cs8 b gs' }
 \tuplet 3/2{a b cs }  \tuplet 3/2{d e fs }  \tuplet 3/2{gs a cs,} \tuplet 3/2{cs'8-1 d e-1 }
 \tuplet 3/2{fs gs a}
 \key g \major b2.( 
 \break
 b16) a g fs e2(
 e16) g fs e d2(
 d16) c b a g4. r8  
 r4. r4. 
 \break
}

\addQuote "orchestra" { \orchestraNotes }

\score {
    \new Staff { \violinNotes }
\layout {
  
  \context { \Score  
%\override Fingering #'font-size = #'-2 
%\override Fingering #'font-encoding = #'latin1
 % \override Fingering #'font-family = #'serif
  %\override Fingering #'font-shape  = #'italic 
  }
}
\midi {}
}
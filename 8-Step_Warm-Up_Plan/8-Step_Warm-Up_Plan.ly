\version "2.24.4"
\language "english"
\include "./markups.ly"

\header {
  title = "8-Step Warm-Up Plan"
  tagline = ""
}

\paper {
  indent = 0
  
  % make book-level title larger
  bookTitleMarkup =  \markup \column {
    \fill-line { \fontsize #8 \bold \fromproperty #'header:title }
  }
  
  % turn off the score title
  scoreTitleMarkup = \markup \null
}

  



\layout { }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SECTION TITLE
#(define-markup-command (section-title layout props title) (markup?)
  (interpret-markup layout props
   (markup #:column (#:vspace 1.5
                    (#:fontsize 2 #:bold #:smallCaps  title)
                     #:vspace 0.75))))


#(define-markup-command (section-titleA layout props title) (markup?)
  (interpret-markup layout props
   (markup
     #:column (
       #:vspace 1.5
       #:fill-line (#:fontsize 3 #:bold #:smallCaps  title)
       #:vspace 0.8))))


%%%% ── Tiny helpers that \section uses
#(define (add-no-page-break parser)
  (collect-music-for-book
    (make-music 'Music
                'page-marker #t
                'page-break-permission 'forbid)))

#(define (add-toplevel-markup parser text)
  (collect-scores-for-book (list text)))

#(define (add-toc-item parser markup-symbol text)
  (collect-music-for-book
    (add-toc-item! markup-symbol text)))

section = #(define-music-function (title) (string?)
  (add-toc-item (*parser*) 'tocSectionMarkup title)
  (add-toplevel-markup (*parser*)
    (markup #:section-title (string-upcase title)))
  (add-no-page-break (*parser*))
  (make-music 'Music 'void #t))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE MATERIAL — using quoted identifiers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



"ex2a" = \relative c'' { \clef treble \time 4/4 c8^\downbow c^\upbow c^\downbow c^\upbow  c^\downbow c^\upbow c^\downbow c^\upbow | }
"ex2b" = \relative c'' { \clef treble \time 4/4 c8 d e f  g a b c | d8 e f g  a b c d | e8 f g a  g f e d | c4( b8) r8 r2 | }

% "ex3c_d_major" = \relative d' { \clef treble \time 4/4 \key d \major d8( fs e g)  fs4  e8( g fs a) g4 | }
% "ex3c_c_major" = \relative c' { \clef treble \time 4/4 \key c \major c8( e d f)  e4  d8( f e g) f4 | }
% 
% "ex4a_whistler" = \relative c' { \clef treble \time 3/4 c8( d c d c d) | c8( d e f e d) | }
% "ex4c_dounis" = \relative c'' { \clef treble \time 3/4 c8 d e g e d | d8 e f a f e | }
% 
% "ex5" = \relative c'' { \clef treble \time 4/4 \key c \minor r4 c2 r4 | r8 c c c  r c c c | }
% 
% "ex6a_sevcik" = \relative c'' { \clef treble \time 3/4 c8 d c b a b | a8 g a g f g | }
% "ex6b_ricci" = \relative c'' { \clef treble \time 4/4 c16 d e f  g a b c  d e f g  a b c d | }
% "ex6c_glaser" = \relative c' { \clef alto \time 4/4 \key bf \major <bf d gf a>2 <a c ef fs>2 | }
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SCORE WITH SECTION MACRO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section "1) Silent finger exercises"

\markup \italic "Example 1a: Flesch Urstudien"
"ex1a" = \relative c'' { \clef treble \time 4/4 <c g>1 | <b f>1 | <d a>1 | <c g>1 | }
\score { \new Staff { \"ex1a" } }


\markup \concat {\bold "Example 1b:" \italic " Dounis Daily Dozen"}
"ex1b_a" = \relative c'' { \clef treble \time 4/4  c8 b c d  e d c b | }
\score { \new Staff { \"ex1b_a"  } }

"ex1b_b" = \relative c'' { \clef treble \time 4/4  c8 d e f  g f e d | }
\score { \new Staff { \"ex1b_b" } }

\markup \concat {\bold "Example 1c:" \italic " Dounis' Daily Dozen"}
"ex1b_c" = {
\repeat volta 4 <<
  \relative c'' { f8-1 c-2 f c }
  \\
  \relative c'  { d8-4 g-3 d g }
>>
}

\score {
  \"ex1b_c"
  \layout {
    \context {
      \Score
      % add horizontal space between notes
       \override SpacingSpanner.spacing-increment = #3.0
      % or uniform even spacing:
       \override SpacingSpanner.uniform-stretching = ##t
    }
  }
}



\section "1) C. Bow-lilting exercise"

\section "2) Long tones & slow finger work"
\markup "bow control before mirror; add vibrato."
\score { \new Staff { \"ex2a" } }
\score { \new Staff { \"ex2b" } }

\section "3) Shifting"
%\markup "Flesch scales, Lukacs, Dounis op.12 or 25."

\markup \smallCaps "One-octave Flesch Scale System scale"
"ex3a" = \relative g' {
  \time 3/4 
  g4( a8 b) a4 | g4( a) g | a4( b8 c) b4 | a4( b) a | }
\score { \new Staff { \"ex3a" } }

\markup \concat {\bold "EXAMPLE 3b:" \italic " Ricci Left-Hand Violin Technique, exercise 80b"}

"ex3b_ricci" = \relative d' { 
  \clef treble \time 4/4 
  \key a \major 
  %a16  cs  b
  a16[  b   cs-3  d-3  e  fs  gs-2 a-2  b   cs  d  e  fs  gs-3 a-3  b   cs  d  e  fs  gs 
  a16  gs  fs  e  d  cs  b 
  a16  gs  fs  e  d  cs  b 
  a16  gs  fs  e  d  cs  b a]
}
\score { \new Staff { \"ex3b_ricci" } }

%\score { \new Staff { << \"ex3c_d_major" \"ex3c_c_major" >> } }

dounis_shifting = 
\relative c' { 
  \cadenzaOn
  \stemDown
   c2_3 (c8_2[ c_1 c_2 c_3]) \bar "|"
   d2_4 (d8_3[ d_2 d_1 d_2 d_3]) \bar "|"
   e2_4 (e8_3[ e_2 e_1 e_2 e_3]) \bar "|"
   
}
\score { \new Staff { \dounis_shifting } }

\section "4) Strength / stretching – Whistler, Flor, Dounis 1."
% \score { \new Staff { \"ex4a_whistler" } }
% \score { \new Staff { \"ex4c_dounis" } }
% 
\section "5) Tone & string-crossing"
\markup " – Dounis 11 or similar."
% \score { \new Staff { \"ex5" } }
% 
\section "6) Three-octave scales & arpeggios"
% \score { \new Staff { \"ex6a_sevcik" } }
% \score { \new Staff { \"ex6b_ricci" } }
% \score { \new Staff { \"ex6c_glaser" } }
% 
\section "7) Double-stops"

\markup \concat {\bold "Example: " \italic " Roland Vamos: Pattern I"}

vamos_double_stops_I_A = {
\repeat volta 4 <<
  \relative c'' { c2 e4( c4)}
  \\
  \relative c'  { e4( g4) g2   }
>>
}
vamos_double_stops_I_B = {
\repeat volta 4 <<
  \relative c'' { c2 e2}
  \\
  \relative c'  { e8( g8 e8 g8)   e8( g8 e8 g8)   }
>>
}

\score {
{ \vamos_double_stops_I_A    \vamos_double_stops_I_B }
}

\markup \concat {\bold "Example: " \italic " Roland Vamos: Pattern IV"}

vamos_double_stops_IV_A = {
<<
  \relative c'' { b2-1 c4( b4)}
  \\
  \relative c''  { g4_3( a4) a2   }
>>
}

vamos_double_stops_IV_B = {
<<
  \relative c'' { b2 c2}
  \\
  \relative c''  { g8( a8 g8 a8)   g8( a8 g8 a8)   }
>>
}
vamos_double_stops_IV_C = {
<<
  \relative c'' { b8( c8 b8 c8)   b8( c8 b8 c8)}
  \\
  \relative c''  { g2 a2   }
>>
}

\score {
{ \vamos_double_stops_IV_A   
  \vamos_double_stops_IV_B
  \vamos_double_stops_IV_C

}
}



\markup "Trott"
"ex7a_trott" = \relative c'' { \clef treble \time 2/4 <d fs>8( <e g>) <fs a>4 | }
 \score { \new Staff { \"ex7a_trott" } }


\markup "Korgueff"
"ex7b_korgueff" = \relative c'' { \clef treble \time 3/4 <c e>4( <d f> <e g>) | <f a>( <e g> <d f>) | }
\score { \new Staff { \"ex7b_korgueff" } }



\markup "Sevcik"
"ex7c_sevcik" = \relative c'' { \clef treble \time 2/4 c16( e g c)  d,( fs a d) | }
\score { \new Staff { \"ex7c_sevcik" } }

\markup "Dounis"
"ex7d_dounis" = \relative c' { \clef treble \time 2/4 <g d' g>8 <g d' g> <a e' a> <a e' a> | }
\score { \new Staff { \"ex7d_dounis" } }

\markup "Ricci"
"ex7e_ricci" = \relative c'' { \clef treble \time 2/4 <c e>8 <cs f> <d fs> <ef g> | }
\score { \new Staff { \"ex7e_ricci" } }


\section "8) Strategic etude or passagework"
\markup "Mazas, Kreutzer, Rovelli etc."

\markup \italic "Add your current passage or an etude targeting today's focus (e.g., Kreutzer 2, 7, 9)."

\version "2.24.4"
\language "english"
\include "../common/markups.ly"

\header {
  title = "8-Step Warm-Up Plan"
    composer = "Marc Mouries"
  genre = "Exercise"
}

\include "../common/common-header.ily"

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
% TEXT HELPERS — from Eight-Step-Warm-Up-Plan_v2.ly
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#(define-markup-command (paragraph layout props items) (markup-list?)
   (interpret-markup layout props
                     (make-override-markup
                      '(baseline-skip . 2.8)
                      (make-wordwrap-markup items))))

#(define-markup-command (paragraphIndent layout props items) (markup-list?)
   (interpret-markup layout props
                     (make-translate-markup
                      (cons 6 0)
                      (make-override-markup
                       '(baseline-skip . 2.8)
                       (make-wordwrap-markup items)))))

#(define-markup-command (code layout props s) (string?)
   (interpret-markup layout props (markup #:typewriter s)))

spaceSm = \markup { \vspace #1.6 }

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

\markup \column {
  \paragraph {
    "Such as " \italic "Ursstudien" " (EXAMPLE 1a) (violists might avoid "
    \italic "Ursstudien" " exercise 1B); "
    \italic "Dounis Daily Dozen" " exercise 1 (EXAMPLE 1b)."
  }
  \paragraph {
    "After a few moments spent with the bow-tilting exercise (EXAMPLE 1c), "
    "these could be done simultaneously with the Gingold anecdotal "
    \italic "One Minute Bow" "."
  }
}

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

\markup \column {
  \paragraph {
    "Played with smooth bow change exercise (EXAMPLE 2a) before a mirror "
    "to check bow's contact point, then various left-hand finger exercises "
    "played slowly for intonation accuracy, especially combinations such as "
    "0–1, 0–2 etc., all with vibrato once intonation is secure."
  }
  \spaceSm
  \paragraphIndent {
    "Choose from materials such as "
    \italic "Sitt Practical Viola Method" ", "
    \italic "Dancla School of Velocity op.74" ", "
    \italic "Wreede Violaerobics" " (EXAMPLE 2b), "
    \italic "Schradieck vol.1" ", "
    \italic "Sevcik op.1 parts 1–3" "."
  }
}
\score { \new Staff { \"ex2a" } }
\score { \new Staff { \"ex2b" } }

\section "3) Shifting"

\markup \column {
  \paragraph {
    "One-octave " \italic "Flesch Scale System" " scales, arpeggios, broken thirds; "
    \italic "Sevcik op.8, Lukács 10 Exercises in Change of Position" " (EXAMPLE 3a), "
    \italic "Ricci Left-Hand Violin Technique" " (EXAMPLE 3b), "
    \italic "Dounis op.12" " (EXAMPLE 3c), "
    \italic "op.25 or Daily Dozen" " (EXAMPLE 3d)."
  }
}

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

\section "4) Strength / Stretching"

\markup \column {
  \paragraph {
    \italic "Whistler" " exercise (EXAMPLE 4a), "
    \italic "Flor" " exercise (EXAMPLE 4b), "
    \italic "Dounis Daily Dozen" " exercise 1 (EXAMPLE 4c) through fourth position "
    "with very slow bow and drone."
  }
}
% \score { \new Staff { \"ex4a_whistler" } }
% \score { \new Staff { \"ex4c_dounis" } }

\section "5) Tone / String Crossings"

\markup \column {
  \paragraph {
    \italic "Dounis Daily Dozen" " exercise 11 (EXAMPLE 5), or similar made-up "
    "exercises with different double-stops, played very slowly with vibrato, and with "
    "dynamic plan of crescendo from " \code "pp" " to " \code "ff"
    " on the down-bow and the reverse on the up-bow."
  }
}
% \score { \new Staff { \"ex5" } }

\section "6) Scales & Arpeggios"

\markup \column {
  \paragraph {
    "Three-octave scales and arpeggios with strategic bowing patterns and key "
    "signatures from repertoire. Vibrato work, different distributions, dynamic plan, "
    "prescribed articulation or rhythm, etc."
  }
  \spaceSm
  \paragraphIndent {
    "For ear training challenge this material could be supplemented with "
    \italic "Sevcik" " (EXAMPLE 6a), "
    \italic "Ricci" " (EXAMPLE 6b), or "
    \italic "Glaser – Viola Jazz Chord Studies for Violin" " (EXAMPLE 6c)."
  }
}
% \score { \new Staff { \"ex6a_sevcik" } }
% \score { \new Staff { \"ex6b_ricci" } }
% \score { \new Staff { \"ex6c_glaser" } }

\section "7) Double-Stops"

\markup \column {
  \paragraph {
    \italic "Trott Melodious Double-Stops Books 1–2" " (EXAMPLE 7a), "
    \italic "Sitt Technical Studies op.92 Book 3" ", or "
    \italic "Double-Stop Etudes op.32" "; "
    \italic "Chailley Vingt Études Expressives en Doubles Cordes" ", "
    \italic "Schradieck vol.2" ", "
    \italic "Korgueff Double-Stop Exercises" " (EXAMPLE 7b), "
    \italic "Sevcik op.7 part 4" " (EXAMPLE 7c) or "
    \italic "op.9" ", "
    \italic "Dounis op.12" " (EXAMPLE 7d), "
    \italic "Ricci" " (EXAMPLE 7e)."
  }
  \spaceSm
  \paragraphIndent { "Experience with a variety of intervals and key signatures is important." }
}

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


\section "8) Strategic Etude"

\markup \column {
  \paragraph {
    "To address a specific problem, such as "
    \italic "Mazas, Kreutzer, Rovelli, etc." "; materials of Step 2 played rapidly, "
    "or passagework from repertoire."
  }
  \vspace #1.2
}

\markup \italic "Add your current passage or an etude targeting today's focus (e.g., Kreutzer 2, 7, 9)."

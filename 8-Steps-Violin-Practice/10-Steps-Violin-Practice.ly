\version "2.24.4"
\language "english"
\include "../common/markups.ly"

\header {
  title = "10-Step Violin Practice"
  composer = "Marc Mouries"
  genre = "Exercise"
  tagline = ##f
}

\paper {
  indent = 0

  % Set default font for all markup
  #(define fonts
    (set-global-fonts
     #:roman "Optima"
     #:sans "Optima"
    ))

  % make book-level title larger
  bookTitleMarkup = \markup \column {
    \override #'(font-name . "Optima")
    \fill-line {
      \override #'(font-name . "Optima Bold")
      \fontsize #8 \bold \fromproperty #'header:title
    }
  }

  % turn off the score title
  scoreTitleMarkup = \markup \null
}

\layout {
  \override LyricText.font-name = #"Optima"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEXT HELPERS
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

%%%% Tiny helpers that \section uses
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
% EXAMPLE MATERIAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"ex2a" = \relative c'' { \clef treble \time 4/4 c8^\downbow c^\upbow c^\downbow c^\upbow  c^\downbow c^\upbow c^\downbow c^\upbow | }
"ex2b" = \relative c'' { \clef treble \time 4/4 c8 d e f  g a b c | d8 e f g  a b c d | e8 f g a  g f e d | c4( b8) r8 r2 | }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SCORE WITH SECTION MACRO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section "1) Silent Finger Exercises"

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
  \spaceSm
  \paragraphIndent {
    \bold "Bow Tilting: "
    "Tilt the bow stick toward the scroll to reduce hair contact with the string. "
    "Practice rolling the bow with thumb and fingers from flat hair to tilted position "
    "(Capet's " \italic "roule" " exercise). Use tilt at the frog to compensate for "
    "naturally louder sound, and flatten toward the tip. This controls tone color "
    "and enables smoother bow changes."
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
      \override SpacingSpanner.spacing-increment = #3.0
      \override SpacingSpanner.uniform-stretching = ##t
    }
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "2) Long Tones"

\markup \column {
  \paragraph {
    "Played with smooth bow change exercise (EXAMPLE 2a) before a mirror "
    "to check bow's contact point, then various left-hand finger exercises "
    "played slowly for intonation accuracy, especially combinations such as "
    "0-1, 0-2 etc., all with vibrato once intonation is secure."
  }
  \spaceSm
  \paragraphIndent {
    "Choose from materials such as "
    \italic "Sitt Practical Viola Method" ", "
    \italic "Dancla School of Velocity op.74" ", "
    \italic "Wreede Violaerobics" " (EXAMPLE 2b), "
    \italic "Schradieck vol.1" ", "
    \italic "Sevcik op.1 parts 1-3" "."
  }
}
\score { \new Staff { \"ex2a" } }
\score { \new Staff { \"ex2b" } }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "3) Bowing"

\markup \column {
  \paragraph {
    "Bow stroke techniques: " \italic "detache" ", " \italic "martele" ", "
    \italic "spiccato" ", " \italic "sautille" ", " \italic "colle" ", "
    \italic "ricochet" ", " \italic "staccato" ", " \italic "legato" "."
  }
  \spaceSm
  \paragraphIndent {
    "Materials: " \italic "Kreutzer" " (etudes 2, 7, 8), "
    \italic "Sevcik op.2" " (School of Bowing Technique), "
    \italic "Galamian" " scale routines with varied bowings."
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "4) Shifting"

\markup \column {
  \paragraph {
    "One-octave " \italic "Flesch Scale System" " scales, arpeggios, broken thirds; "
    \italic "Sevcik op.8, Lukacs 10 Exercises in Change of Position" " (EXAMPLE 4a), "
    \italic "Ricci Left-Hand Violin Technique" " (EXAMPLE 4b), "
    \italic "Dounis op.12" " (EXAMPLE 4c), "
    \italic "op.25 or Daily Dozen" " (EXAMPLE 4d)."
  }
}

\markup \smallCaps "One-octave Flesch Scale System scale"
"ex4a" = \relative g' {
  \time 3/4
  g4( a8 b) a4 | g4( a) g | a4( b8 c) b4 | a4( b) a | }
\score { \new Staff { \"ex4a" } }

\markup \concat {\bold "EXAMPLE 4b:" \italic " Ricci Left-Hand Violin Technique, exercise 80b"}

"ex4b_ricci" = \relative d' {
  \clef treble \time 4/4
  \key a \major
  a16[  b   cs-3  d-3  e  fs  gs-2 a-2  b   cs  d  e  fs  gs-3 a-3  b   cs  d  e  fs  gs
  a16  gs  fs  e  d  cs  b
  a16  gs  fs  e  d  cs  b
  a16  gs  fs  e  d  cs  b a]
}
\score { \new Staff { \"ex4b_ricci" } }

dounis_shifting =
\relative c' {
  \cadenzaOn
  \stemDown
   c2_3 (c8_2[ c_1 c_2 c_3]) \bar "|"
   d2_4 (d8_3[ d_2 d_1 d_2 d_3]) \bar "|"
   e2_4 (e8_3[ e_2 e_1 e_2 e_3]) \bar "|"
}
\score { \new Staff { \dounis_shifting } }

% Placeholder examples for future:
% "ex4c_d_major" = \relative d' { \clef treble \time 4/4 \key d \major d8( fs e g)  fs4  e8( g fs a) g4 | }
% "ex4c_c_major" = \relative c' { \clef treble \time 4/4 \key c \major c8( e d f)  e4  d8( f e g) f4 | }
% \score { \new Staff { << \"ex4c_d_major" \"ex4c_c_major" >> } }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "5) Strength / Stretching"

\markup \column {
  \paragraph {
    \italic "Whistler" " exercise (EXAMPLE 5a), "
    \italic "Flor" " exercise (EXAMPLE 5b), "
    \italic "Dounis Daily Dozen" " exercise 1 (EXAMPLE 5c) through fourth position "
    "with very slow bow and drone."
  }
}

% Placeholder examples for future:
% "ex5a_whistler" = \relative c' { \clef treble \time 3/4 c8( d c d c d) | c8( d e f e d) | }
% "ex5c_dounis" = \relative c'' { \clef treble \time 3/4 c8 d e g e d | d8 e f a f e | }
% \score { \new Staff { \"ex5a_whistler" } }
% \score { \new Staff { \"ex5c_dounis" } }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "6) Tone / String Crossings"

\markup \column {
  \paragraph {
    \italic "Dounis Daily Dozen" " exercise 11 (EXAMPLE 6), or similar made-up "
    "exercises with different double-stops, played very slowly with vibrato, and with "
    "dynamic plan of crescendo from " \code "pp" " to " \code "ff"
    " on the down-bow and the reverse on the up-bow."
  }
}

% Placeholder example for future:
% "ex6" = \relative c'' { \clef treble \time 4/4 \key c \minor r4 c2 r4 | r8 c c c  r c c c | }
% \score { \new Staff { \"ex6" } }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "7) Scales"

\markup \column {
  \paragraph {
    "Three-octave scales with strategic bowing patterns and key "
    "signatures from repertoire. Vibrato work, different distributions, dynamic plan, "
    "prescribed articulation or rhythm, etc."
  }
  \spaceSm
  \paragraphIndent {
    "Materials: " \italic "Flesch Scale System" ", "
    \italic "Galamian" ", " \italic "Hrimaly" "."
  }
}

% Placeholder examples for future:
% "ex7a_sevcik" = \relative c'' { \clef treble \time 3/4 c8 d c b a b | a8 g a g f g | }
% "ex7b_ricci" = \relative c'' { \clef treble \time 4/4 c16 d e f  g a b c  d e f g  a b c d | }
% "ex7c_glaser" = \relative c' { \clef alto \time 4/4 \key bf \major <bf d gf a>2 <a c ef fs>2 | }
% \score { \new Staff { \"ex7a_sevcik" } }
% \score { \new Staff { \"ex7b_ricci" } }
% \score { \new Staff { \"ex7c_glaser" } }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "8) Double-Stops"

\markup \column {
  \paragraph {
    "Double-stops for intonation training (Simon Fischer approach). "
    "Scales in thirds, sixths, octaves, and tenths."
  }
  \spaceSm
  \paragraph {
    \italic "Trott Melodious Double-Stops Books 1-2" " (EXAMPLE 8a), "
    \italic "Sitt Technical Studies op.92 Book 3" ", or "
    \italic "Double-Stop Etudes op.32" "; "
    \italic "Chailley Vingt Etudes Expressives en Doubles Cordes" ", "
    \italic "Schradieck vol.2" ", "
    \italic "Korgueff Double-Stop Exercises" " (EXAMPLE 8b), "
    \italic "Sevcik op.7 part 4" " (EXAMPLE 8c) or "
    \italic "op.9" ", "
    \italic "Dounis op.12" " (EXAMPLE 8d), "
    \italic "Ricci" " (EXAMPLE 8e)."
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
"ex8a_trott" = \relative c'' { \clef treble \time 2/4 <d fs>8( <e g>) <fs a>4 | }
 \score { \new Staff { \"ex8a_trott" } }

\markup "Korgueff"
"ex8b_korgueff" = \relative c'' { \clef treble \time 3/4 <c e>4( <d f> <e g>) | <f a>( <e g> <d f>) | }
\score { \new Staff { \"ex8b_korgueff" } }

\markup "Sevcik"
"ex8c_sevcik" = \relative c'' { \clef treble \time 2/4 c16( e g c)  d,( fs a d) | }
\score { \new Staff { \"ex8c_sevcik" } }

\markup "Dounis"
"ex8d_dounis" = \relative c' { \clef treble \time 2/4 <g d' g>8 <g d' g> <a e' a> <a e' a> | }
\score { \new Staff { \"ex8d_dounis" } }

\markup "Ricci"
"ex8e_ricci" = \relative c'' { \clef treble \time 2/4 <c e>8 <cs f> <d fs> <ef g> | }
\score { \new Staff { \"ex8e_ricci" } }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "9) Arpeggios"

\markup \column {
  \paragraph {
    "Three-octave arpeggios in all keys. Major, minor, dominant 7th, diminished."
  }
  \spaceSm
  \paragraphIndent {
    "Materials: " \italic "Flesch Scale System" ", "
    \italic "Galamian" ", one-octave arpeggios in 12 keys."
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section "10) Strategic Etude"

\markup \column {
  \paragraph {
    "To address a specific problem, such as "
    \italic "Mazas, Kreutzer, Rovelli, etc." "; materials of Step 2 played rapidly, "
    "or passagework from repertoire."
  }
  \vspace #1.2
}

\markup \italic "Add your current passage or an etude targeting today's focus (e.g., Kreutzer 2, 7, 9)."

\version "2.24.4"

\header {
  title = "Eight-Step Warm-Up Plan"
  subtitle = "LilyPond markup version"
  tagline = ##f
}

\paper {
  indent = 0
  line-width = 170\mm
  ragged-right = ##t
}

% ─────────────────────────────────────────────────────────────────────────
% HELPERS — all support block syntax \foo { ... }
% ─────────────────────────────────────────────────────────────────────────

#(define-markup-command (stepHeading layout props n title) (string? string?)
   (interpret-markup layout props
                     (markup
                      #:vspace 1
                      #:bold #:larger
                      #:line ( #:concat ( "Step " n " — " title )))))

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

% ─────────────────────────────────────────────────────────────────────────
% CONTENT
% ─────────────────────────────────────────────────────────────────────────

\markup \stepHeading "1" "Silent Finger Exercises"

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

\markup \stepHeading "2" "Long Tones"
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

\markup  \stepHeading "3" "Shifting"
\markup \column {
  \paragraph {
    "One-octave " \italic "Flesch Scale System" " scales, arpeggios, broken thirds; "
    \italic "Sevcik op.8, Lukács 10 Exercises in Change of Position" " (EXAMPLE 3a), "
    \italic "Ricci Left-Hand Violin Technique" " (EXAMPLE 3b), "
    \italic "Dounis op.12" " (EXAMPLE 3c), "
    \italic "op.25 or Daily Dozen" " (EXAMPLE 3d)."
  }
}

\markup \stepHeading "4" "Strength / Stretching"
\markup \column { \paragraph {
  \italic "Whistler" " exercise (EXAMPLE 4a), "
  \italic "Flor" " exercise (EXAMPLE 4b), "
  \italic "Dounis Daily Dozen" " exercise 1 (EXAMPLE 4c) through fourth position "
  "with very slow bow and drone."
}
}

\markup \stepHeading "5" "Tone / String Crossings"
\markup \column { \paragraph {
  \italic "Dounis Daily Dozen" " exercise 11 (EXAMPLE 5), or similar made-up "
  "exercises with different double-stops, played very slowly with vibrato, and with "
  "dynamic plan of crescendo from " \code "pp" " to " \code "ff"
  " on the down-bow and the reverse on the up-bow."
}
}

\markup \stepHeading "6" "Scales & Arpeggios"
\markup \column { \paragraph {  "Three-octave scales and arpeggios with strategic bowing patterns and key "
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

\markup \stepHeading "7" "Double-Stops"
\markup \column { \paragraph {
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

\markup \stepHeading "8" "Strategic Etude"
\markup \column { \paragraph {
  "To address a specific problem, such as "
  \italic "Mazas, Kreutzer, Rovelli, etc." "; materials of Step 2 played rapidly, "
  "or passagework from repertoire."
}
\vspace #1.2
}

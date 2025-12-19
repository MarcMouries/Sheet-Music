\version "2.24.4"

\header {
  title = "10 Steps Violin Practice"
  subtitle = "LilyPond markup version"
  composer = "Marc Mouries"
  genre = "Exercise"
  tagline = ##f
}

\paper {
  indent = 0
  line-width = 170\mm
  ragged-right = ##t

  % Set default font for all markup
  #(define fonts
    (set-global-fonts
     #:roman "Optima"
     #:sans "Optima"
    ))

  bookTitleMarkup = \markup \column {
    \override #'(font-name . "Optima")
    \fill-line {
      \override #'(font-name . "Optima Bold")
      \fontsize #6 \bold \fromproperty #'header:title
    }
    \fill-line { \fontsize #-1 \fromproperty #'header:subtitle }
  }
}

\layout {
  \override LyricText.font-name = #"Optima"
}

% -------------------------------------------------------------------------
% HELPERS
% -------------------------------------------------------------------------

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

% -------------------------------------------------------------------------
% CONTENT
% -------------------------------------------------------------------------

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

\markup \stepHeading "2" "Long Tones"
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

\markup \stepHeading "3" "Bowing"
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

\markup \stepHeading "4" "Shifting"
\markup \column {
  \paragraph {
    "One-octave " \italic "Flesch Scale System" " scales, arpeggios, broken thirds; "
    \italic "Sevcik op.8, Lukacs 10 Exercises in Change of Position" " (EXAMPLE 4a), "
    \italic "Ricci Left-Hand Violin Technique" " (EXAMPLE 4b), "
    \italic "Dounis op.12" " (EXAMPLE 4c), "
    \italic "op.25 or Daily Dozen" " (EXAMPLE 4d)."
  }
}

\markup \stepHeading "5" "Strength / Stretching"
\markup \column { \paragraph {
  \italic "Whistler" " exercise (EXAMPLE 5a), "
  \italic "Flor" " exercise (EXAMPLE 5b), "
  \italic "Dounis Daily Dozen" " exercise 1 (EXAMPLE 5c) through fourth position "
  "with very slow bow and drone."
}
}

\markup \stepHeading "6" "Tone / String Crossings"
\markup \column { \paragraph {
  \italic "Dounis Daily Dozen" " exercise 11 (EXAMPLE 6), or similar made-up "
  "exercises with different double-stops, played very slowly with vibrato, and with "
  "dynamic plan of crescendo from " \code "pp" " to " \code "ff"
  " on the down-bow and the reverse on the up-bow."
}
}

\markup \stepHeading "7" "Scales"
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

\markup \stepHeading "8" "Double-Stops"
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

\markup \stepHeading "9" "Arpeggios"
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

\markup \stepHeading "10" "Strategic Etude"
\markup \column { \paragraph {
  "To address a specific problem, such as "
  \italic "Mazas, Kreutzer, Rovelli, etc." "; materials of Step 2 played rapidly, "
  "or passagework from repertoire."
}
\vspace #1.2
}

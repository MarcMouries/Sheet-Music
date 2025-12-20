\version "2.24.0"
\language "english"

\header {
  title = "Position Markup Styles Comparison"
  subtitle = "Kreutzer Etude №2 - Measures 4-6"
  tagline = ##f
}

\paper {
  indent = 0
  ragged-right = ##f
  system-system-spacing.basic-distance = #20
  markup-system-spacing.basic-distance = #12
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STYLE DEFINITIONS - All positions below staff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Style 1: Current (small Roman numerals) - below staff
smarkA = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:small string)))

% Style 2: Tiny Roman numerals - below staff
smarkB = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:tiny string)))

% Style 3: Boxed Roman numerals - below staff
smarkC = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:tiny #:box string)))

% Style 4: Rounded box Roman numerals - below staff
smarkD = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:tiny #:rounded-box string)))

% Style 5: Tiny Arabic numbers - below staff
smarkE = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:tiny string)))

% Style 6: Boxed Arabic numbers - below staff
smarkF = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:tiny #:box string)))

% Style 7: Rounded box Arabic numbers - below staff
smarkG = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:tiny #:rounded-box string)))

% Style 8: Bold Arabic numbers - below staff
smarkH = #(define-music-function (string) (string?)
  (make-music 'TextScriptEvent
    'direction DOWN
    'text (markup #:tiny #:bold string)))

% Shift indicator
shift = #(define-music-function (fingering) (ly:music?)
   (let ((music (make-music 'FingeringEvent))
         (finger (ly:music-property fingering 'digit)))
     (set! (ly:music-property music 'tweaks)
           (acons 'stencil
                  (lambda (grob)
                    (let ((dash-ext (ly:stencil-extent
                                     (grob-interpret-markup grob (make-char-markup #x2012))
                                     X)))
                      (ly:grob-translate-axis! grob (/ (interval-length dash-ext) -2) X)
                      (grob-interpret-markup grob (make-concat-markup
                                                   (list (make-char-markup #x2012)
                                                         (number->string finger))))))
                  (ly:music-property music 'tweaks)))
     music))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEST PASSAGE - Measures 4-6 from Kreutzer Etude #2
% All styles: fingerings above, positions below
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup \bold \fontsize #1 "Style 1: Small Roman numerals (IV, VI...) - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkA "IV" c^\shift-1 _\smarkA "VI"  e-3 d
    c  d   b-2_\smarkA "IV"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkA "II"   a
    f16^1 _\smarkA "II" a^\shift-1 _\smarkA "IV"  c   bf   a  bf  g  a
    f^1 _\smarkA "II"  a-3 d^\shift-3 _\smarkA "V"   c    b! c  a^\shift-2 _\smarkA "III" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

\markup \bold \fontsize #1 "Style 2: Tiny Roman numerals - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkB "IV" c^\shift-1 _\smarkB "VI"  e-3 d
    c  d   b-2_\smarkB "IV"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkB "II"   a
    f16^1 _\smarkB "II" a^\shift-1 _\smarkB "IV"  c   bf   a  bf  g  a
    f^1 _\smarkB "II"  a-3 d^\shift-3 _\smarkB "V"   c    b! c  a^\shift-2 _\smarkB "III" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

\markup \bold \fontsize #1 "Style 3: Boxed Roman numerals - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkC "IV" c^\shift-1 _\smarkC "VI"  e-3 d
    c  d   b-2_\smarkC "IV"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkC "II"   a
    f16^1 _\smarkC "II" a^\shift-1 _\smarkC "IV"  c   bf   a  bf  g  a
    f^1 _\smarkC "II"  a-3 d^\shift-3 _\smarkC "V"   c    b! c  a^\shift-2 _\smarkC "III" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

\markup \bold \fontsize #1 "Style 4: Rounded box Roman numerals - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkD "IV" c^\shift-1 _\smarkD "VI"  e-3 d
    c  d   b-2_\smarkD "IV"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkD "II"   a
    f16^1 _\smarkD "II" a^\shift-1 _\smarkD "IV"  c   bf   a  bf  g  a
    f^1 _\smarkD "II"  a-3 d^\shift-3 _\smarkD "V"   c    b! c  a^\shift-2 _\smarkD "III" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

\markup \bold \fontsize #1 "Style 5: Tiny Arabic numbers (1, 2, 3...) - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkE "4" c^\shift-1 _\smarkE "6"  e-3 d
    c  d   b-2_\smarkE "4"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkE "2"   a
    f16^1 _\smarkE "2" a^\shift-1 _\smarkE "4"  c   bf   a  bf  g  a
    f^1 _\smarkE "2"  a-3 d^\shift-3 _\smarkE "5"   c    b! c  a^\shift-2 _\smarkE "3" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

\markup \bold \fontsize #1 "Style 6: Boxed Arabic numbers (1, 2, 3...) - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkF "4" c^\shift-1 _\smarkF "6"  e-3 d
    c  d   b-2_\smarkF "4"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkF "2"   a
    f16^1 _\smarkF "2" a^\shift-1 _\smarkF "4"  c   bf   a  bf  g  a
    f^1 _\smarkF "2"  a-3 d^\shift-3 _\smarkF "5"   c    b! c  a^\shift-2 _\smarkF "3" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

\markup \bold \fontsize #1 "Style 7: Rounded box Arabic numbers (1, 2, 3...) - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkG "4" c^\shift-1 _\smarkG "6"  e-3 d
    c  d   b-2_\smarkG "4"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkG "2"   a
    f16^1 _\smarkG "2" a^\shift-1 _\smarkG "4"  c   bf   a  bf  g  a
    f^1 _\smarkG "2"  a-3 d^\shift-3 _\smarkG "5"   c    b! c  a^\shift-2 _\smarkG "3" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

\markup \bold \fontsize #1 "Style 8: Bold Arabic numbers (1, 2, 3...) - below staff"
\score {
  \relative c'' {
    \time 4/4
    \key c \major
    a16-1_\smarkH "4" c^\shift-1 _\smarkH "6"  e-3 d
    c  d   b-2_\smarkH "4"  c
    a  b   c   b
    a  b  g^\shift-2 _\smarkH "2"   a
    f16^1 _\smarkH "2" a^\shift-1 _\smarkH "4"  c   bf   a  bf  g  a
    f^1 _\smarkH "2"  a-3 d^\shift-3 _\smarkH "5"   c    b! c  a^\shift-2 _\smarkH "3" b
    g16 b  d   c    b  c   a  b     g  b   e-4 d    c  d  b   c
  }
  \layout { }
}

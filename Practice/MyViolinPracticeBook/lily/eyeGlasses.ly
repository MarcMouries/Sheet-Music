%% http://lsr.di.unimi.it/LSR/Item?id=982
%% see also http://lsr.di.unimi.it/LSR/Item?id=435
%% see also http://lilypond.org/doc/v2.18/Documentation/notation/graphic

% Credit: PPS on March 2015

eyeglassesPath = #'(
     (moveto   -0.68    0.75)
     (curveto  -0.68    1.053  -0.433  1.32  -0.13   1.32)
     (curveto   0.253   1.32    0.42   1.053  0.42   0.75)
     (curveto   0.42    0.447   0.173  0.20  -0.13   0.20)
     (curveto  -0.433   0.20   -0.68   0.447 -0.68   0.75)
     (closepath)
     
     (moveto    0.97    0.75)
     (curveto   0.97    1.053   1.217  1.32   1.52   1.32)
     (curveto   1.823   1.32    2.07   1.053  2.07   0.75)
     (curveto   2.07    0.447   1.823  0.20   1.52   0.20)
     (curveto   1.217   0.20    0.97   0.447  0.97   0.75)
     (closepath)
     (moveto    0.35    1.03)
     (curveto   0.57    1.34    0.87   1.34   1.04   1.03))

#(define-markup-command (myEyeglasses layout props)
  ()
  "Prints out eyeglasses, indicating strongly to look at the conductor."
  (interpret-markup layout props
    #{
       \markup
       \with-dimensions #'(0 . 4.4) #'(0 . 2.5) 
       \override #'(line-cap-style . butt)
       \path #0.15
       \eyeglassesPath
    #}))

\relative c'' { c2^\markup\myEyeglasses  a2_\markup\myEyeglasses }

%{
Note: Path' eyeglasses is already implemented into LP but uses relative coordonates.
See: ~/scm/define-markup-commands.scm
%}

#(define eyeglassespath
  '((moveto    0.42   0.77)
    (rcurveto  0      0.304  -0.246   0.55  -0.55   0.55)
    (rcurveto -0.304  0      -0.55   -0.246 -0.55  -0.55)
    (rcurveto  0     -0.304   0.246  -0.55   0.55  -0.55)
    (rcurveto  0.304  0       0.55    0.246  0.55   0.55)
    (closepath)
    (moveto    2.07   0.77)
    (rcurveto  0      0.304  -0.246   0.55  -0.55   0.55)
    (rcurveto -0.304  0      -0.55   -0.246 -0.55  -0.55)
    (rcurveto  0     -0.304   0.246  -0.55   0.55  -0.55)
    (rcurveto  0.304  0       0.55    0.246  0.55   0.55)
    (closepath)
    (moveto    1.025  0.935)
    (rcurveto  0      0.182  -0.148   0.33  -0.33   0.33)
    (rcurveto -0.182  0      -0.33   -0.148 -0.33  -0.33)
    (moveto   -0.68   0.77)
    (rlineto   0.66   1.43)
    (rcurveto  0.132  0.286   0.55    0.44   0.385 -0.33)
    (moveto    2.07   0.77)
    (rlineto   0.66   1.43)
    (rcurveto  0.132  0.286   0.55    0.44   0.385 -0.33)))

#(define eyeglassespathM
  '((moveto    0.42   0.77)
    (rcurveto  0      0.304  -0.246   0.55  -0.55   0.55)
    (rcurveto -0.304  0      -0.55   -0.246 -0.55  -0.55)
    (rcurveto  0     -0.304   0.246  -0.55   0.55  -0.55)
    (rcurveto  0.304  0       0.55    0.246  0.55   0.55)
    (closepath)
    (moveto    2.07   0.77)
    (rcurveto  0      0.304  -0.246   0.55  -0.55   0.55)
    (rcurveto -0.304  0      -0.55   -0.246 -0.55  -0.55)
    (rcurveto  0     -0.304   0.246  -0.55   0.55  -0.55)
    (rcurveto  0.304  0       0.55    0.246  0.55   0.55)
    (closepath)
    (moveto    1.025  0.935)
    (rcurveto  0      0.182  -0.148   0.33  -0.33   0.33)
    (rcurveto -0.182  0      -0.33   -0.148 -0.33  -0.33)
    (moveto   -0.68   0.77)
    (rlineto   0.66   1.43)
    (rcurveto  0.132  0.286   0.55    0.44   0.385 -0.33)
    (moveto    2.07   0.77)
    (rlineto   0.66   1.43)
    (rcurveto  0.132  0.286   0.55    0.44   0.385 -0.33)))


\relative c'' { c2^\markup\eyeglasses  a2_\markup\eyeglasses }
\relative c'' { c2^\markup\eyeglassespathM  a2_\markup\eyeglassespathM }


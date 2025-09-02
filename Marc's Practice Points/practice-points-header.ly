date = #(strftime "%d/%m/%Y" (localtime (current-time)))
\markup {
  \fill-line {
    \line { Marc Mouries }
    \center-column {
      \override #'(font-name . "Vera")
      \fontsize #3 \smallCaps "Marc's Practice Points"
      \italic {for} 
      \fontsize #3 { \Title }
    }
    \line { \date }
  }
}
\markup  \column {
    \fill-line { \postscript #"-30 0 moveto 60 0 rlineto stroke" }
}
\markup \vspace #1

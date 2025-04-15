\version "2.16"
\language "english"

#(set-default-paper-size "letter")
#(set-global-staff-size 23)

\layout { indent = 0.0\cm }
\paper {
  annotate-spacing = ##f
  %top-margin = 10
}

\header {
  title = "Ievan Polkka"
  composer ="Trad. Finnish"
}

global = {
  \key e \major
  \time 2/4
  \tempo 4 = 100
}


partA =  {
	    fs16
      |  cs8 fs8 fs8.  gs16
      |  a16  fs fs  fs  fs8  fs16 a
      |  gs8  e  e  e
      |  gs8[  fs  fs8.]  fs16
      % 5 
      |  cs8 fs8 fs8.  gs16
      |  a8  fs16 fs8. fs16 a16
      | cs16 cs cs b a8 gs8
      |  a8  fs16 fs8. fs16 a16
      % 9
      cs8 cs b a
      gs8 e16 e8. e16 gs16
      b16 b b b a8 gs8
      a fs16 fs8. r16 a16
      %13
      cs8 cs b a 
      gs\noBeam e16[ e8.] e16 gs16 
      b16 b b b a8 gs
}
partAending = {
      a8  fs16[ fs8.] r16 % no bar check here as includes partial   
}
partAoctaveEnding = {
      fs8 r8 r8 r16   % no bar check here as includes partial   
}
melody =  \relative c' {  
   \partial 16  % required
   \repeat volta 4 {
      \partA 
      \partAending
    }
   \relative c'' {   
      \partA
      \partAoctaveEnding
    }
    \partA
}  
    


\score {
  \new Staff { 
    \global
    \melody
  }
  \midi { }
  \layout { }
}
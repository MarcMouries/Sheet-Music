\version "2.16"
\language "english"
\header {
  title = "bug repeat & partial"
}

melody = {
  \relative c' {    
\partial 4  % required
\repeat volta 4 {
  e4 |
  c2 e |
  % no \partial here
  g4 g g  % no bar check here
}
% no \partial here
e4 |
a2 a |
g1 |
  
}
}

\score {
  \new Staff { \melody  }
}


global = {
  \key e \major
  \time 2/4
  \tempo 4 = 100
}
partA = {
fs8 |  cs4 fs4 
  a4 fs8[ fs8.] 
  % no \partial here
  g4 g g  % no bar check here

}
melodyParts = {
  \relative c' {    
   \partial 8  % required
   \repeat volta 4 {
      \partA
   }
  \relative c'' {    
      \partA
  }
  }
}

\score {
  \new Staff {
	    \global
		 \melodyParts  }
}
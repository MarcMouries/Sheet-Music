\version "2.19.14"


\header {
 title = "Postscript"
}

ringsps = #"
  0.15 setlinewidth
  0.9  0.6  moveto
  0.0  0.0  0.5  0  360  arc
  stroke
  
  
  0.9  0.6  moveto
  %1.0 0.6 0.5 0 361 arc
  1.0  0.0  0.5  0 360 arc         %  circle at the coordinates (0,0) with a radius of 3

  stroke
  "

 \markup {
  %\with-dimensions #'(-0.2 . 1.6) #'(0 . 1.2)
  \postscript #ringsps
}

rings = \markup {
  %\with-dimensions #'(-0.2 . 1.6) #'(0 . 1.2)
  \postscript #ringsps
}

\relative c'' {
  c2^\rings
  a2_\rings
}

textPS = #"
%/Times-Roman findfont   % Get the basic font
%5 scalefont             % Scale the font to 20 points
%setfont                 % Make it the current font
newpath                 % Start a new path
0 0 moveto              % Lower left corner of text at (72, 72)
(Hello, world!) show    % Typeset Hello, world!
"
%\markup {
%  \postscript #textPS
%}

circlePS = #"
newpath                 % Start a new path
0 0 5 0 360 arc         %  circle at the coordinates (4,5) with a radius of 3
stroke
"
\markup {
  \postscript #circlePS
}


%% http://www.tailrecursive.org/postscript/examples/cliptext.html
%% http://stackoverflow.com/questions/tagged/postscript

textPS = #"
/Times-Roman findfont   % Get the basic font
5 scalefont             % Scale the font to 20 points
setfont                 % Make it the current font
newpath                 % Start a new path
0 0 moveto              % Lower left corner of text at (72, 72)
45 rotate 
(Hello, world!) show    % Typeset Hello, world!
"
%\markup {
%  \postscript #textPS
%}




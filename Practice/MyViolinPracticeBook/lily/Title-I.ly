\include "english.ly" 

% dynamic content and of different size the layout gets screwed. 

%Why I'm trying to use dynamic data? Because I'm making a custom header 
%for a song book and not all songs have all headers. 



#(define (has-subtitle layout props arg) 
   (if (chain-assoc-get 'header:subtitle? props #t) 
    (interpret-markup layout props arg) 
    empty-stencil)) 

customHeaders = \markup 
{ 
        \column 
        { 
                \fontsize #6 \fromproperty #'header:title 
                \on-the-fly #has-subtitle { 
                  \pad-to-box #'(0 . 0) #'(0 . 5)   
                  \fontsize #6 \fromproperty #'header:subtitle } 
                \fontsize #-1 \fromproperty #'header:poet 
                \fontsize #-1 \fromproperty #'header:translator 
        } 
} 

\paper 
{ 
     bookTitleMarkup = \customHeaders 
} 

\header 
{ 
     title = "Title I" 
    % subtitle = "Title II"  % comment to test single-title output 
     poet = "Poet" 
     translator = "Translator" 
} 

\score 
{ 
        c'1 
} 
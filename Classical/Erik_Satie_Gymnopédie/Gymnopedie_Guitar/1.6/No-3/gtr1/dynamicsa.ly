\version "2.18.2."

pdolcedyn = \markup {
            \hspace #7
            \dynamic p 
	    \normal-text
            { \tiny \italic dolce }
    }

atempodyn = \markup {
            \hspace #9
	    \normal-text
            { \italic "a Tempo" }
    }

arallmoltodyn = \markup {
            \hspace #0
	    \normal-text
            { \tiny \italic "rall. molto" }
    }
pdouxdyn = \markup {
            \hspace #-14
            \dynamic p 
	    \normal-text
            { \italic "doux et expressif" }
    }

ppdouxdyn = \markup {
            \hspace #16
            \dynamic pp 
	    \normal-text
            { \italic "doux et expressif" }
    }

aritmoltodyn = \markup {
            \hspace #17
	    \normal-text
            { \tiny \italic "rit.  molto" }
    }

adimdyn = \markup {
            \hspace #10
	    \normal-text
            { \italic "dim." }
    }


patempodyn = \markup {
            \hspace #9
            \dynamic p 
            \hspace #1
	    \normal-text
            { \tiny \italic "a tempo" }
    }

puipdyn = \markup {
            \hspace #4
	    \normal-text
            { \italic "più" }
            \hspace #1
            \dynamic p 
    }


patempobdyn = \markup {
            \hspace #0
            \dynamic p 
            \hspace #1
	    \normal-text
            { \tiny \italic "a tempo" }
    }

ppatempodyn = \markup {
            \hspace #9
            \dynamic pp 
            \hspace #1
	    \normal-text
            { \tiny \italic "a tempo" }
    }

pptranqdyn = \markup {
            \hspace #9
            \dynamic pp
            \hspace #1
	    \normal-text
            { \tiny \italic tranquillo }
    }

psansdyn = \markup {
            \hspace #12
            \dynamic p 
            \hspace #1
	    \normal-text
            { \italic "sans rigueur" }
    }

sempregrandiosodyn = \markup {
            \hspace #12
	    \normal-text
            { \tiny \italic "sempre grandioso" }
    }

ppdyn = \markup {
            \hspace #2
            \dynamic pp
    }

perdyn = \markup {
           \hspace #10
           \normal-text
           { \italic "perdendo - - - - - - - - - - - - - - -" }
    }

pdoux = #(make-dynamic-script pdouxdyn)
ppdoux = #(make-dynamic-script ppdouxdyn)

dynamicsa = { 
    \repeat unfold 58 { s2. } |
    s2.\pp |
}


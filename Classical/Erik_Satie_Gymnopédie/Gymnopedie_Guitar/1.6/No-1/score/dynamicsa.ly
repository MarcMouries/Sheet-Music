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
aralldyn = \markup {
            \hspace #0
	    \normal-text
            { \italic "Rall." }
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

pdolce = #(make-dynamic-script pdolcedyn)
atempo = #(make-dynamic-script atempodyn)
patempo = #(make-dynamic-script patempodyn)
patempob = #(make-dynamic-script patempobdyn)
puip = #(make-dynamic-script puipdyn)
ppatempo = #(make-dynamic-script ppatempodyn)
pptranq = #(make-dynamic-script pptranqdyn)
psans = #(make-dynamic-script psansdyn)
sempregrandioso = #(make-dynamic-script sempregrandiosodyn)
ppplace = #(make-dynamic-script ppdyn)
perd = #(make-dynamic-script perdyn)
rallmolto = #(make-dynamic-script arallmoltodyn)
rall = #(make-dynamic-script aralldyn)
ritmolto = #(make-dynamic-script aritmoltodyn)
dim = #(make-dynamic-script adimdyn)

dynamicsa = {
    \repeat unfold 4 { s2. } |
    s2.
    \repeat unfold 7 { s2. } |
    s2.
    \repeat unfold 8 { s2. } |
    s2.\p |
    \repeat unfold 11 { s2. } |
    s2.\< | s2. | s2.\p |
    \override Hairpin.to-barline = ##f
    s2.\> | s2. | s2.\! | s2. |
    \repeat unfold 3 { s2. } |
    s2.
    \repeat unfold 7 { s2. } |
    s2.
    \repeat unfold 4 { s2. } |
    s2.\> | s2. | s2.\! | s2. | s16 s\mp s8 s2 |
    \repeat unfold 3 { s2. } |
    s4 s s\< | s2. | s4\! s4\> s | s2. | s2 s4\! | 
    s2. | s2. | s2. |
   \override Hairpin.to-barline = ##f
    s2.\< | s2 s4\! | s4\p s4\> s | s2. | s2.\pp |
}

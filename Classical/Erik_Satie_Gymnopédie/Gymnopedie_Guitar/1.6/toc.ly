\version "2.18.2"

\bookpart {
    \paper {
	tocTitleMarkup = \markup \fontsize #9 \column {
	    \null
	    \null
	    \fill-line { \null \bold "Table of Contents" \null }
	    \null
	}
	tocItemMarkup = \markup \fontsize #5 \fill-with-pattern #1 #RIGHT . 
	    \fromproperty #'toc:text \fromproperty #'toc:page
	
%	top-margin = 20 \mm
	bottom-margin = 10 \mm
	left-margin = 30 \mm
	right-margin = 30 \mm
    }

    \markuplist \table-of-contents
}



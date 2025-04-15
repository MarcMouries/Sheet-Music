\version "2.19.11"

stringUp = #(define-music-function 
             (parser   location stringnuma stringnumb osp        shorten adjBreak  adjEnd)
                               (string?   string?   number?   pair?   number?  number?) #{
	% set osp to 999 if spanner is colliding with another element
	% this will position the spanner outside all other elements
	% can be normally be set to zero
	\once \override TextSpanner.outside-staff-priority = #osp
	\once \override TextSpanner.bound-details.left.text = \markup \bold \teeny \circle { \finger $stringnuma }
	\once \override TextSpanner.font-shape = #'upright
	% setup dashed line and draw a bracket edge on RHS
	\once \override TextSpanner.dash-period = #0.8
	\once \override TextSpanner.dash-fraction = #0.6
	\once \override TextSpanner.thickness = #0.8
	\once \override TextSpanner.bound-details.right.text = \markup \bold \teeny \circle { \finger $stringnumb }
	% set alignment of line with reference to text
	\once \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
	\once \override TextSpanner.bound-details.right.stencil-align-dir-y = #CENTER
	%\once \override TextSpanner.bound-details.left.padding = #(car shorten)
	%\once \override TextSpanner.bound-details.right.padding = #(cdr shorten)
	% allow adjustment of line end when it wraps to following stave
	\once \override TextSpanner.bound-details.right-broken.padding = #adjEnd
	% adjust LH end of line when it wraps to following stave so that it doesn't
	% extend to the left of the notes on the stave
	\once \override TextSpanner.bound-details.left-broken.X = #adjBreak
	% optional override to remove text and bracket edge at line breaks
%	\once \override TextSpanner.bound-details.left-broken.text = ##f
	\once \override TextSpanner.bound-details.right-broken.text = ##f
#})

\relative c' {
  \stringUp "4" "4" #0 #'(0 . -0.5) #5 #1 <a a'>8 \startTextSpan b c \stopTextSpan d	
  \stringUp "4" "4" #0 #'(0 . -0.5) #5 #1 <e e'>8 \startTextSpan f g \stopTextSpan a 	
  \stringUp "4" "4" #0 #'(0 . -0.5) #5 #1 <b b'>8 \startTextSpan c d \stopTextSpan e 	

}


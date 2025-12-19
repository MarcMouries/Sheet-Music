\version "2.12.3"

%---------------------------------
%\include "_/AccordsJazzDefs.ly"
%
% on peut enregistrer ces commandes dans un fichier "AccordsJazzDefs.ly" par exemple
% pour bénéficier de ces définition il faut substituer la police de base du \chormode
% par la police spéciale "lilyjazzchord" ou les altérations sont définies par les caractères > = b et < = #
%---------------------------------

% modification de la procedure "chordRootNamer"
%---- définition des altérations dans les accords -------
#(define (chordNamer pitch)
	(let* ((alt (ly:pitch-alteration pitch)))
		(make-line-markup
			(list
				(make-simple-markup 
					(vector-ref #("C" "D" "E" "F" "G" "A" "B")
						(ly:pitch-notename pitch)))
				(if (= alt 0)			; alteration ?
					(markup "")		;non
					(if (= alt FLAT)	; b ou #
						(markup ">")
						(markup "<")
					)
				)
			)
		)
	)
)

%----- commandes markup pour simplifier l'ecriture de l'interprétation des accords -----
%----- cette partie peut etre adaptée a vos convenances ( "MI" et "MA" que je n'aime pas par exemple)
% commande accord mineur "acMin" les accords mineurs sont symbolysés par un "m" small
#(define-markup-command (acMin layout props extension) (string?)
	(interpret-markup layout props
		(markup #:small "m" #:super extension)))

% commande accord majeur "acMaj" les accords mineurs sont symbolysés par un "M" small
#(define-markup-command (acMaj layout props extension) (string?)
	(interpret-markup layout props
		(markup #:small "M" #:super extension)))

% commande accord altéré "acAlt" aguments : exposant puis 2 valeurs qui seront supperposées entre parenthèses 
#(define-markup-command (acAlt layout props strA strB strC) (string? string? string?)
	(interpret-markup layout props
	  	(markup 
			#:super strA
			#:fontsize 1.5 "["
			#:fontsize -4 
			#:raise 1.8
			#:column (strB strC) 
			#:fontsize 1.5 "]"
	  	)
	)
)

% modification de la propriété "chordNameExceptions" 
%----- Définition des exceptions pour les accords -----
% 
%	degrés 			markup				% écriture
chJazzMusic = {
% accords 1ere tierce mineure - 3  notes
	< c ees ges >		-\markup \super "dim."		% :dim
	< c ees g >		-\markup \acMin #""		% :m

% accords 1ere tierce mineure - 4  notes
	< c es ges beses >	-\markup \super "7dim" 		% :dim7
	< c ees gis >		-\markup \acMin #"aug"		% :m5+ (Ab/C)	
	< c ees g a >		-\markup \acMin #"6"		% :m6            
	< c ees ges bes >	-\markup \acMin #"7 >5"		% :m7.5-         
	< c ees g bes >		-\markup \acMin #"7"		% :m7            
	< c ees gis bes >	-\markup \acMin #"7 <5"		% :m7.5+         
	< c ees g b >		-\markup \acMin #"M7"	 	% :m7+           
	< c ees g d' >		-\markup \acMin #"add9"		% :m5.9
	
% accords 1ere tierce mineure - 5  notes et +
	< c ees g a d' >	-\markup \acMin #"6/9"		% :m6.9
	< c ees g bes des' >	-\markup \acMin #"7(>9)"	% :m7.9-
	< c ees g bes d' >	-\markup \acMin #"9"		% :m9
	< c ees ges bes d' >	-\markup \acMin #"9(>5)"	% :m9.5-
	< c ees g b d' >	-\markup \acMin #"9(M7)"	% :m9.7+
	< c ees g bes dis' >	-\markup \acMin #"7(<9)"	% :m7.9+
	< c ees g bes f' >	-\markup \acMin #"7(add 11)"	% :m7.11
	< c ees g bes a' >	-\markup \acMin #"7(add 13)"	% :m7.13
	< c ees g bes d' f' >	-\markup \acMin #"11"		% :m11
	< c ees ges bes d' f' >	-\markup \acMin #"11(>5)"	% :m11.5-
	< c ees g bes d' f' a'>	-\markup \acMin #"13"		% :m13

% accords 1ere tierce majeure - 3 notes
	< c e ges>		-\markup \super "5>"		% :5-
	< c e gis>		-\markup \super "aug."	 	% :aug

% accords 1ere tierce majeure - 4 notes
	< c e g a d'>		-\markup {
		\super "6"
		\hspace #-0.5 \raise #0.7 \tiny "/"
		\hspace #-0.5 \tiny "9"
		}	% :6.9

%	< c e g a d'>		-\markup \acAlt #"" #"6" #"9"	% :6.9
	< c e g b>		-\markup \acMaj #"7"		% :maj
	< c e ges b>		-\markup \acMaj #"7>5"		% :maj.5-
	< c e gis b>		-\markup \acMaj #"7<5"		% :maj.5+
	
	< c e ges bes>		-\markup \super "7(>5)"		% :7.5-
	< c e gis bes>		-\markup \super "7(<5)"		% :7.5+
	< c e g d'>		-\markup \super "add9"		% :5.9

% accords 1ere tierce majeure - 5 notes et +
	<c e g b d'>		-\markup \acMaj #"9"		% :maj9

	<c e g bes des'>	-\markup \super "7(>9)"			% :9-
	<c e ges bes des'>	-\markup \acAlt #"7" #">9" #">5"	% :9-.5-
	<c e gis bes des'>	-\markup \acAlt #"7" #">9" #"<5"	% :9-.5+
	<c e g bes dis'>	-\markup \super "7(<9)"			% :9+
	<c e ges bes dis'>	-\markup \acAlt #"7" #"<9" #">5"	% :9+.5-
	<c e gis bes dis'>	-\markup \acAlt #"7" #"<9" #"<5"	% :9+.5+

	<c e g bes fis'>	-\markup \super "7(<11)"		% :7.11+
	<c e g bes aes'>	-\markup \super "7(>13)"		% :7.13-
	< c e g b d' a' >	-\markup \acMaj #"13"		% :maj13 
	< c e g bes d' a' >	-\markup \super "13" 		% :13 

% accord sus.
	< c d g>		-\markup \super "sus2"	% :sus2
	< c f g>		-\markup \super "sus"	% :sus4
	< c f g bes>		-\markup \super "7sus"	% :sus4.7
	< c f g bes d'>		-\markup \super "9sus"	% :sus4.7.9
}

%variable permettant d'appeler les exceptions
chJazz = #(append (sequential-music-to-chord-exceptions chJazzMusic #t))	

%-------------------------------
% Fin des définitions
%-------------------------------


#(set-global-staff-size 20)

\paper {
	indent = 0\mm
}

\header {
	title =\markup {\fontsize #+4 \override #'(font-name . "Dom Casual")
		" Accords Jazz "
	}
	composer = \markup {\override #'(font-name . "Dom Casual")
		"Lily POND"
	} 
	poet = \markup {\override #'(font-name . "lilyjazzchord")
	"C<^         D0        E>@"		% juste pour voir la notation classique
	} 	
}

% demonstration des possibilités
% le resultat au dessus, les notes de l'accord, le nomage de l'accord en dessous

accords = {
	\set chordRootNamer = #chordNamer	% nom des accords
	\set chordNameExceptions = #chJazz	% utilisation des accords jazz
	\chordmode {
		c1  _"c"			fis _"fis"
		bes _"bes"			c:6 _"c:6"
		c:6.9 _"c:6.9"			c:5.9 _"c:5.9"
		c:maj _"c:maj"
		\break
		c:maj7.5- _"c:maj7.5-"		c:maj7.5+ _"c:maj7.5+"
		c:maj9 _"c:maj9"		c:maj13 _"c:maj13"
		c:7 _"c:7"			c:9 _"c:9"
		c:11 _"c:11"			c:13 _"c:13" 
		\break
		c:m _"c:m"			c:m6 _"c:m6"
		c:m6.9 _"cm:6.9"		c:m5.9 _"c:m5.9"
		c:m7 _"c:m7" 			c:m7.11 _"c:m7.11"
		c:m7.13 _"c:m7.13" 
		\break
		c:m9 _"c:m9"			c:m11 _"c:m11"
		c:m13 _"c:m13"			c:m7+ _"c:m7+"
		c:m9.7+ _"c:m9.7+"   		c:m7.5- _"c:m7.5-"
		c:m9.5- _"c:m9.5-"		c:m11.5- _"c:m11.5-"
		\break
		c:dim _"c:dim"			c:dim7 _"c:dim7"
		c:aug _"c:aug"			s
		c:sus2 _"c:sus2"		c:sus4 _"c:sus4"
		c:sus4.7 _"c:sus4.7"		c:sus4.7.9 _"c:sus4.7.9"
		\break
		c:7.5-	_"c:7.5-"		c:7.5+ _"c:7.5+"
		c:9- _"c:9-"			c:9-.5- _"c:9-.5-"
		c:9-.5+ _"c:9-.5+"		c:9+ _"c:9+"
		c:9+.5- _"c:9+.5-"		c:9+.5+ _"c:9+.5+"
		\break
		c:sus2 _"c:sus2"		c:sus4 _"c:sus4"
		c:sus4.7 _"c:sus4.7"		c:sus4.7.9 _"c:sus4.7.9"
	}
}

\score {
	<<
	  		\override ChordNames . ChordName #'font-name = #"lilyjazzchord" %remplacement de la police
		\override ChordNames . ChordName #'font-size = #1
		\new ChordNames	
		% taille de la police
		\accords
		
		\new Staff	\accords
		\override Score.SystemStartBar #'collapse-height = #1	 % barre en debut de portée
		\override Score.Clef #'break-visibility = #'#(#f #f #f)	 % une seule clef
		\override Score.KeySignature #'break-visibility = #'#(#f #f #f)	% une seule signature
	>>
}

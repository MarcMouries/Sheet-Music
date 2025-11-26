\version "2.19.11"
% #(set-default-paper-size "letter")
\header {
	title = "The First Noel"
	composer = "Traditional; English carol, c. 13th century, arr. first published 1833"
	mutopiatitle = "The First Noel (hymntune)"
	mutopiacomposer = "Traditional"
	mutopiainstrument = "Voice (SATB)"
	copyright = "Public Domain"
	date = "1833"
	maintainer = "Steve Dunlop"
	maintainerWeb = "http://www.nerstrand.net"
	maintainerEmail = "music@nerstrand.net"
	style = "christmas carol"
	source = "www.cyberhymnal.org"
	lastupdated = "2008/1/12"
 footer = "Mutopia-2008/01/13-1243"
 tagline = \markup { \override #'(box-padding . 1.0) \override #'(baseline-skip . 2.7) \box \center-column { \small \line { Sheet music from \with-url #"http://www.MutopiaProject.org" \line { \teeny www. \hspace #-1.0 MutopiaProject \hspace #-1.0 \teeny .org \hspace #0.5
  video = ""
} • \hspace #0.5 \italic Free to download, with the \italic freedom to distribute, modify and perform. } \line { \small \line { Typeset using \with-url #"http://www.LilyPond.org" \line { \teeny www. \hspace #-1.0 LilyPond \hspace #-1.0 \teeny .org } by \maintainer \hspace #-1.0 . \hspace #0.5 Reference: \footer } } \line { \teeny \line { This sheet music has been placed in the public domain by the typesetter, for details see: \hspace #-0.5 \with-url #"http://creativecommons.org/licenses/publicdomain" http://creativecommons.org/licenses/publicdomain } } } }
}


Soprano = { \time 3/4  { \key d \major fis'8 e' d'4. e'8 fis' g' a'2 b'8 cis'' d''4 cis'' b' a'2 b'8 cis'' d''4 cis'' b' a' b' cis'' d'' a' g' fis'2 fis'8 e' d'4. e'8 fis' g' a'2 b'8 cis'' d''4 cis'' b' a'2 b'8 cis'' d''4 cis'' b' a' b' cis'' d'' a' g' fis'2 fis'8 e' d'4. e'8 fis' g' a'2 d''8 cis'' b'2 b'4 a'2 a'4 d'' cis'' b' a' b' cis'' d'' a' g' fis'2  \bar "|." } }
Alto = { { \key d \major d'4 a2 d'4 e'2 e'4 a' a' g' fis'2 d'8 e' a'4 fis' g' a' d' g' fis' fis' e' d'2 cis'4 a2 d'8 d' e'2 e'4 a' a' g' fis'2 d'8 e' a'4 fis' g' a' g' g' fis' fis' e' d'2 cis'4 a2 d'4 cis'2 fis'4 g'2 g'4 fis'2 a'4 fis' fis' g' fis'2 g'4 fis'2 e'4 d'2  \bar "|." } }
Tenor = { { \key d \major a8 g fis2 d'4 cis'2 b4 a a b8 cis' d'2 b8 a a4 a cis' d' b g a d' a a2 a8 g fis2 d'8 d' d'4 cis' b a a b8 cis' d'2 b8 a a4 a cis' d' d' e' a d' a a2 a8 g fis2 b4 a2 a4 b4. cis'8 d' e' fis'2 e'4 d' d' d' d'2 g4 a2 ( a4 ) a2  \bar "|." } }
Bass = { { \key d \major d4 d2 b,4 a, a g fis fis g d2 g8 g fis4 d e fis g e fis8 g a4 a d2 a,4 d2 b,8 b, a,4 a g fis fis g d2 g8 g fis4 d e fis g e fis8 g a4 a, d2 a,4 d2 b,4 fis2 d4 g4. a8 b cis' d'2 cis'4 b a g d' ( d ) e fis8 g a4 a, d2  \bar "|." } }



\score {
   \new StaffGroup <<
      \new Staff <<  \Soprano >>
      \new Staff <<  \Alto >>
   >>
   \layout { }
 %  \midi { }
}
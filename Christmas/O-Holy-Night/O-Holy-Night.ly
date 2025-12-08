\version "2.12.3"
%#(ly:set-option 'point-and-click #f)

\markup
{
    \column
    {
	\line{\italic Text: Placide Cappeau (1808–1877), 1847; translated by John Sullivan Dwight (1813–1893), 1855}
	\line{\italic Music: Adolphe Charles Adam (1803–1856); \italic arr. \italic by G. B. H.}
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	\line{\italic {Tune Name:} ‘la Marseillaise religieuse’}
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Based on Hymnary.org’s reputedly public domain version from \italic Timeless \italic Truths, 1926}
    }
}

\paper
{
    indent = 0.0
    line-width = 200 \mm
    %between-system-space = 0.1 \mm
    %between-system-padding = #1
    %ragged-bottom = ##t
    %top-margin = 0.1 \mm
    %bottom-margin = 0.1 \mm
    %foot-separation = 0.1 \mm
    %head-separation = 0.1 \mm
    %before-title-space = 0.1 \mm
    %between-title-space = 0.1 \mm
    %after-title-space = 0.1 \mm
    paper-height = 33 \cm
    %print-page-number = ##t
    %print-first-page-number = ##t
    %ragged-last-bottom
    %horizontal-shift
    %system-count
    %left-margin
    %paper-width
    %printallheaders
    %systemSeparatorMarkup
}

\header
{
    title = "O Holy Night"
    subtitle = "Cantique de Noël"
    composer = "Adolphe Charles Adam (1803–1856)"
    poet = "Placide Cappeau"
    country = "France"
    style = "christmas hymn"
    arranger = "arr. G. B. H."
}

\include "../../common/common-header.ily"


global =
{
    \override Staff.TimeSignature.style = #'()
    \time 4/4
    \key es \major
    \override Rest.direction = #'0
    \override MultiMeasureRest.staff-position = #0
}

sopWords = \lyricmode
{
    \override Score . LyricText   .font-size = #-1
    \override Score . LyricHyphen .minimum-distance = #1
    \override Score . LyricSpace  .minimum-distance = #0.8
    % \override Score . LyricText #'font-name = #"Gentium"
    % \override Score . LyricText #'self-alignment-X = #-1
    \set stanza = "1. "
    %\set vocalName = "Men/Women/Unison/SATB"
    Oh, ho -- ly night, the stars are bright -- ly shin -- ing;
    It is the night of the dear Sav -- ior’s birth!
    Long lay the world in sin and er -- ror pin -- ing,
    Till He ap -- peared and the soul felt its worth.
    A thrill of hope, the wea -- ry world re -- joic -- es,
    For yon -- der breaks a new and glo -- rious morn.
    Fall on your knees, oh, hear the an -- gel voic -- es!
    Oh, night di -- vine, oh, night when Christ was born!
    Oh, night di -- vine, oh, night, oh, night di -- vine!
}
sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
    Led by the light of faith se -- rene -- ly beam -- ing,
    With glow -- ing hearts by His cra -- dle we stand.
    So led by light of a star sweet -- ly gleam -- ing,
    Here came the wise men from O -- ri -- ent land.
    The King of kings lay thus in low -- ly man -- ger,
    In all our tri -- als born to be our Friend!
    He knows our need— \set ignoreMelismata = ##t to our \unset ignoreMelismata weak -- ness is no stran -- ger.
    Be -- hold your King; be -- fore Him low -- ly bend!
    Be -- hold your King; be -- fore Him low -- ly bend!
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
    Tru -- ly He taught us to love one a -- noth -- er;
    His law is love and His Gos -- pel is peace.
    Chains shall He break for the slave is our broth -- er,
    And in His Name all op -- pres -- sion shall cease.
    Sweet hymns of joy in grate -- ful cho -- rus raise we,
    Let all with -- in us praise His ho -- ly name!
    Christ is the Lord! Oh, praise His name for -- ev -- er!
    His pow’r and glo -- ry ev -- er -- more pro -- claim!
    His pow’r and glo -- ry ev -- er -- more pro -- claim!
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. "
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. "
}
sopWordsSix = \lyricmode
{
    \set stanza = "6. "
}
sopWordsSeven = \lyricmode
{
    \set stanza = "7. "
}
altoWords = \lyricmode
{

}
tenorWords = \lyricmode
{

}
bassWords = \lyricmode
{

}

soprano = {
		\partial 2
		g'4 g'8. g'16 bes'4.. bes'16 c''8. c''16 aes'8. c''16 es''2 bes'8 r16 bes'16 g'8. f'16 es'4 g'8. aes'16 bes'4 c''8. d''16 es''2\fermata \bar "" \break
		g'4 g'8. g'16 bes'4.. bes'16 c''8. c''16 aes'8. c''16 es''2 bes'8 r16 bes'16 a'8. g'16 d''4 bes'8. c''16 d''4 es''8. d''16 g'2.. \bar "" \break
		r16 bes'16 bes'4 c'' f' bes' c''8. bes'16 es''8. g'16 c''4 bes'8 r16 bes'16 bes'4 c'' f' bes' c''8. bes'16 es''8. g'16 bes'4. r8 \break
		es''2. d''8. c''16 d''2. d''8.~ d''16 f''2~ f''8. c''16 c''8. c''16 es''2 es''4. r16 es''16 g''2 (f''4..) bes'16 es''2. \bar "" \break
		d''8. (c''16) bes'2~ bes'8. bes'16 c''8. bes'16 bes'2.. r16 es''16 f''2.~ f''8. bes'16 g''2. f''4 es''2 (d''8.) d''16 es''8. f''16 es''2\fermata
		\bar "|."
}

\score
{
    %\transpose es' d'
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopranos"
	    {
		\voiceOne
		\global
		%\override Score.MetronomeMark.transparent = ##t
		%\override Score.MetronomeMark.stencil = ##f
		
		%\override HorizontalBracket #'direction = #UP
		%\override HorizontalBracket #'bracket-flare = #'(0 . 0)
		%put \startGroup and \stopGroup after notes to create analysis brackets
		
		%\override TextSpanner #'dash-period = #-1
		%\override TextSpanner #'bound-details #'left #'text = \markup{ \concat{\draw-line #'(0 . -1.0) \draw-line #'(1.0 . 0) }}
		%\override TextSpanner #'bound-details #'right #'text = \markup{ \concat{ \draw-line #'(1.0 . 0) \draw-line #'(0 . -1.0) }}
		%put \stopTextSpan \startTextSpan after notes for hymn-style piano introduction brackets; also consider \mark \markup{} for measure markup
		\soprano
		\tempo 4 = 82

	    }

	    \new Voice = "altos"
	    {
		\voiceTwo
		es'4 es'8. es'16 g'4.. g'16 aes'8. aes'16 aes'8. aes'16 bes'2 bes'8 s16 bes'16 g'8. f'16 es'4 es'8. es'16 f'4 aes'8. bes'16 bes'2
		es'4 es'8. es'16 f'4.. f'16 g'8. g'16 aes'8. aes'16 bes'2 bes'8 s16 bes'16 a'8. g'16 bes'4 bes'8. bes'16 a'4 a'8. a'16 g'2..
		s16 g'16 aes'4 aes' f' aes' g'8. g'16 g'8. g'16 g'4 g'8 s16 bes'16 aes'4 aes' f' aes' g'8. g'16 g'8. g'16 g'4. s8
		c''2. c''8. c''16 bes'2. bes'8.~ bes'16 c''2~ c''8. aes'16 aes'8. aes'16 c''2 c''4. s16 c''16 es''2 (<d'' bes'>4..) bes'16 bes'4 (des'' c'')
		bes'8. (aes'16) g'2 (aes'8.) aes'16 aes'8. aes'16 g'2.. s16 bes'16 d''2.~ d''8. bes'16 es''4 (des''4 c'') c'' bes'2~ bes'8. bes'16 bes'8. bes'16 bes'2
	    }

	    \new Lyrics = sopranos { s1 }
	    \new Lyrics = sopranosTwo { s1 }
	    \new Lyrics = sopranosThree { s1 }
	    %\new Lyrics = sopranosFour { s1 }
	    %\new Lyrics = sopranosFive { s1 }
	    %\new Lyrics = sopranosSix { s1 }
	    %\new Lyrics = sopranosSeven { s1 }
	    %\new Lyrics = altos { s1 }
	    %\new Lyrics = tenors { s1 }
	    %\new Lyrics = basses { s1 }
	>>


	\new Staff
	<<
	    \clef bass
	    \new Voice = "tenors"
	    {
		\voiceThree
		\global
		es4 es8. es16 es4.. es16 es8. es16 es8. es16 g2 g8 r16 g16 es8. aes16 g4 es8. es16 d4 f8. aes16 g2
		es4 es8. es16 d4.. d16 es8. es16 es8. es16 g2 g8 r16 g16 g8. g16 g4 g8. g16 fis4 fis8. fis16 g2..
		r16 es16 f4 f aes f es8. es16 es8. es16 es4 es8 r16 es16 f4 f aes f es8. es16 es8. es16 es4. r8
		g2. f8. es16 g2. es8.~ es16 aes2~ aes8. f16 f8. f16 g2 g4. r16 g16 bes2 (aes4..) aes16 g2 (aes4)
		es4 es2 (d8.) d16 f8. f16 es2.. r16 g16 bes2.~ bes8. bes16 bes2 (aes4) aes4 g2 (f8.) f16 g8. aes16 g2
	    }

	    \new Voice = "basses"
	    {
		\voiceFour
		es4 es8. es16 es4.. es16 aes,8. aes,16 c8. aes,16 es2 es8 s16 es16 bes,8. bes,16 c4 c8. c16 bes,4 bes,8. bes,16 es2\fermata
		es4 es8. es16 d4.. d16 c8. c16 c8. aes,16 <es es,>2 <es es,>8 s16 es16 es8. es16 d4 d8. d16 d4 d8. d16 g,2..
		s16 es16 d4 bes, <f d> bes,4 es8. es16 bes,8. bes,16 es4 es8 s16 es16 d4 bes, <f d> bes, es8. es16 bes,8. bes,16 es4. s8
		c2. c8. c16 g,2. g,8.~ g,16 f,2~ f,8. f,16 f,8. f,16 c2 c4. s16 c16 bes,2 (aes,4..) aes,16 g,4 (bes, aes,)
		aes,4 bes,2~ bes,8. bes,16 bes,8. bes,16 es2.. s16 es16 bes,2.~ bes,8. d16 es2 (aes,4) aes, bes,2~ bes,8. bes,16 bes,8. bes,16 <es es,>2\fermata
	    }
	>>
	\context Lyrics = sopranos \lyricsto sopranos \sopWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \sopWordsTwo
	\context Lyrics = sopranosThree \lyricsto sopranos \sopWordsThree
	%\context Lyrics = sopranosFour \lyricsto sopranos \sopWordsFour
	%\context Lyrics = sopranosFive \lyricsto sopranos \sopWordsFive
	%\context Lyrics = sopranosSix \lyricsto sopranos \sopWordsSix
	%\context Lyrics = sopranosSeven \lyricsto sopranos \sopWordsSeven
	%\context Lyrics = altos \lyricsto altos \altoWords
	%\context Lyrics = tenors \lyricsto tenors \tenorWords
	%\context Lyrics = basses \lyricsto basses \bassWords
    >>
	
    \midi { }
    \layout
    {	
	\context
	{
	    \Lyrics
	    \override VerticalAxisGroup .minimum-Y-extent = #'(0 . 0)
	}
	\context
	{
	    \Voice
	    \consists "Horizontal_bracket_engraver"
	}
    }
}


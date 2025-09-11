\version "2.18.2"

voiceone = \relative c' {
    \set harmonicDots = ##t
    \mergeDifferentlyHeadedOn 
    \stemNeutral \slurNeutral \tieNeutral
    \override MultiMeasureRest #'staff-position = #2.0

    

    R1*3/4^\markup {
	\translate #`(0 . 3 ) {
	    \hspace #10.0 \bold \roman \fontsize #1.0 "Lent et douloureux"
	}
    } |

    R1*3/4 | R1*3/4 | R1*3/4 | 
    b4\rest \SDne fis'(_\p a | g fis cis | b cis d) | \stemDown \SDna a2.^( | \stemNeutral \TDna fis2.-~ |
    \TDna fis2.-~ | \TDna fis2.) | R1*3/4 |
    b4\rest \SUpb fis'(_\p a | g fis cis | b cis d) | a2.( | cis2.) |  
    \SDnb fis2.( | e,_~ | e) | R1*3/4 | 
    \repeat unfold 18 { s2. }

    R1*3/4 | R1*3/4 | R1*3/4 | R1*3/4 |
    \clef "G"
    \override NoteHead.style = #'harmonic
    \override NoteHead.font-size = #1.2

   % b''4\rest \SDne fis'(_\p a | g fis cis | b cis d) |
    b''4\rest fis'(_\p a | g fis cis | b cis d) |
    \stemDown \SDnf a2.^( | \stemNeutral \TDna fis2.~ |  
    \TDnb fis2.~ | fis2.) | R1*3/4 | 
    b4\rest \SDne fis'(_\p a | g fis cis | b cis d) | a2.( | cis2.) |  
    \SDnb fis2.( | \TIni e,_~ | e) | R1*3/4 |
}

voicetwo = \relative c' {
    \stemNeutral \slurNeutral \tieNeutral
    \repeat unfold 21 { s2. }
    \SUpc a4( b c | e d b | d c b | \TIna d2.~ | d2) d4( |
    e4 f g | a c, d | e d b | \TIna d2.~ | d2) d4( |
    g2. | fis2. | b,4 \stemDown a \stemNeutral b | cis d e ) | \SUpa cis( d e |
    fis,2 g4 | c2. | d) |
    \bar "||"

    \repeat unfold 21 { s2. }
    \SUpd a'4( b c | e d b | d c b | \TIna d2.~ | d2) \SDnd d4( |
    e4 f g | a c, d | e d b | \TInb d2.~ | d2) \SDng d4( |
    g2. | f2.) |
   % \SDncc b,4( c f | e d c | e d c | f,2 g4 | c2. | d) |
    b,4( c f | e d c | e d c | f,2 g4 | c2. | d) |
    \bar "|."
}

voicethree = \relative c' {
}

voicefour = \relative c {
}

guitarone = << \voiceone \\ \voicetwo \\ \voicethree \\ \voicefour >>


\version "2.24.0"




\layout {
  indent = 0.0\cm
   % Makes the size of the grace notes smaller
    \context {
      \Score \with{
        $(add-grace-property 'Voice 'NoteHead 'font-size '-6)
        $(add-grace-property 'Voice 'Slur 'height-limit '0.5)
        $(add-grace-property 'Voice 'Flag 'font-size '-5)
        $(add-grace-property 'Voice 'Stem 'length '4)
        $(add-grace-property 'Voice 'Stem 'length-fraction '0.7)
        $(add-grace-property 'Voice 'Stem 'thickness '0.8)
        $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
        $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
        $(add-grace-property 'Voice 'Beam 'shorten '1)
      }
    }
  % Changes default group beaming
  % from: |_|_|_|_|_|
  %
  % to  : |_| |_| |_|
  % Disable beamExceptions because they are definitely
  % defined for 4/4 time  
    \set beamExceptions = #'()

  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1,1
  %
  \context {
    \overrideTimeSignatureSettings
      3/4        % timeSignatureFraction
      1/4        % baseMomentFraction
      1,1        % beatStructure
      #'()       % beamExceptions
  }
  
}
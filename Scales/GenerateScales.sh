#!/bin/bash


# This was brought to you by Jacques Menu,
# under the Commit Public License (CSL), w
# which means that you are committed to:
# 	- enhance it;
# 	- adapt it to you needs;
# 	- broadcast it!
# 18-AUG-2013


# The Lilypond pitches
ALL_PITCHES="aes a ais bes b bis ces c cis des d dis ees d dis fes f fis ges g gis"


# -------------------------------------------------------------------------
# Analyze options and arguments
# -------------------------------------------------------------------------

DisplayUsage ()
	{
	echo
	echo "--> Usage: $0 [-h(elp)] [pitch]"
	echo
	echo "    'pitch', if present, must be one of:"
	echo "        ${ALL_PITCHES}"
	echo "    Otherwise, all 21 pitches are handled"
	echo
	}

# grab number of arguments
ITERS=$#

# Pitches we'll handle, all 21 of them by default
PITCHES="${ALL_PITCHES}"

# Didn't meet a single pitch as argument yet
SINGLE_PITCH_MET=0

# Uncomment following command to activate bash trace mode
#set -x


while [ ${ITERS} -gt 0 ]; do

	# echo "--> ITERS = ${ITERS}"
	# echo '--> $1 = ' $1
	# echo "--> PITCHES = ${PITCHES}"

	# -------------------------------------------------------------------------
	# Analyze next option/argument
	# -------------------------------------------------------------------------

	case "$1" in
		"-h" )
			DisplayUsage
			exit
			;;

		"-"* )
			echo
			echo "--> Sorry, $0 has no '$1' option"
			DisplayUsage
			exit
			;;

		* )
			# catch-all case
			
			# echo '==> $1 = ' $1

			# did we meet a single pitch already?
			if [ ${SINGLE_PITCH_MET} -eq 1 ]; then
				echo
				echo "--> ### Sorry, can't accept pitch '$1': '${PITCHES}' has already been specified ###"
				DisplayUsage
				exit
			fi

			# is $1 a legal pitch?
			for PITCH in ${ALL_PITCHES}; do
				# echo "--> PITCH = ${PITCH}"
				if [ $1 == ${PITCH} ]; then
					# found it
					PITCHES="${1}"
					SINGLE_PITCH_MET=1
					break
				fi
			done
			if [ -z "${PITCHES}" ]; then
				# didn't find ${1} in ${ALL_PITCHES}
				echo
				echo "--> ### Sorry, '${1}' is no legal Lilypond pitch ###"
				DisplayUsage
				exit
			fi
			# go handle next argument
			shift
			;;
	esac

	if [ ${ITERS} -eq 0 ]; then
		# all arguments have been processed
		break
	fi

	let ITERS--
	
done


# -------------------------------------------------------------------------
# Create folders to receive the created Lilypond and PDF files if necessary
# -------------------------------------------------------------------------

ENGLISH_SUBDIR=en
if [ ! -d ${ENGLISH_SUBDIR} ]; then
	mkdir -p ${ENGLISH_SUBDIR}
fi
FRENCH_SUBDIR=fr
if [ ! -d ${FRENCH_SUBDIR} ]; then
	mkdir -p ${FRENCH_SUBDIR}
fi

echo "--> ENGLISH_SUBDIR                  = ${ENGLISH_SUBDIR}"
echo "--> FRENCH_SUBDIR                   = ${FRENCH_SUBDIR}"
echo


# -------------------------------------------------------------------------
# Process the pitches in ${PITCHES}
# -------------------------------------------------------------------------

for LILY_PITCH in ${PITCHES}; do

	# echo "--> LILY_PITCH   = ${LILY_PITCH}"
	# echo

	# -------------------------------------------------------------------------
	# Set variables
	# -------------------------------------------------------------------------

	# Following *_REF are to adjust scale height for it to be easily readable
	# Add i.e. VIOLA_REF if you need it!
	# First setting default values
	TREBLE_REF="c'"
	BASS_REF="c,"
	
	# Use the following if you want all upper case letters
	# ENGLISH_PITCH_FILENAME_FRAGMENT=$(echo ${LILY_PITCH} | tr a-z A-Z)
	# Otherwise keep definition below
	ENGLISH_PITCH_FILENAME_FRAGMENT=${LILY_PITCH}
	
	# Analyze pitch to set useful variables, 
	# including *_REF if needed to obtain easily readable notes
	case ${LILY_PITCH} in
		aes )
			FRENCH_PITCH_FILENAME_FRAGMENT="LaBemol"
			FRENCH_PITCH_NAME="La bémol"
			;;
		a )
			FRENCH_PITCH_FILENAME_FRAGMENT="La"
			FRENCH_PITCH_NAME="La"
			;;
		ais )
			FRENCH_PITCH_FILENAME_FRAGMENT="LaDiese"
			FRENCH_PITCH_NAME="La dièse"
			;;

		bes )
			FRENCH_PITCH_FILENAME_FRAGMENT="SiBemol"
			FRENCH_PITCH_NAME="Si bémol"
			;;
		b )
			FRENCH_PITCH_FILENAME_FRAGMENT="Si"
			FRENCH_PITCH_NAME="Si"
			;;
		bis )
			FRENCH_PITCH_FILENAME_FRAGMENT="SiDiese"
			FRENCH_PITCH_NAME="Si dièse"
			;;

		ces )
			FRENCH_PITCH_FILENAME_FRAGMENT="DoBemol"
			FRENCH_PITCH_NAME="Do bémol"
			BASS_REF="c"
			;;
		c )
			FRENCH_PITCH_FILENAME_FRAGMENT="Do"
			FRENCH_PITCH_NAME="Do"
			BASS_REF="c"
			;;
		cis )
			FRENCH_PITCH_FILENAME_FRAGMENT="DoDiese"
			FRENCH_PITCH_NAME="Do dièse"
			BASS_REF="c"
			;;

		des )
			FRENCH_PITCH_FILENAME_FRAGMENT="ReBemol"
			FRENCH_PITCH_NAME="Ré bémol"
			BASS_REF="c"
			;;
		d )
			FRENCH_PITCH_FILENAME_FRAGMENT="Re"
			FRENCH_PITCH_NAME="Ré"
			BASS_REF="c"
			;;
		dis )
			FRENCH_PITCH_FILENAME_FRAGMENT="ReDiese"
			FRENCH_PITCH_NAME="Ré dièse"
			BASS_REF="c"
			;;

		ees )
			FRENCH_PITCH_FILENAME_FRAGMENT="MiBemol"
			FRENCH_PITCH_NAME="Mi bémol"
			BASS_REF="c"
			;;
		e )
			FRENCH_PITCH_FILENAME_FRAGMENT="Mi"
			FRENCH_PITCH_NAME="Mi"
			;;
		eis )
			FRENCH_PITCH_FILENAME_FRAGMENT="MiDiese"
			FRENCH_PITCH_NAME="Mi dièse"
			;;

		fes )
			FRENCH_PITCH_FILENAME_FRAGMENT="FaBemol"
			FRENCH_PITCH_NAME="Fa bémol"
			;;
		f )
			FRENCH_PITCH_FILENAME_FRAGMENT="Fa"
			FRENCH_PITCH_NAME="Fa"
			;;
		fis )
			FRENCH_PITCH_FILENAME_FRAGMENT="FaDiese"
			FRENCH_PITCH_NAME="Fa dièse"
			;;

		ges )
			FRENCH_PITCH_FILENAME_FRAGMENT="SolBemol"
			FRENCH_PITCH_NAME="Sol bémol"
			;;
		g )
			FRENCH_PITCH_FILENAME_FRAGMENT="Sol"
			FRENCH_PITCH_NAME="Sol"
			;;
		gis )
			FRENCH_PITCH_FILENAME_FRAGMENT="SolDiese"
			FRENCH_PITCH_NAME="Sol dièse"
			;;

		* )
			echo
			echo "--> ### Internal error, illegal option '${1}' should have been detected earlier... ###"
			echo
			exit 2
			;;

	esac

	echo "--> LILY_PITCH                      = ${LILY_PITCH}"
	echo "--> TREBLE_REF                      = ${TREBLE_REF}"
	echo "--> BASS_REF                        = ${BASS_REF}"

	echo "--> ENGLISH_PITCH_FILENAME_FRAGMENT = ${ENGLISH_PITCH_FILENAME_FRAGMENT}"
	echo "--> ENGLISH_PITCH_NAME              = ${LILY_PITCH}"

	echo "--> FRENCH_PITCH_FILENAME_FRAGMENT  = ${FRENCH_PITCH_FILENAME_FRAGMENT}"
	echo "--> FRENCH_PITCH_NAME               = ${FRENCH_PITCH_NAME}"
	echo


	# -------------------------------------------------------------------------
	# Handle template files found in current directory
	# -------------------------------------------------------------------------

	for TEMPLATE_FILE in $(ls *ScalesTemplate.ly); do

		# Extract template name as first part of template file name
		TEMPLATE_NAME=$(echo ${TEMPLATE_FILE%ScalesTemplate.ly})

		echo "--> TEMPLATE_NAME                   = ${TEMPLATE_NAME}"
		echo
		
		# Determine Lilypond files names
		ENGLISH_LILY_FILENAME=${ENGLISH_PITCH_FILENAME_FRAGMENT}_${TEMPLATE_NAME}.ly
		FRENCH_LILY_FILENAME=${FRENCH_PITCH_FILENAME_FRAGMENT}_${TEMPLATE_NAME}.ly

		echo "--> ENGLISH_LILY_FILENAME           = ${ENGLISH_LILY_FILENAME}"
		echo "--> FRENCH_LILY_FILENAME            = ${FRENCH_LILY_FILENAME}"
		echo

		# Determine PDF files names
		ENGLISH_PDF_FILENAME=${ENGLISH_PITCH_FILENAME_FRAGMENT}_${TEMPLATE_NAME}.pdf
		FRENCH_PDF_FILENAME=${FRENCH_PITCH_FILENAME_FRAGMENT}_${TEMPLATE_NAME}.pdf
	
		echo "--> ENGLISH_PDF_FILENAME            = ${ENGLISH_PDF_FILENAME}"
		echo "--> FRENCH_PDF_FILENAME             = ${FRENCH_PDF_FILENAME}"
		echo
		

		# Create "${ENGLISH_LILY_FILENAME}" from "${TEMPLATE_FILE}"
		cat ${TEMPLATE_FILE} | \
			sed "s/__LILY_PITCH__/${LILY_PITCH}/g" | \
			sed "s/__FRENCH_PITCH_NAME__/${FRENCH_PITCH_NAME}/g" | \
			sed "s/__PITCH_FILENAME_FRAGMENT__/${ENGLISH_PITCH_FILENAME_FRAGMENT}/g" | \
			sed "s/__TREBLE_REF__/${TREBLE_REF}/g" | \
			sed "s/__BASS_REF__/${BASS_REF}/g" \
			> \
			${ENGLISH_SUBDIR}/${ENGLISH_LILY_FILENAME}

		# Compile "${ENGLISH_LILY_FILENAME}" with Lilypond
		cd ${ENGLISH_SUBDIR}
		lilypond ${ENGLISH_LILY_FILENAME}
		cd ..
	
		# Duplicate generated files with a french name
		cp -p ${ENGLISH_SUBDIR}/${ENGLISH_LILY_FILENAME} ${FRENCH_SUBDIR}/${FRENCH_LILY_FILENAME}
		cp -p ${ENGLISH_SUBDIR}/${ENGLISH_PDF_FILENAME} ${FRENCH_SUBDIR}/${FRENCH_PDF_FILENAME}


		# List resulting files
		echo
		ls -sal ${ENGLISH_SUBDIR}/${ENGLISH_LILY_FILENAME}
		ls -sal ${ENGLISH_SUBDIR}/${ENGLISH_PDF_FILENAME}
		ls -sal ${FRENCH_SUBDIR}/${FRENCH_LILY_FILENAME}
		ls -sal ${FRENCH_SUBDIR}/${FRENCH_PDF_FILENAME}
		echo

	done
		
done

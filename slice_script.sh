#!/bin/bash

if [ $# -ne 2 ]; then
	echo "$0 STLFILE BASEDIR"
	exit 1
fi

function check_and_mkdir {
	if [ ! -d "$1" ]; then
		mkdir -p "$1"
	fi
}

OUT_ROOT=/home/bunnysamurai/scripted-gcode
BASEDIR=$2
INFILE=`basename "$1"`
SRCDIR=`dirname "$1"`
OUTDIR=${SRCDIR/$BASEDIR/$OUT_ROOT}
OUTFILE="$OUTDIR/${INFILE%stl}gcode"

check_and_mkdir $OUTDIR
echo "cura-slicer $1 --output=$OUTFILE"
cura-slicer $1 --output=$OUTFILE


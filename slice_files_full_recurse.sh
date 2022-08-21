#!/bin/bash

if [ $# -ne 1 ]; then
	echo "$0 dir"
	exit 1
fi

function slice_action
{
	BASE=$2
	echo "slice_script $1 $BASE"
	slice_script $1 $BASE
}

function walk_action
{
	BASE=$2
	for f in $(ls $1); do
		if [ -d $1/$f ]; then
			walk_action $1/$f $BASE
		else
			if [[ $1/$f == *"stl"* ]]; then
				slice_action $1/$f $BASE
			fi
		fi
	done
}

# delete any trailing /
walk_action ${1%/} ${1%/}

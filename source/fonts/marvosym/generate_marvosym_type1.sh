#!/bin/sh

dir=$PWD
cd ../../../
TDS=$PWD

write_comment()
{
	echo
	echo "# $1"
	echo
}

run_command()
{
	echo
	echo ">>> running: '$1'"
	if $1; then
		echo "    OK"
	else
		echo "    failed"
		return -1
	fi
}

write_comment "create type1 fonts"
cd $TDS/fonts/truetype/public/marvosym
echo "cd $PWD"
run_command "ttf2pt1 -b marvosym.ttf"
run_command "mv marvosym.afm $TDS/fonts/afm/public/marvosym"
run_command "mv marvosym.pfb $TDS/fonts/type1/public/marvosym"

write_comment "create tex metrics"
cd $TDS/fonts/afm/public/marvosym
echo "cd $PWD"
run_command "afm2tfm marvosym.afm"
run_command "mv marvosym.tfm $TDS/fonts/tfm/public/marvosym/umvs.tfm"

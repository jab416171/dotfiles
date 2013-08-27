#!/bin/bash
DIR='/home/josephbass/sandbox/attask/';

SEARCH=$1;
ARG1=$2

# echo $EXEC;
for i in `cd $DIR && git log --all --grep="$SEARCH" --pretty="%H"`; 
do 
	if [ "$ARG1" == "-a" ];
	then
		VAR= git br -a --contains $i
	else
		VAR= git br --contains $i
		VART= git tag --contains $i
	fi
	VAR=$VAR" --- "
	VAR=$VAR git lg -n1 $i;
	echo $VAR;
	VAR=""
done

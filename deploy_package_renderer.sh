#!/bin/bash
clear

# load configurable options are loaded from terminal
GIT_PROJECT_ROOT=$1
OLDER_COMMIT_ID=$2
NEWER_COMMIT_ID=$3

INIT_FOLDER=$HOME'/Desktop/deploy_package'
rm -rf $INIT_FOLDER
mkdir $INIT_FOLDER

# change directory to to your project specified in $1
cd $GIT_PROJECT_ROOT

git diff --name-only $OLDER_COMMIT_ID $NEWER_COMMIT_ID | while read LINE
do
	# output the file that was committed
	echo 'GIT file: '$LINE
	# explode string to obtain folder structure
	ARRAY=$(echo $LINE | tr "/" "\n")
	FULL_PATH=''
	for x in $ARRAY
	do
		# start contatinating folder structure
		FULL_PATH=$FULL_PATH'/'$x
		# must trim this to match original source file path structure
		trimmed_path=$(echo $FULL_PATH | awk '{print substr($0,2)}')
		if [ $LINE = $trimmed_path ]
			then
			# file path matches GIT path, copy the file
			echo 'cp '$LINE $INIT_FOLDER$FULL_PATH
			cp $LINE $INIT_FOLDER$FULL_PATH
		else
			# try creating the folder, if it does not exist
			echo 'mkdir -p' $INIT_FOLDER$FULL_PATH
			mkdir -p $INIT_FOLDER$FULL_PATH
		fi
	done
	echo '----'
done
echo 'The deploy package renderer script is finished.'
echo 'https://github.com/dvrgoc thanks you for using it. :)'
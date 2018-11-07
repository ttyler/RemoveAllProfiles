#!/bin/bash


	###############################################################
	#	writen in 2017 by Tomos Tyler, in case anyone needs to fork it
	###############################################################
	#


	jamfMDMProfileID="00000000-0000-0000-A000-4A414D460003"
			

	##################################################################################
	## Local System Inspection #######################################################
	##################################################################################
		## Number of Policies installed locally
		#IFS=' '
		profileCount=`/usr/bin/profiles -C | grep "There are" | awk '{print $3}'`
		profileInstalled=`/usr/bin/profiles -C | awk '{print $4}' | head -n+$profileCount | sed -e :a -e '$!N; s/\n/ /; ta'`
		for i in ${profileInstalled}; do
			if [[ ! $i == $jamfMDMProfileID ]];then
			echo "profiles -R -p $i"
			fi
		done	
		

#!/bin/bash
##################################################
# Name: delete-user.sh
# Description: Automates the removal of a user from a system.
# Script Maintainer: Jacob Amey
#
# Last Updated: July 9th 2013
##################################################
# get_answer Function
#
function get_answer {
#
unset ANSWER
ASK_COUNT=0
#
while [ -z "$ANSWER" ] #While no answer is given, keep asking.
do
	ASK_COUNT=$[ $ASK_COUNT + 1 ]
#
	case $ASK_COUNT in # IF user gives no answer in time alloted
	2)
		echo -e
		echo -e "Please answer the question."
		echo -e
		
	;;
	3)
		echo -e
		echo -e "One last try... please answer the question."
		echo -e
		
	;;
	4)
		echo -e
		echo -e "Since you refuse to answer the question..."
		echo -e "exiting program."
		echo -e
		#
		exit
		
	;;
	esac
#
	echo -e
#
	if [ -n "$LINE2" ] 
	then	# print 2 lines
		echo -e $LINE1
		echo -e -e $LINE2" \c"
	else	#  print 1 line
		echo -e -e $LINE1" \c"
	fi
#
# Allow 60 seconds to answer before time-out
	read -t 60 ANSWER
done
# Do a little variable clean-up
unset LINE1
unset LINE2
#
} # End of get_answer function
#
#############################################
#process_answer Function
#
function process_answer {
#
case $ANSWER in
y|Y|YES|yes|Yes|yEs|yeS|YEs|yES )
# If user answers "yes", do nothing.
;;
*)
# IF user answers anything but "yes", exit script
	echo -e
	echo -e $EXIT_LINE1
	echo -e $EXIT_LINE2
	echo -e
	exit
;;
esac
#
# Do a little variable clean-up
#
unset EXIT_LINE1
unset EXIT_LINE2
#
} # End of Function Definitions.
#
#############################################
# End of Function Definitions
#
################: Main Script :##############
# Get name of User Account to check
#
echo -e "Step #1 - Determine User Account to Delete "
echo -e
LINE1="Please enter the username of the user "
LINE2="account you wish to delete from system:"
get_answer
USER_ACCOUNT=$ANSWER
#
# Double check with script user that this is the correct User account
#
LINE1="IS $USER_ACCOUNT the user account "
LINE2="you wish to delete from system? [y/n]"
get_answer
#
# Call process_answer function:
#	if user answers anything but "yes", exit script
#
EXIT_LINE1="Because the account, $USER_ACCOUNT, is not "
EXIT_LINE2="the one you wish to delete, we are leaving script..."
process_answer
#
##################################################################
# Check that USER_ACCOUNT is really an account on the system
#
USER_ACCOUNT_RECORD=$(cat /etc/passwd | grep -w $USER_ACCOUNT)
#
if [ $? -eq 1 ]		# If the account is not found, exit script
then	
echo -e "Account, $USER_ACCOUNT, not found. "
	echo -e "Leaving the Script..."
	echo -e
	exit 
fi
	echo -e
	echo -e "I found the record:"
	echo -e $USER_ACCOUNT_RECORD
	echo -e
#
LINE1="Is this the correct User Account? [y/n]"
get_answer
#
#
# Call process_answer function:
#	if user answers anything but "yes", exit script
#
EXIT_LINE1="Because the account, $USER_ACCOUNT, is not "
EXIT_LINE2="the one you wish to delete, we are leaving the script..."
process_answer
#
##################################################################
# Search for any running processes that belong to the User Account
#
echo -e
echo -e "Step #2 - Find process on system belonging to user account"
echo -e
echo -e "$USER_ACCOUNT has the following process running: "
echo -e
#
ps -u $USER_ACCOUNT	#List user processes running.

case $? in
1)	# No processes running for this account currently running."
	 #
	echo -e "There are no processes for this account currently running."
	echo -e
;;
0)	# Processes running for this User Account.
# Ask Script User if wants us to kill the processes.
 #
unset ANSWER
LINE1="Would you like me to kill the process(es)? [y/n]"
get_answer
#
	case $ANSWER in
	y|Y|YES|yes|Yes|yEs|yeS|YEs|yES ) #If user answers "yes".
				# Kill User Account processes.
   	#
	echo -e
	#
	# Clean-up temp file upon signals
	trap "rm $USER_ACCOUNT_Running_Process.rpt" SIGTERM SIGINT SIGOUT
	#
	# List user processes running
	ps -u $USER_ACCOUNT > $USER_ACCOUNT_Running_Process.rpt
	#
	exec < $USER_ACCOUNT_Running_Process.rpt	# Make report Std input
	#
	read USER_PROCESS_REC	# First record will be blank
	read USER_PROCESS_REC
	#
	while [ $? -eq0 ]
		do
		# obtain PID
		USER_PID=$(echo -e $USER_PROCESS_REC | cut -d " " -f1)
		kill -9 $USER_PID
		echo -e "Killed process $USER_PID"
		read USER_PROCESS_REC
		done
		#
		echo -e
		rm $USER_ACCOUNT_Running_Process.rpt	#Remove temp report.
	;;
	*)	# If user answers anything but "yes", do not kill.
		echo -e
		echo -e "Will not kill the process(es)"
		echo -e
		
	;;
	esac
;;
esac
##################################################################
# Create a report of all files owned by the User Account
#
echo -e
echo -e "Step #3 - Find files on system belonging to user account"
echo -e
echo -e "Creating a report of all files owned by $USER_ACCOUNT."
echo -e
echo -e "It is recommended that you backup/archive these files."
echo -e "and then do one of two things:"
echo -e " 1) Delete the files"
echo -e " 2) Change the files' ownership to a current user account."
echo -e
echo -e "Please wait. This may take a while..."
#
REPORT_DATE=`date +%y%m%d`
REPORT_FILE=$USER_ACCOUNT"_Files_"$REPORT_DATE".rpt"
#
find / -user $USER_ACCOUNT > $REPORT_FILE 2>/dev/null
#
echo -e
echo -e "Report is complete."
echo -e "Name of report:	$REPORT_FILE"
echo -e "Location of report:	`pwd`"
echo -e
#############################################
# - Remove User Account
echo -e
echo -e "Step #4 - Remove user account"
echo -e
#
LINE1="Do you wish to remove $USER_ACCOUNT's account from system? [y/n]"
get_answer
#
# Call process_answer function:
#	if user answers anything but "yes", exit script
#
EXIT_LINE1="Since you do not wish to remove the user account,"
EXIT_LINE2="$USER_ACCOUNT at this time, exiting script..."
process_answer
#
userdel $USER_ACCOUNT	# delete user account
echo -e "User account, $USER_ACCOUNT, has been removed"
echo -e
# EOF

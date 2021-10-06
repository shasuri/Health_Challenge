#!/bin/bash

# create date file
DATE=$(date "+%Y-%m-%d")
while : ; do
    echo "Date : $DATE"
    echo "1. confirm 2. yesterday 3. exit"
    echo -n "> "
    read INPUT
    case $INPUT in
        1)
            break
            ;;
        2)
            DATE=$(date -v-1d "+%Y-%m-%d")
            break
            ;;
        3)
            exit
            ;;
        *)
            echo "Wrong Input\n"
            break
            ;;
    esac
done
echo "create $DATE file"
touch $DATE

# write exercise record in date file
echo
while : ; do
    echo "Select Exercise"
    echo "1. both 2. pull-up 3. plank"
    echo -n "> "
    read INPUT
    case $INPUT in
        1)
            echo -n "pull up count ex) 12 : "
            read PULL_UP_COUNT
            echo -n "plank time ex) 1m30s : "
            read PLANK_TIME
            echo "pull-up : $PULL_UP_COUNT" > ./$DATE
            echo "plank : $PLANK_TIME" >> ./$DATE
            EXERCISE="pull-up, plank"
            ;;
        2)
            echo -n "pull up count ex) 12 : "
            read PULL_UP_COUNT
            echo "pull-up : $PULL_UP_COUNT" > ./$DATE
            EXERCISE="pull-up"
            ;;
        3)
            echo -n "plank time ex) 1m30s : "
            read PLANK_TIME
            echo "plank : $PLANK_TIME" > ./$DATE
            EXERCISE="pull-up"
            ;;
        *)
            echo "Wrong Input\n"
            continue
            ;;
    esac
    echo
    echo "----result----"
    cat ./$DATE
    echo "--------------"
    echo "1.confirm 2.cancel"
    echo -n "> "
	read INPUT
    case $INPUT in
		1)
			break
			;;
		2)
			;;
		*)
			echo "Wrong Input\n"
			;;
	esac
done

# git add & commit
echo
git add ./$DATE
echo "> git add ./$DATE"

echo "git commit -m [hyorim] $EXERCISE"
while : ; do
	echo "1.confirm 2.cancel"
	echo -n "> "
	read INPUT
	case $INPUT in
		1)
			git commit -m "[hyorim] $EXERCISE"
			break
			;;
		2)
			exit
			;;
		*)
			echo "Wrong Input\n"
			;;
	esac
done

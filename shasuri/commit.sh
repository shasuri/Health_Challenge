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
            DATE=$(date -d "-1days" "+%Y-%m-%d")
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
    echo "Select exercises and choose finish"
    echo "1. running 2. pull-up 3. plank 4. finish"
    echo -n "> "
    read INPUT
    case $INPUT in
        1)
            echo -n "running time ex) 15m30s : "
            read RUNNING_TIME
            echo -n "running distance ex) 2.3km : "
            read RUNNING_DIST
            echo "running : $RUNNING_TIME $RUNNING_DIST" >> ./$DATE
            EXERCISE=$EXERCISE"running "
            ;;
        2)
            echo -n "pull up count ex) 12 : "
            read PULL_UP_COUNT
            echo "pull-up : $PULL_UP_COUNT" >> ./$DATE
            EXERCISE=$EXERCISE"pull-up "
            ;;
        3)
            echo -n "plank time ex) 1m30s : "
            read PLANK_TIME
            echo "plank : $PLANK_TIME" >> ./$DATE
            EXERCISE=$EXERCISE"plank "
            ;;
        4)
            echo -n "Fin."
            break
            ;;
        *)
            echo "Wrong Input\n"
            continue
            ;;
    esac
done

echo
echo "----result----"
cat ./$DATE
echo "--------------"

while : ; do
    echo "1.confirm 2.cancel"
    echo -n "> "
    read INPUT
    case $INPUT in
        1)
            ;;
        2)
            exit 1
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

echo "git commit -m [shasuri] $EXERCISE"
while : ; do
	echo "1.confirm 2.cancel"
	echo -n "> "
	read INPUT
	case $INPUT in
		1)
			git commit -m "[shasuri] $EXERCISE"
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

exit 0
#!/bin/bash
getname(){
name=$(gclone listremotes)
}
call(){
echo "================="
type = $(grep -Po 'type = \K[^ ]+' '.config/rclone/rclone.conf')
if [ "$type" = "drive" ]
then
	printf "Got remote name = $name\nTeamDrive = $td_id\n"
else	
	printf "Got remote name = $name\n"
fi
echo "================="
echo "Select your choice" 
printf "1 - copyurl\n2 - links\n3 - drive cloning\nq - Exit\n=================\nEnter your Choice: "
read r
if [[ "$r" == "1" ]]
then
	echo "================="
	copyurl
elif [[ "$r" == "2" ]]
then
	echo "================="
	links
elif [[ "$r" == "3" ]]
then
	echo "================="
	clone
elif [[ "$r" == "q" ]]
then
	echo "Exiting..."
	exit
else 
	printf "=================\nWrong Choice ! Start Again\n================="
	call
fi
call
}
clone(){
printf "Enter file/folder id\n[If you want New destination foldername, enter ID <space> <foldername>]"
read id
printf "=================\n"
if [[ "$id" = *" "* ]]
then
	IFS=' ' read s1 s2 <<< $id
        eval "gclone copy $b$name{$s1}$b $b$name{$td_id}/$s2$b --drive-server-side-across-configs -P"
else	
	eval "gclone copy $b$name{$id}$b $b$name{$td_id}$b --drive-server-side-across-configs -P"
fi
}
copyurl(){
echo "Enter URL"
read url
printf "=================\n"
eval "gclone copyurl "$b$url$b" "$name/" -aP"
}
links(){
printf "=================\n"
echo "Enter FileName along with path :"
read fl
printf "1. Get sharing Link\n2. Stop sharing link\nEnter a choice:"
read ch
if [[ "$ch" == "1" ]]
then
	eval "rclone link $b$name$fl$b"
elif [[ "$ch" == "2" ]]
then
	eval "rclone link --unlink $b$name$fl$b"
else
	echo "=================\nWrong Choice ! Start Again\n================="
	links
fi
}
main(){
b='"'
getname
td_id=$(grep -Po 'team_drive = \K[^ ]+' '.config/rclone/rclone.conf')
printf "=====WELCOME======\n=================\nA Program by:$DEV\n=================\n"
call
}
main

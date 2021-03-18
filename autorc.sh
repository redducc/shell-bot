#!/bin/bash
getname(){
name=$(rclone listremotes)
}
choice(){
echo "================="
echo "Continue? (y/n)"
read ch
if [[ "$ch" == "y" ]]
then
	call
elif [[ "$ch" == "n" ]]
then
	echo "Exiting"
	exit
else
	printf "Wrong Choice!Enter again\n================="
	choice
fi
}
call(){
echo "================="
printf "Got remote name = $name\nTeamDrive ID = $td_id"
echo "================="
echo "Select your choice" 
printf "1. copyurl\n2. links\n3. drive cloning\nEnter a number: "
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
else 
	printf "=================\nWrong Choice ! Start Again\n================="
fi
choice
}
clone(){
echo "Enter file/folder id"
read id
printf "=================\n"
eval "rclone copy $b$name{$id}$b $bname$b{$td_id}$b --drive-server-side-across-configs -vP"
}
copyurl(){
echo "Enter URL"
read url
printf "=================\n"
eval "rclone copyurl "$b$url$b" "$name:/" -aP"
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
td_id=$(grep -Po 'team_drive = \K[^ ]+' .config/rclone/rclone.conf)
printf "=====WELCOME======\n================="
call
}
main

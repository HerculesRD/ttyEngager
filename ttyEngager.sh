#!/bin/bash

int_handler()
{
	echo
	echo
    echo -e "\n${L_PURPLE}[+]Exiting...${NC}"
    tput cnorm #Retorning pointer
    # Kill the parent process of the script.?
    #kill $PPID
    exit 1
}

trap 'int_handler' INT

isPyAble=$(which python)
isPerlAble=$(which perl)
isRubyAble=$(which ruby)
isLuaAble=$(which lua)
isBashAble=$(which bash)
isShAble=$(which sh)
isZshAble=$(which zsh)
#defShell=$(echo $SHELL)
#myGroup=$(id | sed 's/(/ /g' | sed 's/)/ /g' | awk '{print $4}')
#myUser=$(echo $USER)

if [[ $isBashAble ]]; then
	myShell=$isBashAble
elif [[ $isShAble ]]; then
	myShell=$isShAble
elif [[ $isZshAble ]]; then
	myShell=$isZshAble
fi

echo -e "Menu: "
echo -e "Choose one of the next"
echo

if [[ $isPyAble ]];then
	echo -e "1) Python"
fi

if [[ $isPerlAble ]];then
	echo -e "2) Perl"
fi

if [[ $isRubyAble ]];then
	echo -e "3) Ruby"
fi

if [[ $isLuaAble ]];then
	echo -e "4) Lua"
fi

if [[ $defShell || $isZshAble || $isShAble || $isBashAble ]]; then
	echo -e "5) shell -i"
	#echo -e "6) os.system (not implemented yet)"
fi

echo
read -p "Type the option you want: " option

if [[ $isShAble ]]; then
	if [[ $option -eq 1 ]]; then
		python -c 'import pty; pty.spawn("/bin/sh")'
	elif [[ $option -eq 2 ]]; then
		perl -e 'exec "/bin/sh";'
	elif [[ $option -eq 3 ]]; then
		ruby -e 'exec "/bin/sh"'
	elif [[ $option -eq 4 ]]; then
		lua -e "os.execute('/bin/sh')"
	elif [[ $option -eq 5 ]]; then
		${myShell} -i
	#elif [[ $option -eq 6 ]]; then
		#echo os.system('/bin/bash')
	fi
elif [[ $isBashAble ]]; then
	if [[ $option -eq 1 ]]; then
		python -c 'import pty; pty.spawn("/bin/bash")'
	elif [[ $option -eq 2 ]]; then
		perl -e 'exec "/bin/bash";'
	elif [[ $option -eq 3 ]]; then
		ruby -e 'exec "/bin/bash"'
	elif [[ $option -eq 4 ]]; then
		lua -e "os.execute('/bin/bash')"
	elif [[ $option -eq 5 ]]; then
		${myShell} -i
	#elif [[ $option -eq 6 ]]; then
		#echo os.system('/bin/bash')
	fi
elif [[ $isZshAble ]]; then
	if [[ $option -eq 1 ]]; then
		python -c 'import pty; pty.spawn("/bin/zsh")'
	elif [[ $option -eq 2 ]]; then
		perl -e 'exec "/bin/zsh";'
	elif [[ $option -eq 3 ]]; then
		ruby -e 'exec "/bin/zsh"'
	elif [[ $option -eq 4 ]]; then
		lua -e "os.execute('/bin/zsh')"
	elif [[ $option -eq 5 ]]; then
		${myShell} -i
	#elif [[ $option -eq 6 ]]; then
		#echo os.system('/bin/bash')
	fi
fi
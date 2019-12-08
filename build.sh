#!/bin/bash
echo Clearing Object Files and Executable Files
rm -r *.exe *.o *.out
echo Done!
sleep .5
clear
echo Available Files -
for f in $(ls *.cpp); do echo $f; done
echo
echo Enter File Name -- Without Extension
read fname
if [[ -f ${fname}.cpp ]]; then
    echo What do you want to compile it with?
    echo Clang++ or G++
    echo Enter '1' for Clang++ and '2' for G++
    read temp
    COMPILED_PROGRAM=a.out
    if [[ $temp = "1" ]]; then
        clear
        echo Compiling $fname.cpp with Clang++
        clang++ $fname.cpp
        if [[ -f ${COMPILED_PROGRAM} ]]; then
            echo
            echo Build With Clang++ without any errors
            sleep .5
            clear
        else
            echo
            echo Check the Program Please
            sleep 5
            clear
            exit
        fi
    else
        if [[ $temp = "2" ]]; then
            clear
            echo Compiling $fname.cpp with G++
            g++ $fname.cpp
            if [[ -f ${COMPILED_PROGRAM} ]]; then
                echo
                echo Build With G++ without any errors
                sleep .5
                clear
            else
                echo
                echo Check the Program Please
                sleep 5
                clear
                exit
            fi
        else
            if [ $temp != "1" ] && [ $temp != "2" ]; then
                echo Wrong Compiler
                echo Exiting!
                sleep 1
                clear
                exit
            fi
        fi
    fi
else
    echo File Does not Exist
    echo Exiting!!
    sleep 1
    clear
    exit
fi
echo Running Compiled Program Now
sleep 1
clear
./a.out
echo
echo Clear Screen?
echo '1' for yes and anything else for no
read temp
if [[ $temp = "1" ]]; then
    clear
    echo K Thanks, Bye!
    sleep 3
    clear
    exit
else
    if [[ $temp != "1" ]]; then
        echo K Thanks, Bye!
        exit
    fi
fi

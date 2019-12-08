echo Run Programs?
echo
echo Enter '1' for yes and anything else to Exit
read temp
if [[ $temp = "1" ]]; then
    clear
    echo Choices:
    echo 1. Other Programs
    echo 2. Practical File Programs
    echo
    echo Your Choice?
    read temp
    if [[ $temp = "1" ]]; then
        echo Running my CPP Programs
        bash build.sh
    else
        if [[ $temp = "2" ]]; then
            echo Running Practical File Programs
            cd Practical_File
            bash ../build.sh
        else
            echo Wrong Input
            echo Exiting!
            sleep 2
            clear
            exit
        fi
    fi
else
    echo
    echo Uh-Huh! Wrong Input
    echo Exiting!
    sleep 2
    clear
    exit
fi

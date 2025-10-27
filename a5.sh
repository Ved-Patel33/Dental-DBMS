#!/bin/sh

# Define Pause function
Pause() {
    echo "Press Enter to continue..."
    read -r dummy
}

MainMenu()
{
    while [ "$CHOICE" != "START" ]
    do
        clear
        echo "================================================================="
        echo "| Dental Clinic Database App                                   |"
        echo "| Main Menu - Select Desired Operation(s):                     |"
        echo "-----------------------------------------------------------------"
        echo " $IS_SELECTEDD D) Drop Tables"
        echo " $IS_SELECTEDC C) Create Tables"
        echo " $IS_SELECTEDP P) Populate Tables"
        echo " $IS_SELECTED1 1) Adv. Query 1: "
        echo " $IS_SELECTED2 2) Adv. Query 2: "
        echo " $IS_SELECTED3 3) Adv. Query 3: "
        echo " $IS_SELECTED4 4) Adv. Query 4: "
        echo " $IS_SELECTED5 5) Adv. Query 5: "
	echo " $IS_SELECTED6 6) Adv. Query 6: "
        echo " "
        echo " $IS_SELECTEDX X) End/Exit"
    
        read -p "Enter your choice: " CHOICE

        if [ "$CHOICE" = "D" ]
        then
            bash drop_tables.sh $username $password
            Pause

        elif [ "$CHOICE" = "C" ]
        then
            bash create_tables.sh $username $password
            Pause

        elif [ "$CHOICE" = "P" ]
        then
            bash populate_tables.sh $username $password 
            Pause

        elif [ "$CHOICE" = "1" ]
        then
            bash query1.sh $username $password 
            Pause

        elif [ "$CHOICE" = "2" ]
        then
            bash query2.sh $username $password
            Pause

        elif [ "$CHOICE" = "3" ]
        then
            bash query3.sh $username $password
            Pause

        elif [ "$CHOICE" = "4" ]
        then
            bash query4.sh $username $password
            Pause

        elif [ "$CHOICE" = "5" ]
        then
            bash query5.sh $username $password
            Pause

	elif [ "$CHOICE" = "6" ]
        then
            bash query6.sh $username $password
            Pause    

        elif [ "$CHOICE" = "X" ]
        then
            exit
        fi
    done
}

# Main Program
ProgramStart()
{
    while [ 1 ]
    do
        MainMenu  # Fixed: removed parentheses
    done
}

# Get credentials
read -p "Enter Oracle Username: " username
read -p "Enter Oracle Password: " password

# Start program
ProgramStart


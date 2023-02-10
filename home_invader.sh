#!/bin/bash

# colours
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# use this to clear the colour
clear='\033[0m'


echo -e "\033[1;31m
    ,---,                                                 
  .'  .' \`\\                                               
,---.'     \\    ,---.     ,---.         ,----,            
|   |  .\`\\  |  '   ,'\\   '   ,'\\      .'   .\`|            
:   : |  '  | /   /   | /   /   |  .'   .'  .'      .--,  
|   ' '  ;  :.   ; ,. :.   ; ,. :,---, '   ./     /_ ./|  
'   | ;  .  |'   | |: :'   | |: :;   | .'  /   , ' , ' :  
|   | :  |  ''   | .; :'   | .; :\`---' /  ;--,/___/ \\: |  
'   : | /  ; |   :    ||   :    |  /  /  / .\`| .  \\  ' |  
|   | '\` ,/   \\   \\  /  \\   \\  / ./__;     .'   \\  ;   :  
;   :  .'      \`----'    \`----'  ;   |  .'       \\  \\  ;  
|   ,.'                          \`---'            :  \\  \\ 
'---'                                              \\  ' ; 
                                                    \`--\`  
\033[0m"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "                 Doozys Home Invader"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo
echo -e "${green}For cheatsheets and more: https://navkang.github.io/Doozy${clear}"
echo
echo -e "${blue}This tool will check each users home directory's bash_history file${clear}"
echo " -------------------------------------------------------------------"
echo


colours=(red green yellow blue magenta cyan white)

# colour dict increases
colour_index=0

# Loop through all the users on the system
for user in $(cut -d: -f1 /etc/passwd); do
  # Check if the user has a home directory
  if [ -d "/home/$user" ]; then
    # Check if the bash history file exists 
    if [ -f "/home/$user/.bash_history" ]; then
      # Display the contents of the .bash_history file 
      echo -e "\033[1;3${color_index}m--- $user .bash_history ---\033[0m"
      cat "/home/$user/.bash_history"
      echo ""
      # Increment the colour index
      colour_index=$(((colour_index + 1) % ${#colours[@]}))
    fi
  fi
done

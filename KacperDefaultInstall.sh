#!/bin/bash

echo Please type in your Profile Name 
while read -r profileName

function StartupAdding {
	touch /home/$profileName/.config/autostart/KPXC.desktop
        echo "[Desktop Entry]" > /home/$profileName/.config/autostart/KPXC.desktop
        echo "Exec=keepassxc"  >> /home/$profileName/.config/autostart/KPXC.desktop
        echo "Name=KPXC"  >> /home/$profileName/.config/autostart/KPXC.desktop
        echo "Type=Application"  >> /home/$profileName/.config/autostart/KPXC.desktop
        
        touch /home/$profileName/.config/autostart/ST.desktop
        echo "[Desktop Entry]" > /home/$profileName/.config/autostart/ST.desktop
        echo "Exec=syncthing -no-browser"  >> /home/$profileName/.config/autostart/ST.desktop
        echo "Name=ST"  >> /home/$profileName/.config/autostart/ST.desktop
        echo "Type=Application"  >> /home/$profileName/.config/autostart/ST.desktop
                        
}

do
    if [ -d /home/$profileName ]; then
        echo “Profile Exists”
	StartupAdding
        break
    else
        echo "Input not understood"
    fi
done



apt install -y apt-transport-https curl 
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list


curl -s https://syncthing.net/release-key.txt | apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list

curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list


apt update


apt install  -y brave-browser
apt-get install -y syncthing 
snap install keepassxc 
snap install cherrytree
apt install -y  signal-desktop 



#touch ~/.config/KacperStartupScript.sh 
#chmod u+rx ~/.config/KacperStartupScript.sh 
#echo "#!/bin/bash" >> ~/.config/KacperStartupScript.sh 
#echo "syncthing &">> ~/.config/KacperStartupScript.sh 
#echo keepassxc  >> ~/.config/KacperStartupScript.sh 

#touch ~/.config/autostart/KacperStartupScript.sh.desktop
#chmod u+rx ~/.config/autostart/KacperStartupScript.sh.desktop
#echo "[Desktop Entry]" > ~/.config/autostart/KacperStartupScript.sh.desktop
#echo "Type=Application" >>  ~/.config/autostart/KacperStartupScript.sh.desktop
#echo "Exec=~/.config/KacperStartupScript.sh" >>   ~/.config/autostart/KacperStartupScript.sh.desktop
#echo "Name=KacperStartupSync" >>   ~/.config/autostart/KacperStartupScript.sh.desktop







wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
wget https://raw.githubusercontent.com/keepassxreboot/keepassxc/master/utils/keepassxc-snap-helper.sh && chmod u+rx ./keepassxc-snap-helper.sh 
 
	    sed -i 's/$(whiptail/5 #$(whiptail/g' ./keepassxc-snap-helper.sh
            sed -i 's/--title "Browser Selection" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/--menu "Choose a browser to integrate with KeePassXC:" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/15 60 5/#/g' ./keepassxc-snap-helper.sh
            sed -i 's/"1" "Firefox" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/"2" "Chrome" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/"3" "Chromium" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/"4" "Vivaldi" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/"5" "Brave" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/"6" "Tor Browser" /#/g' ./keepassxc-snap-helper.sh
            sed -i 's/3>&1 1>&2 2>&3)/#/g' ./keepassxc-snap-helper.sh
            
            
            ./keepassxc-snap-helper.sh
            
    rm  ./profileName.txt
rm ./keepassxc-snap-helper.sh         
exit 0




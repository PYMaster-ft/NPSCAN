#!/bin/bash
# Copy@right neo programmers see License.txt
#############################################################################################
# Npscan Install script.
# Install tool in linux os.
# NEO PROGRANNERS 2021
#############################################################################################
# PATHs:
# Install directory => default: /usr/share/npscan/
# Bash completion => /etc/bash_completion.d/npscan
# Sym link => /usr/bin/npscan
# Readme => /usr/share/doc/npscan/README.md
# Desktop entry => /usr/share/applications/npscan.desktop
# Icons => /usr/share/icons/hicolor/
# License => /usr/share/doc/npscan/License.txt
#############################################################################################
##
echo "[ ]=======================================================================[ ]";
echo "[ ]                      NEO PROGRAMMWERS                               [ ]";
echo "[ ]                  npscan Tool Install Script                           [ ]";
echo "[ ]=======================================================================[ ]";
echo "[ ] MIT License                                                           [ ]";
echo "[ ] Copyright (c) 2021 NEO PROGRAMMWERS                                  [ ]";
echo "[ ]                                                                       [ ]";
echo "[ ] Permission is hereby granted, free of charge, to any person obtaining [ ]";
echo "[ ] a copy of this software and associated documentation files (npscan),  [ ]";
echo "[ ] to dealin the Software without restriction, including without         [ ]";
echo "[ ] limitation the rights to use, copy, modify, merge, publish,           [ ]";
echo "[ ] distribute, sublicense, and/or sellcopies of the Software, end to     [ ]";
echo "[ ] permit persons to whom the Software is furnished to do so, subject    [ ]";
echo "[ ] to the following conditions:                                          [ ]";
echo "[ ]                                                                       [ ]";
echo "[ ] The above copyright notice and this permission notice shall be        [ ]";
echo "[ ] included in all copies or substantial portions of the Software.       [ ]";
echo "[ ]                                                                       [ ]";
echo "[ ] THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS [ ]";
echo "[ ] OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF            [ ]";
echo "[ ] MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT [ ]";
echo "[ ] IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY  [ ]";
echo "[ ] CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  [ ]";
echo "[ ] TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE     [ ]";
echo "[ ] SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                [ ]";
echo "[ ]=======================================================================[ ]";

echo "";

### Check system compatibility
if [ -d "/usr/bin/" ];
then
echo "[!] By installing this software you agree to our terms! [Y/n]: ";
read baba
if [ "$baba" == "y" ] || [ "$baba" == "Y" ] || [ -z "$baba" ]; 
then
  echo " "
else
  echo "[!] Installation aborted!";
  exit
fi

### Checking previous instalation
echo "[i] Checking directories..."
if [ -e "/usr/bin/npscan" ];
then
echo "[!] A previous installation was found Do you want to replace it? [Y/n]: "
read mama
if [ "$mama" == "y" ] || [ "$mama" == "Y" ] || [ -z "$mama" ];  
then
 rm "/usr/bin/npscan"
else
 echo "[!] Installation aborted!";
 exit
fi
fi

### Setting instalation path
current=$(dirname "$0")
echo "[!] Where do you want to install NPSCAN?";
echo "    Set path or press enter to use default [/usr/share/]: "
read refdir
if [ -z "$refdir" ];
then
  if [ ! -d "/usr/share/npscan/" ];
  then
    mkdir "/usr/share/npscan/";  
  fi
  chmod +x "/usr/share/npscan/";
  refdir="/usr/share/npscan/";
fi

if [ ! -d $refdir ];
then
  until [ -d $refdir ];
  do
   echo "[!] $refdir does not exist!";
   echo "[!] Set path or press enter to use default [/usr/share/]: "
   read refdir
  done
fi
      
## Begin instalation
echo "[!] Installing.. Plaise wait...";

if [ $current != $refdir ];
then
 sleep 1 && echo "[i] Moving files to $refdir ...                         [ 5%]";
 cp -r $current/* $refdir;
fi 

 sleep 1 && echo "[i] Creating symbolic link...                                      [12%]";
 echo "#!/bin/bash 
 perl $refdir/npscan.pl" '${1+"$@"}' > npscan;
 chmod +x npscan;
 cp npscan /usr/bin/;
 rm npscan;
 sleep 1 && echo "[i] Creating Completion link...                                    [18%]";
 if [ -d "/etc/bash_completion.d" ] ;
 then
   chmod +x $refdir/inc/user/npscan;
   cp $refdir/inc/user/npscan /etc/bash_completion.d/;
 fi
 
 sleep 1 && echo "[i] Setting update files...                                        [30%]";
 echo `date +%Y%j` >> $refdir/inc/user/uplog.log;
 echo -en "\n" >> $refdir/inc/user/version.log;

 sleep 1 && echo "[i] Creating shirt links...                                        [38%]";
 if [ ! -d "/usr/share/applications" ]; 
 then
   mkdir "/usr/share/applications";  
 fi
 chmod +x "/usr/share/applications";

 cp $refdir/inc/user/desktop/npscan.desktop /usr/share/applications/;
 if [ ! -e "/usr/share/applications/npscan.desktop" ]; 
 then
   echo "Warning! Failed to add direct access to the applications menu!";  
 fi

 sleep 1 && echo "[i] Copying icons...                                               [47%]";
 if [ ! -d "/usr/share/icons" ]; 
 then
   mkdir "/usr/share/icons";  
 fi
 chmod +x "/usr/share/icons";
 
 if [ ! -d "/usr/share/icons/hicolor" ]; 
 then
   mkdir "/usr/share/icons/hicolor";  
 fi
 chmod +x "/usr/share/icons/hicolor";
 
 
 if [ ! -d "/usr/share/icons/hicolor/16x16" ]; 
 then
   mkdir "/usr/share/icons/hicolor/16x16";  
 fi
 chmod +x "/usr/share/icons/hicolor/16x16";
 if [ ! -d "/usr/share/icons/hicolor/16x16/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/16x16/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/16x16/apps";
 cp $refdir/inc/user/desktop/16x16/npscan-menu.png /usr/share/icons/hicolor/16x16/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/22x22" ]; 
 then
   mkdir "/usr/share/icons/hicolor/22x22";  
 fi
 chmod +x "/usr/share/icons/hicolor/22x22";
 if [ ! -d "/usr/share/icons/hicolor/22x22/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/22x22/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/22x22/apps";
 cp $refdir/inc/user/desktop/22x22/npscan-menu.png /usr/share/icons/hicolor/22x22/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/24x24" ]; 
 then
   mkdir "/usr/share/icons/hicolor/24x24";  
 fi
 chmod +x "/usr/share/icons/hicolor/24x24";
 if [ ! -d "/usr/share/icons/hicolor/24x24/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/24x24/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/24x24/apps";
 cp $refdir/inc/user/desktop/24x24/npscan-menu.png /usr/share/icons/hicolor/24x24/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/48x48" ]; 
 then
   mkdir "/usr/share/icons/hicolor/48x48";  
 fi
 chmod +x "/usr/share/icons/hicolor/48x48";
 if [ ! -d "/usr/share/icons/hicolor/48x48/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/48x48/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/48x48/apps";
 cp $refdir/inc/user/desktop/48x48/npscan-menu.png /usr/share/icons/hicolor/48x48/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/256x256/" ]; 
 then
   mkdir "/usr/share/icons/hicolor/256x256/";  
 fi
 chmod +x "/usr/share/icons/hicolor/256x256/";
 if [ ! -d "/usr/share/icons/hicolor/256x256//apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/256x256//apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/256x256//apps";
 cp $refdir/inc/user/desktop/256x256//npscan-menu.png /usr/share/icons/hicolor/256x256//apps/;
 
 ########################################################################################################################

 if [ ! -d "/usr/share/doc/npscan" ]; then
   mkdir "/usr/share/doc/npscan";
 fi
 ########################################################################################################################
 
 sleep 1 && echo "[i] Copying README.md to /usr/share/doc/npscan...                  [75%]";
 chmod +x "/usr/share/doc/npscan/";
 chmod +x $refdir/README.md;
 cp $refdir/README.md /usr/share/doc/npscan/;
 sleep 1 && echo "[i] Copying License.txt to /usr/share/doc/npscan...                [83%]";
 chmod +x $refdir/License.txt;
 cp $refdir/License.txt /usr/share/doc/npscan/;
 sleep 1 && echo "[i] Removing install files...                                      [92%]";
 rm $refdir/inc/user/npscan;
 rm $refdir/install.sh; 
 if [ -d "$refdir/npscan_install" ];
 then
   rm -r $refdir/npscan_install;
 fi
 rm $refdir/README.md;
 rm $refdir/License.txt;
 if [ -d "$refdir/inc/user/desktop" ]; 
 then
   rm -r $refdir/inc/user/desktop;
 fi
 if [ -e "$refdir/npscan" ] || [ -e "$refdir/npscan.pl" ];
 then     
     
 echo "";
 echo "+======================================================================+";
 echo "| 1 INTERACTIVE: You will use npscan by simple interactive options.    |";
 echo "| 2 ADVANCED:    You will use advanced npscan by command line.         |";
 echo "+======================================================================+";
 echo "|   NOTE: This setting can be changed in user configation!             |";
 echo "+======================================================================+";
 echo "";
 echo "[!] How do you like to boot the tool? [Default 2]: ";

 read modeChoice
 if [ "$modeChoice" == "1" ]; 
 then
  sed -i 's/npscan;/npscan --interactive;/g' /usr/share/applications/npscan.desktop;
  echo "interactive on" >> $refdir/inc/user/userSetting;
 fi
 sleep 1 && echo "[i] Tool successfully installed! Starting...                      [100%]";
 sleep 3;
 npscan --update;
else
 echo "[!] Installation failed!! ";
 exit
fi
else
 echo "[!] Tool cannot be installed on your system! Use it as portable!";
fi

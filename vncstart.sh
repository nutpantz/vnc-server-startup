#!/bin/bash
# os tested debian 12 -13
# title             : vnc script
# description       :tigervnc-scraping-server, log in to the actual X session on display :0 and uncompliaced firewall for pia
# date              :2025
# version           :0.1
# notes             :install tigervnc-scraping-server 
#
FW1="   " #setting var variable
FW2="you have not  FW checked status, so check status"
echo "$FW1" #displaying var variable on terminal
echo "$FW2" #displaying var variable on terminal
VNC1="unknown" #setting var variable
VNC2="not verifyed"
echo "$VNC1" #displaying var variable on terminal
echo "$VNC2" #displaying var variable on terminal
SCRIPTNAME="fWVNC"  # What's the script name
VNCSERVER="/usr/bin/x0vncserver"   #Where the x0vncserver executable is located, default:
HOMEDIR=${HOME}  # Set home directory
INTERFACE=$"192.168.0.130"   # Set home ip
VNCDIR="${HOMEDIR}/.vnc"   # Default VNC User directory
LOGFILE="${VNCDIR}/logfile"   # Set log file for debugging
PASSWDFILE="${VNCDIR}/passwd"   # The vnc passwd file. If it doesn't exist, you need to create it
GEOMETRY="1920x1080"   # What's the Geometry  -Geometry 1280x720
DISPLAY=":0"  # Leave this on ":0", since we want to log in to the actual session
VNCPORT="5900"    #Set the port (default 5900)
# PID of the actual VNC server running
# The PID is actually created this way, so it is compatible with the vncserver command
# if you want to kill the VNC server manually, just type 
# x0vncserver -kill :0
PIDFILE="${VNCDIR}/${HOSTNAME}${DISPLAY}.pid"
#-SecurityTypes VncAuth,TLSVnc
# Add some color to the script
OK="[\033[1;32mok\033[0m]"
FAILED="[\033[1;31mfailed\033[0m]"
RUNNING="[\033[1;32mrunning\033[0m]"
NOTRUNNING="[\033[1;31mnot running\033[0m]"

# Function to get the process id of the VNC Server
fn_pid() {
    CHECKPID=$(ps -fu ${USER} | grep "[x]0vncserver" | awk '{print $2}')
    if [[ ${CHECKPID} =~ ^[0-9]+$ ]] 
    then
        VAR=${CHECKPID}
        return 0
    else
        return 1
    fi
}

# vncmenu
vncmenu () {
echo "vnc" "$VNC1" #displaying var variable on terminal
echo "vnc" "$VNC2" #displaying var variable on terminal

if [ ! -d ${VNCDIR} ]
then
    echo -e "Directory ${VNCDIR} doesn't exist. Create it first." ${FAILED}
    echo
    exit 1
fi

if [ ! -f ${PASSWDFILE} ]
then
    echo -e "${PASSWDFILE} doesn't exist. Create VNC password first. ${FAILED}"
    echo "Type \"vncpasswd\" to create passwd file."
    echo
    exit 1
fi
              echo "startvnc"
                            echo -n "Starting VNC Server on display ${DISPLAY} "
              echo "${VNCSERVER} -SecurityTypes VncAuth,TLSVnc -Geometry ${GEOMETRY} -localhost=0 -interface ${INTERFACE} -display ${DISPLAY} -passwordfile ${PASSWDFILE} -rfbport ${VNCPORT}"
              sleep 3
      
            ${VNCSERVER} -SecurityTypes VncAuth,TLSVnc -Geometry ${GEOMETRY} -localhost=0 -interface ${INTERFACE} -display ${DISPLAY} -passwordfile ${PASSWDFILE} -rfbport ${VNCPORT} >> ${LOGFILE} 2>&1 &
	   echo "if you want to kill the VNC server manually, just type x0vncserver -kill :0 "
	   
	   exit 1
	   

#!/bin/bash

#   Copyright 2012 Lucas Andres Farre
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


# Universal Nexus Linux Toolkit v2.0
# by lucasfarre (tatelucas)
# Apache License 2.0
# Source: http://code.google.com/p/galaxy-nexus-linux-toolkit/
# XDA Official Thread: http://forum.xda-developers.com/showthread.php?t=1810089


# /*** Environment Variables ***/

PATH="$PATH:$PWD/platform-tools"


# /*** Constants ***/

VERSION="200"
TRUE=1
FALSE=0
INVALID_DEVICE=0
INVALID_MODE=0
INVALID_KEY=-1
EXIT_KEY=0
RETURN_KEY="R"
YES_KEY="Y"
NO_KEY="N"

PLATFORM_TOOLS_DIR="$PWD/platform-tools"
PLATFORM_TOOLS_TGZ="$PLATFORM_TOOLS_DIR/platformtools$VERSION.tar.gz"

PLATFORM_TOOLS_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/platformtools$VERSION.tar.gz"
PLATFORM_TOOLS_MD5="6f9a2fa61adf8fdf097ca7d8e698c5b0"

# Devices

MAKO_NAME="Nexus 4 [mako]"
MAKO_ID=1

GROUPER_NAME="Nexus 7 (WiFi) [grouper]"
GROUPER_ID=3

NEXUS7GSM_NAME="Nexus 7 GSM"
NEXUS7GSM_ID=11

MANTA_NAME="Nexus 10 [manta]"
MANTA_ID=2

MAGURO_NAME="Galaxy Nexus (GSM) [maguro]"
MAGURO_ID=4
TORO_NAME="Galaxy Nexus (Verizon) [toro]"
TORO_ID=5
TOROPLUS_NAME="Galaxy Nexus (Sprint) [toroplus]"
TOROPLUS_ID=6


CRESPO_NAME="Nexus S (worldwide version, i9020t and i9023) [crespo]"
CRESPO_ID=7
CRESPOA_NAME="Nexus S (850MHz version, i9020a) [crespo]"
CRESPOA_ID=8
CRESPOK_NAME="Nexus S (Korea version, m200) [crespo]"
CRESPOK_ID=9
CRESPO4G_NAME="Nexus S 4G (d720) [crespo4g]"
CRESPO4G_ID=10

# Dir Names

DEVICES_DIR="$PWD/devices"

MAKO_DIR="$PWD/devices/mako"

MANTA_DIR="$PWD/devices/manta"

CRESPO_DIR="$PWD/devices/crespo"
CRESPOA_DIR="$PWD/devices/crespoa"
CRESPOK_DIR="$PWD/devices/crespok"
CRESPO4G_DIR="$PWD/devices/crespo4g"

MAGURO_DIR="$PWD/devices/maguro"
TORO_DIR="$PWD/devices/toro"
TOROPLUS_DIR="$PWD/devices/toroplus"

GROUPER_DIR="$PWD/devices/grouper"

# .tgz Names

MAKO_DATA_TGZ="$MAKO_DIR/mako$VERSION.tar.gz"

MANTA_DATA_TGZ="$MANTA_DIR/manta$VERSION.tar.gz"

GROUPER_DATA_TGZ="$GROUPER_DIR/grouper$VERSION.tgz"

MAGURO_DATA_TGZ="$MAGURO_DIR/maguro$VERSION.tgz"
TORO_DATA_TGZ="$TORO_DIR/toro$VERSION.tgz"
TOROPLUS_DATA_TGZ="$TOROPLUS_DIR/toroplus$VERSION.tgz"

CRESPO_DATA_TGZ="$CRESPO_DIR/crespo$VERSION.tgz"
CRESPOA_DATA_TGZ="$CRESPOA_DIR/crespo$VERSION.tgz"
CRESPOK_DATA_TGZ="$CRESPOK_DIR/crespo$VERSION.tgz"
CRESPO4G_DATA_TGZ="$CRESPO4G_DIR/crespo4g$VERSION.tgz"

# .tgz URL & MD5

MAKO_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/mako$VERSION.tar.gz"
MAKO_DATA_MD5="8c1db92515aab3b5ef05c7ecb0400034"

MANTA_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/manta$VERSION.tar.gz"
MANTA_DATA_MD5="735b93491764e5675c44610cb80349e9"

GROUPER_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/grouper$VERSION.tgz"
GROUPER_DATA_MD5="bef40bfc56e276f29674f94cce040a3f"

MAGURO_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/maguro$VERSION.tgz"
MAGURO_DATA_MD5="89d465242dfa3a67c93e866a42162fb5"
TORO_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/toro$VERSION.tgz"
TORO_DATA_MD5="b02d5b85158421b241f1e1d7ceb63b2c"
TOROPLUS_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/toroplus$VERSION.tgz"
TOROPLUS_DATA_MD5="97cca85616be92b2c47c883be2338fa2"

CRESPO_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespo$VERSION.tgz"
CRESPO_DATA_MD5="21bdc17bd978c81cecb5cd61a20e2109"
CRESPOA_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespo$VERSION.tgz"
CRESPOA_DATA_MD5="21bdc17bd978c81cecb5cd61a20e2109"
CRESPOK_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespo$VERSION.tgz"
CRESPOK_DATA_MD5="21bdc17bd978c81cecb5cd61a20e2109"
CRESPO4G_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespo4g$VERSION.tgz"
CRESPO4G_DATA_MD5="3bfc331983d84d65ac2ecd5ba9224b1a"

# Factory URL & MD5

FACTORY_MAKO="https://dl.google.com/dl/android/aosp/occam-jop40c-factory-cd3dc140.tgz"
MD5_MAKO="d8cef2e9aebb142d764ee70098eae237"

FACTORY_MANTA="https://dl.google.com/dl/android/aosp/mantaray-jop40c-factory-87340b80.tgz"
MD5_MANTA="dca07ce8e96b77896cfb6f1818378c1c"

FACTORY_GROUPER="https://dl.google.com/dl/android/aosp/nakasi-jop40c-factory-6aabb391.tgz"
MD5_GROUPER="3689d95c00c45ae4ed53011083420730"
FACTORY_NEXUS7GSM="https://dl.google.com/dl/android/aosp/nakasig-jop40c-factory-a0431f67.tgz"
MD5_NEXUS7GSM="e681477b3babbafb6fc6891438a254e9"

FACTORY_MAGURO="https://dl.google.com/dl/android/aosp/takju-jop40c-factory-1a47c890.tgz"
MD5_MAGURO="1e62833203f9fd3aa63de9b59af784ca"
FACTORY_TORO="https://dl.google.com/dl/android/aosp/mysid-jro03o-factory-f17426e6.tgz"
MD5_TORO="1df6a2a7385c4745193fe82bf2a87f78"
FACTORY_TOROPLUS="https://dl.google.com/dl/android/aosp/mysidspr-fh05-factory-8cb5208b.tgz"
MD5_TOROPLUS="7b3c4c37dd64a664427d3829e2491bee"

FACTORY_CRESPO="https://dl.google.com/dl/android/aosp/soju-jzo54k-factory-36602333.tgz"
MD5_CRESPO="788233dca5954532acda63039f814b4d"
FACTORY_CRESPOA="https://dl.google.com/dl/android/aosp/sojua-jzo54k-factory-1121b619.tgz"
MD5_CRESPOA="9cceb30ac64c914c06df5d16f5af2a52"
FACTORY_CRESPOK="https://dl.google.com/dl/android/aosp/sojuk-jro03e-factory-93a21b70.tgz"
MD5_CRESPOK="3f31acd14b3b464881886d2e8d2d94f4"
FACTORY_CRESPO4G="https://dl.google.com/dl/android/aosp/sojus-jro03r-factory-59a247f5.tgz"
MD5_CRESPO4G="45e55ec74e6b6e69545f3d39e9f8cb64"

# Key Combinations

KEY_COMBINATIONS_NEXUS_S="Press and hold Volume Up, then press and hold Power."
KEY_COMBINATIONS_GALAXY_NEXUS="Press and hold both Volume Up and Volume Down, then press and hold Power."
KEY_COMBINATIONS_NEXUS_7="Press Power for a second, and press Volume Down when bootloader logo appears."
KEY_COMBINATIONS_NEXUS_10="Press and hold both Volume Up and Volume Down, then press and hold Power."
KEY_COMBINATIONS_NEXUS_4="Press and hold Volume Down, then press and hold Power."

# Others

AUTO_MODE_ID="A"
MANUAL_MODE_ID="M"

AUTO_MODE_NAME="Automatic [ADB]"
MANUAL_MODE_NAME="Manual [FASTBOOT]"

STANDARD_CWM_ID="S"
TOUCH_CWM_ID="T"


# /*** Functions ***/ 

printHeader () {
  clear
  echo "********************************************************************************"
  echo "*               Universal Nexus Linux Toolkit v2.0 by tatelucas                *"
  echo "********************************************************************************"
}

# Device chooser and set variables for selected device

deviceChooser () {
DEVICE=$INVALID_DEVICE
while [ $DEVICE == $INVALID_DEVICE ]
do
  printHeader
  printDeviceChooser
  setDeviceVariables
done
}

printDeviceChooser () {
  echo "Nexus Devices"
  echo ""
  echo "$MAKO_ID. $MAKO_NAME"
# echo "$NEXUS7GSM_ID. $NEXUS7GSM_NAME"
  echo "$MANTA_ID. $MANTA_NAME"
  echo "$GROUPER_ID. $GROUPER_NAME"
  echo "$MAGURO_ID. $MAGURO_NAME"
  echo "$TORO_ID. $TORO_NAME"
  echo "$TOROPLUS_ID. $TOROPLUS_NAME"
  echo "$CRESPO_ID. $CRESPO_NAME"
  echo "$CRESPOA_ID. $CRESPOA_NAME"
  echo "$CRESPOK_ID. $CRESPOK_NAME"
  echo "$CRESPO4G_ID. $CRESPO4G_NAME"
  
  echo ""
  echo "$EXIT_KEY. Exit"
  echo ""
  echo -n "Please choose a valid option: "
  read DEVICE
  echo ""
}

setDeviceVariables () {
  case $DEVICE in
    $CRESPO_ID) DEVICE_NAME=$CRESPO_NAME
                DEVICE_DIR=$CRESPO_DIR
                DEVICE_DATA_URL=$CRESPO_DATA_URL
                DEVICE_DATA_MD5=$CRESPO_DATA_MD5
                DEVICE_DATA_TGZ=$CRESPO_DATA_TGZ
                FACTORY_URL=$FACTORY_CRESPO
                MD5=$MD5_CRESPO
                KEY_COMBINATIONS=$KEY_COMBINATIONS_NEXUS_S;;
                
    $CRESPOA_ID) DEVICE_NAME=$CRESPOA_NAME
                 DEVICE_DIR=$CRESPOA_DIR
                 DEVICE_DATA_URL=$CRESPOA_DATA_URL
                 DEVICE_DATA_MD5=$CRESPOA_DATA_MD5
                 DEVICE_DATA_TGZ=$CRESPOA_DATA_TGZ
                 FACTORY_URL=$FACTORY_CRESPOA
                 MD5=$MD5_CRESPOA
                 KEY_COMBINATIONS=$KEY_COMBINATIONS_NEXUS_S;;
    
    $CRESPOK_ID) DEVICE_NAME=$CRESPOK_NAME
                 DEVICE_DIR=$CRESPOK_DIR
                 DEVICE_DATA_URL=$CRESPOK_DATA_URL
                 DEVICE_DATA_MD5=$CRESPOK_DATA_MD5
                 DEVICE_DATA_TGZ=$CRESPOK_DATA_TGZ
                 FACTORY_URL=$FACTORY_CRESPOK
                 MD5=$MD5_CRESPOK
                 KEY_COMBINATIONS=$KEY_COMBINATIONS_NEXUS_S;;
    
    $CRESPO4G_ID) DEVICE_NAME=$CRESPO4G_NAME
                  DEVICE_DIR=$CRESPO4G_DIR
                  DEVICE_DATA_URL=$CRESPO4G_DATA_URL
                  DEVICE_DATA_MD5=$CRESPO4G_DATA_MD5
                  DEVICE_DATA_TGZ=$CRESPO4G_DATA_TGZ
                  FACTORY_URL=$FACTORY_CRESPO4G
                  MD5=$MD5_CRESPO4G
                  KEY_COMBINATIONS=$KEY_COMBINATIONS_NEXUS_S;;        
                
    $MAGURO_ID) DEVICE_NAME=$MAGURO_NAME
                DEVICE_DIR=$MAGURO_DIR
                DEVICE_DATA_URL=$MAGURO_DATA_URL
                DEVICE_DATA_MD5=$MAGURO_DATA_MD5
                DEVICE_DATA_TGZ=$MAGURO_DATA_TGZ
                FACTORY_URL=$FACTORY_MAGURO
                MD5=$MD5_MAGURO
                KEY_COMBINATIONS=$KEY_COMBINATIONS_GALAXY_NEXUS;;
                
    $TORO_ID) DEVICE_NAME=$TORO_NAME
              DEVICE_DIR=$TORO_DIR
              DEVICE_DATA_URL=$TORO_DATA_URL
              DEVICE_DATA_MD5=$TORO_DATA_MD5
              DEVICE_DATA_TGZ=$TORO_DATA_TGZ
              FACTORY_URL=$FACTORY_TORO
              MD5=$MD5_TORO
              KEY_COMBINATIONS=$KEY_COMBINATIONS_GALAXY_NEXUS;;
              
    $TOROPLUS_ID) DEVICE_NAME=$TOROPLUS_NAME
                  DEVICE_DIR=$TOROPLUS_DIR
                  DEVICE_DATA_URL=$TOROPLUS_DATA_URL
                  DEVICE_DATA_MD5=$TOROPLUS_DATA_MD5
                  DEVICE_DATA_TGZ=$TOROPLUS_DATA_TGZ
                  FACTORY_URL=$FACTORY_TOROPLUS
                  MD5=$MD5_TOROPLUS
                  KEY_COMBINATIONS=$KEY_COMBINATIONS_GALAXY_NEXUS;;
                  
    $GROUPER_ID)  DEVICE_NAME=$GROUPER_NAME
                  DEVICE_DIR=$GROUPER_DIR
                  DEVICE_DATA_URL=$GROUPER_DATA_URL
                  DEVICE_DATA_MD5=$GROUPER_DATA_MD5
                  DEVICE_DATA_TGZ=$GROUPER_DATA_TGZ
                  FACTORY_URL=$FACTORY_GROUPER
                  MD5=$MD5_GROUPER
                  KEY_COMBINATIONS=$KEY_COMBINATIONS_NEXUS_7;;   
                  
    $MAKO_ID) DEVICE_NAME=$MAKO_NAME
                DEVICE_DIR=$MAKO_DIR
                DEVICE_DATA_URL=$MAKO_DATA_URL
                DEVICE_DATA_MD5=$MAKO_DATA_MD5
                DEVICE_DATA_TGZ=$MAKO_DATA_TGZ
                FACTORY_URL=$FACTORY_MAKO
                MD5=$MD5_MAKO
                KEY_COMBINATIONS=$KEY_COMBINATIONS_NEXUS_4;;
                
    $MANTA_ID) DEVICE_NAME=$MANTA_NAME
                 DEVICE_DIR=$MANTA_DIR
                 DEVICE_DATA_URL=$MANTA_DATA_URL
                 DEVICE_DATA_MD5=$MANTA_DATA_MD5
                 DEVICE_DATA_TGZ=$MANTA_DATA_TGZ
                 FACTORY_URL=$FACTORY_MANTA
                 MD5=$MD5_MANTA
                 KEY_COMBINATIONS=$KEY_COMBINATIONS_NEXUS_10;;
   
    $EXIT_KEY)  clear && exit;;
   
    *) DEVICE=$INVALID_DEVICE;;
  esac
}

# Android SDK platform tools download
platformTools () {
ERROR=$TRUE
while [ $ERROR -eq $TRUE ]
do
  downloadPlatformTools
  ERROR=$FALSE
  checkPlatformTools
  if [ $ERROR -eq $FALSE ];
  then
    extractPlatformTools
  fi
done
}

downloadPlatformTools () {
  if [ ! -d $PLATFORM_TOOLS_DIR ];
  then
    echo "Downloading Platform Tools..."
    mkdir $PLATFORM_TOOLS_DIR
    cd $PLATFORM_TOOLS_DIR
    wget $PLATFORM_TOOLS_URL
  fi
}

checkPlatformTools () {
  cd $PLATFORM_TOOLS_DIR
  if [ -e $PLATFORM_TOOLS_TGZ ] && [ $PLATFORM_TOOLS_MD5 != "`md5sum $PLATFORM_TOOLS_TGZ | head -c 32`" ];
  then
    ERROR=$TRUE
    echo "ERROR: Platform Tools are corrupted. Erasing..."
    cd ..
    rm -r $PLATFORM_TOOLS_DIR
    echo "Erased. Please try again later."
  fi
}

extractPlatformTools () {
  cd $PLATFORM_TOOLS_DIR
  if [ -e $PLATFORM_TOOLS_TGZ ];
  then
    tar -xzf $PLATFORM_TOOLS_TGZ
    rm $PLATFORM_TOOLS_TGZ
  fi
}

# Device data download for selected device
deviceData () {
ERROR=$TRUE
while [ $ERROR -eq $TRUE ]
do
  downloadDeviceData
  ERROR=$FALSE
  checkDeviceData
  if [ $ERROR -eq $FALSE ];
  then
    extractDeviceData
  fi
done
}

downloadDeviceData () {
  if [ ! -d $DEVICES_DIR ];
  then
    mkdir $DEVICES_DIR
  fi
  if [ ! -d $DEVICE_DIR ];
  then
    echo "Downloading Device Data..."
    mkdir $DEVICE_DIR
    cd $DEVICE_DIR
    wget $DEVICE_DATA_URL
  fi
}

checkDeviceData () {
  cd $DEVICE_DIR
  if [ -e $DEVICE_DATA_TGZ ] && [ $DEVICE_DATA_MD5 != "`md5sum $DEVICE_DATA_TGZ | head -c 32`" ];
  then
    ERROR=$TRUE
    echo "ERROR: Device Data is Corrupted. Erasing..."
    rm -r $DEVICE_DIR
    echo "Erased. Please try again later."
  fi
}

extractDeviceData () {
  cd $DEVICE_DIR
  if [ -e $DEVICE_DATA_TGZ ];
  then
    tar -xzf $DEVICE_DATA_TGZ
    rm $DEVICE_DATA_TGZ
  fi
}

# Choose mode and set variables for selected mode
modeChooser () {
MODE=$INVALID_MODE
while [ $MODE == $INVALID_MODE ]
do
  printHeader
  printModeChooser
  setModeVariables
done
}

printModeChooser () {
  echo "Modes"
  echo ""
  echo "$AUTO_MODE_ID. Automatic [Requires USB debugging enabled. Recommended for most devices]"
  echo "$MANUAL_MODE_ID. Manual [Requires keys combinations. Recommended for Non-Booting devices]"
  echo ""
  echo "$EXIT_KEY. Exit"
  echo ""
  echo -n "Please choose a mode: "
  read MODE
  echo ""  
}

setModeVariables () {
  case $MODE in
    $AUTO_MODE_ID) SELECTED_MODE=$AUTO_MODE_NAME;;
    $MANUAL_MODE_ID) SELECTED_MODE=$MANUAL_MODE_NAME;;
    $EXIT_KEY) clear && exit;;
    *) MODE=$INVALID_MODE;;
  esac
}

# Main Menu User Interface

printDevice () {
  echo "Selected Device: $DEVICE_NAME"
}

printMode () {
  echo "Selected Mode: $SELECTED_MODE"
  echo ""
}

printMenu () {
  echo "1. Unlock the Bootloader"
  echo "2. Flash ClockworkMod Recovery"
  echo "3. Root the Device"
  echo "4. Lock the Bootloader"
  if [ $DEVICE != $TOROPLUS_ID ];
  then
    echo "5. Flash Google Factory Image"
  fi
  echo "0. Exit"
  echo ""
  echo -n "Please choose a valid option: "
}

returnMenu () {
  echo ""
  echo "Press ENTER to return to the main menu..."
  echo ""
  read KEY
}

# Unlock Bootloader

bootloader () {
  printBootloaderHeader
  printModeManual
  while [ $KEY != $NO_KEY ] && [ $KEY != $YES_KEY ] 
  do
  printHeader
  printBootloaderHeader
  printModeManual
  done
  if [ $KEY == $YES_KEY ];
  then
    runBootloaderCommands
    let UNLOCK_COUNTER+=1
    returnMenu
  fi
}

printBootloaderHeader () {
  echo "Unlock the Bootloader"
  echo ""
}

printModeManual () {
  if [ $MODE == $MANUAL_MODE_ID ];
  then
    printBootloaderManual
  else
    printAndroidDebuggingManual
  fi   
}

printBootloaderManual () {
  echo "Before starting the process your device must be in Bootloader Mode."
  echo "In the following instructions you will learn how to do it:"
  echo ""
  echo "1. Power off the device."
  echo "2. $KEY_COMBINATIONS"
  echo "3. Your device screen should show an image of an opened android."
  echo "   You're now in the Bootloader Mode! If you don't see the image,"
  echo "   you must follow the instructions again."
  echo "4. Please connect the device to your PC via USB."
  echo -n "5. Do you want to start the process? [$YES_KEY/$NO_KEY]: "
  read KEY
  echo ""
}

printAndroidDebuggingManual () {
  echo "Before starting the process your device must be in Android Debugging Mode."
  echo "In the following instructions you will learn how to do it:"
  echo ""
  echo "1. Power on your device and connect the device to your PC via USB."
  echo "2. Go to 'Settings' >> 'Developer options', turn ON the switch,"
  echo "   and check 'USB debugging'. You're now in Android Debugging Mode!"
  echo -n "3. Do you want to start the process? [$YES_KEY/$NO_KEY]: "
  read KEY
  echo ""
}

runBootloaderCommands () {
  if [ $MODE == $AUTO_MODE_ID ];
  then
  rebootBootloader
  fi
  fastboot oem unlock
  if [ $MODE == $AUTO_MODE_ID ];
  then
    rebootAndroid
  fi
}

rebootBootloader () {
  adb reboot bootloader
# sleep 5  There's no need to add wait time because Fastboot always wait for device.
}

rebootAndroid () {
  fastboot reboot
}

# Flash CWM Recovery

recovery () {
  printRecoveryHeader
  printRecoveryMenu
  while [ $KEY != $STANDARD_CWM_ID ] && [ $KEY != $TOUCH_CWM_ID ] && [ $KEY != $RETURN_KEY ] 
  do
    printHeader
    printRecoveryHeader
    printRecoveryMenu
  done
  if [ $KEY != $RETURN_KEY ];
  then
    if [ $KEY == $STANDARD_CWM_ID ];
      then
        RECOVERY_VERSION="standard"
      else
        RECOVERY_VERSION="touch"
    fi
    printHeader
    printRecoveryHeader
    printModeManual
    if [ $KEY == $YES_KEY ];
    then
      runRecoveryCommands
      let RECOVERY_COUNTER+=1
      returnMenu
    fi
  fi
}

printRecoveryHeader () {
  echo "Flash ClockworkMod Recovery"
  echo ""
}

printRecoveryMenu () {
  echo "$STANDARD_CWM_ID. Standard CWM Recovery"
  echo "$TOUCH_CWM_ID. Touch CWM Recovery"
  echo ""
  echo "$RETURN_KEY. Return to the main menu"
  echo ""
  echo -n "Please choose a valid option: "
  read KEY
}

runRecoveryCommands () {
  if [ $MODE == $AUTO_MODE_ID ];
  then
  rebootBootloader
  fi
  fastboot flash recovery $DEVICE_DIR/recovery/$RECOVERY_VERSION/recovery.img
  if [ $MODE == $AUTO_MODE_ID ];
  then
    rebootAndroid
  fi
}

# Root the device

root () {
  printHeader
  printRootHeader
  printAndroidDebuggingManual
  while [ $KEY != $NO_KEY ] && [ $KEY != $YES_KEY ] 
  do
  printHeader
  printRootHeader
  printAndroidDebuggingManual
  done
  if [ $KEY == $YES_KEY ];
  then
    printRootManual
    runRootCommands
    let ROOT_COUNTER+=1
    returnMenu
  fi
}

printRootHeader () {
  echo "Root the device"
  echo ""
}

printRootManual () {
  echo "4. Wait for automatically reboot in Recovery Mode."
  echo "5. Go to 'install zip from sdcard' >> 'choose zip from sdcard' >> 'UNLT'"
  echo "   and choose 'su.zip'."
  echo "6. Go to 'Go back' >> 'reboot system now'."
}

runRootCommands () {
  adb shell mkdir /sdcard/UNLT
  adb push $DEVICE_DIR/root/su.zip /sdcard/UNLT
  adb reboot recovery
}

#  Flash Google Factory Image

factory () {
  printHeader
  printFactoryHeader
  printModeManual
  while [ $KEY != $NO_KEY ] && [ $KEY != $YES_KEY ] 
  do
  printHeader
  printFactoryHeader
  printModeManual
  done
  if [ $KEY == $YES_KEY ];
  then
    downloadFactoryImage
    ERROR=$FALSE
    checkFactoryImage
    if [ $ERROR -eq $FALSE ];
      then
        extractFactoryImage
        runFactoryCommands
    fi
    let FACTORY_COUNTER+=1
    returnMenu
  fi
}

printFactoryHeader () {
  echo "Flash Google Factory Image"
  echo ""
}

downloadFactoryImage () {
  cd $DEVICE_DIR/factory
  if [ ! -e factory.tgz ];
  then
    echo "Downloading Factory Image..."
    wget -O factory.tgz $FACTORY_URL
  fi
}

checkFactoryImage () {
  if [ $MD5 != "`md5sum factory.tgz | head -c 32`" ];
  then
    ERROR=$TRUE
    echo "ERROR: Google Factory Image is Corrupted. Erasing..."
    rm factory.tgz
    echo "Erased. Please try again later."
  fi
}

extractFactoryImage () {
  cd $DEVICE_DIR/factory
  if [ -d extract_here ];
  then
  rm -r extract_here
  fi
  tar -xzf factory.tgz
  mv `ls -d */` extract_here
}

runFactoryCommands () {
  if [ $MODE == $AUTO_MODE_ID ];
  then
  rebootBootloader
  fi
  cd $DEVICE_DIR/factory/extract_here
  bash flash-all.sh
}

# Lock the Bootloader

lockBootloader () {
  printLockHeader
  printModeManual
  while [ $KEY != $NO_KEY ] && [ $KEY != $YES_KEY ] 
  do
  printHeader
  printLockHeader
  printModeManual
  done
  if [ $KEY == $YES_KEY ];
  then
    runLockCommands
    let LOCK_COUNTER+=1
    returnMenu
  fi
}

printLockHeader () {
  echo "Lock the Bootloader"
  echo ""
}

runLockCommands () {
  if [ $MODE == $AUTO_MODE_ID ];
  then
  rebootBootloader
  fi
  fastboot oem lock
  if [ $MODE == $AUTO_MODE_ID ];
  then
    rebootAndroid
  fi
}

# Exit Toolkit

exitToolkit () {
  EXIT=$TRUE
  clear
}

# /*** Main ***/

ERROR=$FALSE
deviceChooser
platformTools
deviceData
modeChooser
EXIT=$FALSE
while [ $EXIT -eq $FALSE ]
do
  printHeader
  printDevice
  printMode
  printMenu
  read OPTION
  printHeader
  case $OPTION in
    1) bootloader;;
    2) recovery;;
    3) root;;
    4) lockBootloader;;
    5) if [ $DEVICE == $TOROPLUS_ID ];
       then
         returnMenu
       else
         factory
       fi;;
    0) exitToolkit;;
    *) ;;
  esac
done
exit

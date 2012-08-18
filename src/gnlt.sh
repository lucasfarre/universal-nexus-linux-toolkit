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


# Universal Nexus Linux Toolkit v1.99
# by lucasfarre (tatelucas)
# Apache License 2.0
# Source: http://code.google.com/p/galaxy-nexus-linux-toolkit/
# XDA Official Thread: http://forum.xda-developers.com/showthread.php?t=1810089


# /*** Environment Variables ***/

PATH="$PATH:$PWD/platform-tools"


# /*** Constants ***/

TRUE=1
FALSE=0
INVALID_DEVICE=0
INVALID_MODE=0
EXIT_KEY=0

PLATFORM_TOOLS_DIR="$PWD/platform-tools"
PLATFORM_TOOLS_TGZ="$PLATFORM_TOOLS_DIR/platformtools.tgz"

PLATFORM_TOOLS_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/platformtools.tgz"
PLATFORM_TOOLS_MD5="0cb8d5852087b6bfbd85e0f5fced9332"

CRESPO_NAME="Nexus S (worldwide version, i9020t and i9023) [crespo]"
CRESPO_ID=1
CRESPOA_NAME="Nexus S (850MHz version, i9020a) [crespo]"
CRESPOA_ID=2
CRESPOK_NAME="Nexus S (Korea version, m200) [crespo]"
CRESPOK_ID=3
CRESPO4G_NAME="Nexus S 4G (d720) [crespo4g]"
CRESPO4G_ID=4

MAGURO_NAME="Galaxy Nexus (GSM) [maguro]"
MAGURO_ID=5
TORO_NAME="Galaxy Nexus (Verizon) [toro]"
TORO_ID=6
TOROPLUS_NAME="Galaxy Nexus (Sprint) [toroplus]"
TOROPLUS_ID=7

GROUPER_NAME="Nexus 7 [grouper]"
GROUPER_ID=8

DEVICES_DIR="$PWD/devices"

CRESPO_DIR="$PWD/devices/crespo"
CRESPOA_DIR="$PWD/devices/crespoa"
CRESPOK_DIR="$PWD/devices/crespok"
CRESPO4G_DIR="$PWD/devices/crespo4g"

MAGURO_DIR="$PWD/devices/maguro"
TORO_DIR="$PWD/devices/toro"
TOROPLUS_DIR="$PWD/devices/toroplus"

GROUPER_DIR="$PWD/devices/grouper"

CRESPO_DATA_TGZ="$CRESPO_DIR/crespo.tgz"
CRESPOA_DATA_TGZ="$CRESPOA_DIR/crespoa.tgz"
CRESPOK_DATA_TGZ="$CRESPOK_DIR/crespok.tgz"
CRESPO4G_DATA_TGZ="$CRESPO4G_DIR/crespo4g.tgz"

MAGURO_DATA_TGZ="$MAGURO_DIR/maguro.tgz"
TORO_DATA_TGZ="$TORO_DIR/toro.tgz"
TOROPLUS_DATA_TGZ="$TOROPLUS_DIR/toroplus.tgz"

GROUPER_DATA_TGZ="$GROUPER_DIR/grouper.tgz"

CRESPO_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespo.tgz"
CRESPO_DATA_MD5="9ab761fff4564174c14febd5dd5e3554"
CRESPOA_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespoa.tgz"
CRESPOA_DATA_MD5="3b16fce1b360d28d6e3fcd1f947eb55d"
CRESPOK_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespok.tgz"
CRESPOK_DATA_MD5="90952165178a741dbe223df0fbda1b76"
CRESPO4G_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/crespo4g.tgz"
CRESPO4G_DATA_MD5="2f6a25c46323fc5ca916677caef013c3"

MAGURO_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/maguro.tgz"
MAGURO_DATA_MD5="988614b2bcf694e47ceb3226c5f6a776"
TORO_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/toro.tgz"
TORO_DATA_MD5="d660d0a2661735ffdfc02fea3896b594"
TOROPLUS_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/toroplus.tgz"
TOROPLUS_DATA_MD5="3a567ca7678f7b8b7842cb424998522d"

GROUPER_DATA_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/files/grouper.tgz"
GROUPER_DATA_MD5="bef40bfc56e276f29674f94cce040a3f"

FACTORY_CRESPO="https://dl.google.com/dl/android/aosp/soju-jro03e-factory-c9f5a67d.tgz"
MD5_CRESPO="c894e0abfef4f0e68c4646cb4e694047"
FACTORY_CRESPOA="https://dl.google.com/dl/android/aosp/sojua-jro03e-factory-1ac76773.tgz"
MD5_CRESPOA="39f0a4079f81882d354f228000ccf8f4"
FACTORY_CRESPOK="https://dl.google.com/dl/android/aosp/sojuk-imm76d-factory-422adc36.tgz"
MD5_CRESPOK="393b47d3389232ce4388d019b3ce344b"
FACTORY_CRESPO4G="https://dl.google.com/dl/android/aosp/sojus-imm76d-factory-10660f4c.tgz"
MD5_CRESPO4G="198f44f6ea07c2f28e8bdc0932d2fd7d"

FACTORY_MAGURO="https://dl.google.com/dl/android/aosp/yakju-jro03c-factory-3174c1e5.tgz"
MD5_MAGURO="61cad184127144888445987249f06fca"
FACTORY_TORO="https://dl.google.com/dl/android/aosp/mysid-imm76k-factory-98d21321.tgz"
MD5_TORO="e76c6fe7d2bc799e5a6168f9dcb8c4ca"
FACTORY_TOROPLUS=""
MD5_TOROPLUS=""

FACTORY_GROUPER="https://dl.google.com/dl/android/aosp/nakasi-jro03d-factory-e102ba72.tgz"
MD5_GROUPER="7f79d40f03bab0f9b2871eaae74ac61e"

KEY_COMBINATIONS_NEXUS_S="Press and hold Volume Up, then press and hold Power."
KEY_COMBINATIONS_GALAXY_NEXUS="Press and hold both Volume Up and Volume Down, then press and hold Power."
KEY_COMBINATIONS_NEXUS_7="Press Power for a second, and press Volume Down when bootloader logo appears."

AUTO_MODE_ID="A"
MANUAL_MODE_ID="M"

AUTO_MODE_NAME="Automatic [ADB]"
MANUAL_MODE_NAME="Manual [FASTBOOT]"

STANDARD_CWM_ID="S"
TOUCH_CWM_ID="T"

HOST="server14.000webhost.com"
USER="a2897111"
PASSWORD="gnlt92"

LOG_NAME="`date +%F`-`date +%X``date +%:z`.log"
LOGS_DIR="$PWD/.logs"

UNLOCK_COUNTER=0
RECOVERY_COUNTER=0
ROOT_COUNTER=0
LOCK_COUNTER=0
FACTORY_COUNTER=0


# Log File Initialization

logFileInitialization () {
  if [ ! -d $LOGS_DIR ];
  then
    mkdir $LOGS_DIR
  fi
  cd $LOGS_DIR
  #exec 2>> $LOG_NAME
  date -R >> $LOG_NAME
  uname -a >> $LOG_NAME
  echo "" >> $LOG_NAME
  echo "Errors" >> $LOG_NAME
  echo "" >> $LOG_NAME
}


# /*** Functions ***/ 

printHeader () {
  clear
  echo "********************************************************************************"
  echo "*                Universal Nexus Linux Toolkit v1.9 by tatelucas               *"
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
  echo "$CRESPO_ID. $CRESPO_NAME"
  echo "$CRESPOA_ID. $CRESPOA_NAME"
  echo "$CRESPOK_ID. $CRESPOK_NAME"
  echo "$CRESPO4G_ID. $CRESPO4G_NAME"
  echo "$MAGURO_ID. $MAGURO_NAME"
  echo "$TORO_ID. $TORO_NAME"
  echo "$TOROPLUS_ID. $TOROPLUS_NAME"
  echo "$GROUPER_ID. $GROUPER_NAME"
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
  runBootloaderCommands
  let UNLOCK_COUNTER+=1
  returnMenu
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
  echo -n "5. To continue, please press ENTER: "
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
  echo -n "3. To continue, please press ENTER: "
  read KEY
  echo ""
}

runBootloaderCommands () {
  if [ $MODE == $AUTO_MODE_ID ];
  then
  rebootBootloader
  fi
  fastboot oem unlock
}

rebootBootloader () {
  adb reboot bootloader
  sleep 5
}

# Flash CWM Recovery

recovery () {
  printRecoveryHeader
  printRecoveryMenu
  while [ $KEY != $STANDARD_CWM_ID ] && [ $KEY != $TOUCH_CWM_ID ]
  do
    printHeader
    printRecoveryHeader
    printRecoveryMenu
  done
  if [ $KEY == $STANDARD_CWM_ID ];
    then
      RECOVERY_VERSION="standard"
    else
      RECOVERY_VERSION="touch"
  fi
  printHeader
  printRecoveryHeader
  printModeManual
  runRecoveryCommands
  let RECOVERY_COUNTER+=1
  returnMenu
}

printRecoveryHeader () {
  echo "Flash ClockworkMod Recovery"
  echo ""
}

printRecoveryMenu () {
  echo "$STANDARD_CWM_ID. Standard CWM Recovery"
  echo "$TOUCH_CWM_ID. Touch CWM Recovery"
  echo ""
  echo -n "Please choose a valid option: "
  read KEY
}

runRecoveryCommands () {
  rebootBootloader
  fastboot flash recovery $DEVICE_DIR/recovery/$RECOVERY_VERSION/recovery.img
}

# Root the device

root () {
  printHeader
  printRootHeader
  printAndroidDebuggingManual
  printRootManual
  runRootCommands
  let ROOT_COUNTER+=1
  returnMenu
}

printRootHeader () {
  echo "Root the device"
  echo ""
}

printRootManual () {
  echo "4. Wait for automatically reboot in Recovery Mode."
  echo "5. Go to 'install zip from sdcard' >> 'choose zip from sdcard' >> 'GNLT'"
  echo "   and choose 'su.zip'."
  echo "6. Go to 'Go back' >> 'reboot system now'."
}

runRootCommands () {
  adb shell mkdir /sdcard/GNLT
  adb push $DEVICE_DIR/root/su.zip /sdcard/GNLT
  adb reboot recovery
}

#  Flash Google Factory Image

factory () {
  printHeader
  printFactoryHeader
  printModeManual
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
  runLockCommands
  let LOCK_COUNTER+=1
  returnMenu
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
}

# Exit Toolkit

exitToolkit () {
  EXIT=$TRUE
  logFileStatistics
  logFileSend
  clear
}

logFileStatistics () {
  cd $LOGS_DIR
  echo "" >> $LOG_NAME
  echo "Execution Statistics" >> $LOG_NAME
  echo "" >> $LOG_NAME
  echo "Selected Device: $DEVICE_NAME" >> $LOG_NAME
  echo "Selected Mode: $SELECTED_MODE" >> $LOG_NAME
  echo "Unlock Bootloader: $UNLOCK_COUNTER" >> $LOG_NAME
  echo "Flash ClockworkMod Recovery: $RECOVERY_COUNTER" >> $LOG_NAME
  echo "Root device: $ROOT_COUNTER" >> $LOG_NAME
  echo "Flash Google Factory Image: $FACTORY_COUNTER" >> $LOG_NAME
  echo "Lock Bootloader: $LOCK_COUNTER" >> $LOG_NAME
}

logFileSend () {
  cd $LOGS_DIR
  echo "Do you want to send anonymous usage information and ocurred errors to the"
  echo "developer?"
  echo "This is very important to correct bugs and make a better user experience."
  echo -n "It will only take around 3 seconds. Please type [Y/N]: "
  read KEY
  while [ $KEY != "Y" ] && [ $KEY != "N" ]
  do
    read KEY
  done
  if [ $KEY == "Y" ];
  then
    ftp -in $HOST << END
      user $USER $PASSWORD
      cd logfiles
      put $LOG_NAME
      bye
END
  fi
}

# /*** Main ***/

ERROR=$FALSE
logFileInitialization
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

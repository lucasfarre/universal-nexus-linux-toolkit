#!/bin/bash
# Galaxy Nexus Linux Toolkit v1.0
# by lucasfarre (tatelucas)
# Apache License 2.0
# Source: http://code.google.com/p/galaxy-nexus-linux-toolkit/
# XDA Official Thread: Coming Soon...

# Environment Variables

PATH="$PATH:$PWD/platform-tools"

# Constants

TRUE=1
FALSE=0
INVALID=0
MAGURO_DIR="$PWD/devices/maguro"
TORO_DIR="$PWD/devices/toro"
TOROPLUS_DIR="$PWD/devices/toroplus"
FACTORY_MAGURO="https://dl.google.com/dl/android/aosp/yakju-jro03c-factory-3174c1e5.tgz"
MD5_MAGURO="61cad184127144888445987249f06fca"
FACTORY_TORO="https://dl.google.com/dl/android/aosp/mysid-imm76k-factory-98d21321.tgz"
MD5_TORO="e76c6fe7d2bc799e5a6168f9dcb8c4ca"
FACTORY_TOROPLUS=""
MD5_TOROPLUS=""

# Functions

printHeader () {
reset
echo "********************************************************************************"
echo "*                 Galaxy Nexus Linux Toolkit v1.0 by tatelucas                 *"
echo "********************************************************************************"
}

printDeviceChooser () {
  echo "G. GSM Galaxy Nexus [maguro] "
  echo "V. Verizon Galaxy Nexus [toro]"
  echo "S. Sprint Galaxy Nexus [toroplus]"
  echo ""
  echo -n "Please choose your device: "
}

setVariables () {
  ERROR=$FALSE
  case $DEVICE in
    G) DEVICE_NAME="GSM Galaxy Nexus"
       DEVICE_DIR=$MAGURO_DIR
       FACTORY_URL=$FACTORY_MAGURO
       MD5=$MD5_MAGURO;;
    V) DEVICE_NAME="Verizon Galaxy Nexus"
       DEVICE_DIR=$TORO_DIR
       FACTORY_URL=$FACTORY_TORO;;
    S) DEVICE_NAME="Sprint Galaxy Nexus"
       DEVICE_DIR=$TOROPLUS_DIR
       FACTORY_URL=$FACTORY_TOROPLUS;;
    *) DEVICE=$INVALID;;
  esac
}

printDevice () {
  echo "Selected Device: $DEVICE_NAME"
  echo ""
}

printMenu () {
  echo "1. Unlock the Bootloader"
  echo "2. Flash ClockworkMod Recovery"
  echo "3. Root the Device"
  echo "4. Lock the Bootloader"
  if [ $DEVICE != "S" ];
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

bootloader () {
  printBootloaderHeader
  printBootloaderManual
  runBootloaderCommands
  returnMenu
}

printBootloaderHeader () {
  echo "Unlock the Bootloader"
  echo ""
}

printBootloaderManual () {
  echo "Before starting the process your device must be in Bootloader Mode."
  echo "In the following instructions you will learn how to do it:"
  echo ""
  echo "1. Power off the device."
  echo "2. Press and hold both Volume Up and Volume Down, then press and hold Power."
  echo "3. Your device screen should show an image of an opened android."
  echo "   You are now in the Bootloader Mode! If you don't see the image,"
  echo "   you must follow the instructions again."
  echo "4. Please connect the device to your PC via USB and then press ENTER: "
  echo ""
  read KEY
}

runBootloaderCommands () {
  fastboot oem unlock
}

recovery () {
  printRecoveryHeader
  printBootloaderManual
  runRecoveryCommands
  returnMenu
}

printRecoveryHeader () {
  echo "Flash ClockworkMod Recovery"
  echo ""
}

runRecoveryCommands () {
  fastboot flash recovery $DEVICE_DIR/recovery/recovery.img
}

root () {
  printHeader
  printRootHeader
  printRootManual
  runRootCommands
  returnMenu
}

printRootHeader () {
  echo "Root the device"
  echo ""
}

printRootManual () {
  echo "Before starting the process your device must be in Android Debugging Mode."
  echo "In the following instructions you will learn how to do it:"
  echo ""
  echo "1. Power on your device and connect the device to your PC via USB."
  echo "2. Go to 'Settings' >> 'Developer options' and check 'Android debugging'."
  echo "3. Press ENTER and wait for automatically reboot in Recovery Mode."
  echo "4. Go to 'install zip from sdcard' >> 'choose zip from sdcard' >> 'GNLT'"
  echo "   and choose 'su.zip'."
  echo "5. Go to 'Go back' >> 'reboot system now'."
  echo ""
  read KEY
}

runRootCommands () {
  adb shell mkdir /sdcard/GNLT
  adb push $DEVICE_DIR/root/su.zip /sdcard/GNLT
  adb reboot recovery
}

factory () {
  printHeader
  printFactoryHeader
  printBootloaderManual
  downloadFactoryImage
  checkFactoryImage
  if [ $ERROR -eq $FALSE ];
  then
    extractFactoryImage
    runFactoryCommands
  fi
  returnMenu
 }

printFactoryHeader () {
  echo "Flash Google Factory Image"
  echo ""
}

downloadFactoryImage () {
  cd $DEVICE_DIR/factory
  if [ ! -e ./factory.tgz ];
  then
    wget -O factory.tgz $FACTORY_URL
    chmod 666 ./factory.tgz
  fi
}

checkFactoryImage () {
  if [ $MD5 != "`md5sum ./factory.tgz | head -c 32`" ];
  then
    ERROR=$TRUE
    echo "ERROR: Google Factory Image is Corrupted. Erasing..."
    rm ./factory.tgz
    echo "Erased. Please try again later."
  fi
}

extractFactoryImage () {
  cd $DEVICE_DIR/factory
  if [ `ls -d extract_here` != "" ];
  then
  rm -r ./extract_here
  fi
  tar -xzf ./factory.tgz
  mv ./`ls -d */` ./extract_here
  chmod -R 666 ./extract_here
}

runFactoryCommands () {
  cd $DEVICE_DIR/factory/extract_here
  bash ./flash-all.sh
}

lockBootloader () {
  printLockHeader
  printBootloaderManual
  runLockCommands
  returnMenu
}

printLockHeader () {
  echo "Lock the Bootloader"
  echo ""
}

runLockCommands () {
  fastboot oem lock
}

exitToolkit () {
  EXIT=$TRUE
  reset
}

# Main

DEVICE=$INVALID
while [ $DEVICE -eq $INVALID ]
do
  printHeader
  printDeviceChooser
  read DEVICE
  setVariables
done
EXIT=$FALSE
while [ $EXIT -eq $FALSE ]
do
  printHeader
  printDevice
  printMenu
  read OPTION
  printHeader
  case $OPTION in
    1) bootloader;;
    2) recovery;;
    3) root;;
    4) lockBootloader;;
    5) if [ $DEVICE == "S" ];
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

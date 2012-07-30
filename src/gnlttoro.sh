#!/bin/bash
# Verizon Galaxy Nexus Linux Toolkit v0.2
# by lucasfarre (tatelucas)
# Apache License 2.0
# Source: http://code.google.com/p/galaxy-nexus-linux-toolkit/
# XDA Official Thread: Coming Soon...

# Macros

FACTORY_IMAGE_URL="https://dl.google.com/dl/android/aosp/mysid-imm76k-factory-98d21321.tgz"

# Functions

printHeader () {
reset
echo "********************************************************************************"
echo "*              Verizon Galaxy Nexus Linux Toolkit 0.2 by tatelucas             *"
echo "********************************************************************************"
}

printMenu () {
  echo "1. Unlock the Bootloader"
  echo "2. Flash ClockworkMod Recovery"
  echo "3. Root the Device"
  echo "4. Flash Google Factory Image"
  echo "5. Exit"
  echo ""
  echo -n "Please choose a valid option: "
}

returnMenu () {
  echo ""
  echo "Press ENTER to return to the main menu..."
  echo ""
  read KEY
  FLAG=1
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
  cd ./platform-tools
  ./fastboot oem unlock
  cd ..
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
  cd ./platform-tools
  ./fastboot flash recovery ./recovery/recovery.img
  cd ..  
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
  cd ./platform-tools
  ./adb shell mkdir /sdcard/GNLT
  ./adb push ./root/su.zip /sdcard/GNLT
  ./adb reboot recovery
  cd ..
}

factory () {
  printHeader
  printFactoryHeader
  printBootloaderManual
  downloadFactoryImage
  runFactoryCommands
  returnMenu
 }

printFactoryHeader () {
  echo "Flash Google Factory Image"
  echo ""
}

downloadFactoryImage () {
  cd ./platform-tools/factory
  if [ ! -e ./factory.tgz ];
  then
  wget -O factory.tgz $FACTORY_IMAGE_URL
  fi
  tar -xzf ./factory.tgz
  mv ./`ls -d */` ./extract
  cd ./extract
  mv `ls bootloader*` ./bootloader.img
  mv `ls radio*` ./radio.img
  mv `ls image*` ./image.zip
  cd ..
  cd ..
  cd ..
}

runFactoryCommands () {
  cd ./platform-tools
  ./fastboot flash bootloader ./factory/extract/bootloader.img
  ./fastboot reboot-bootloader
  sleep 5
  ./fastboot flash radio ./factory/extract/radio.img
  ./fastboot reboot-bootloader
  sleep 5
  ./fastboot -w update ./factory/extract/image.zip
  cd ..
}

exitToolkit () {
  FLAG=0
  reset
}

invalid () {
  reset
  echo "Invalid Option."
  returnMenu
}

# Main

FLAG=1
while [ $FLAG -eq 1 ]
do
  printHeader
  printMenu
  read OPTION
  printHeader
  case $OPTION in
    1) bootloader;;
    2) recovery;;
    3) root;;
    4) factory;;
    5) exitToolkit;;
    *) invalid;;
  esac
done
exit

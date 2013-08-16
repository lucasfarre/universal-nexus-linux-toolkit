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


# Universal Nexus Linux Toolkit Launcher v1.0
# by lucasfarre (tatelucas)
# Apache License 2.0
# Source: http://code.google.com/p/galaxy-nexus-linux-toolkit/
# XDA Official Thread: http://forum.xda-developers.com/showthread.php?t=1810089


PATH="$PATH:$PWD/wget"

if [ ! -d ./wget ]
then
    clear
    WGET_URL="https://galaxy-nexus-linux-toolkit.googlecode.com/files/wget1.14.tar.gz"
    mkdir wget
    cd wget
    curl -O $WGET_URL
    tar -xzvf wget1.14.tar.gz
    rm wget1.14.tar.gz
    cd ..
fi
clear
echo "********************************************************************************"
echo "*       Universal Nexus Linux Toolkit Launcher for Mac OSX by tatelucas        *"
echo "********************************************************************************"

LATEST_TOOLKIT_URL="http://galaxy-nexus-linux-toolkit.googlecode.com/git/stable/unlt.sh"
echo "Updating Toolkit..."
if [ -e unlt.sh ]
then
  rm unlt.sh
fi
wget $LATEST_TOOLKIT_URL > /dev/null 2>&1
echo "Succesfully Updated."
echo "Initializing..."
sleep 3
bash unlt$LATEST_VERSION.sh

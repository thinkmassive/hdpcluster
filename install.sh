#!/bin/bash

rundir=`pwd`
export HDPCLUSTER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing nvm & npm from Homebrew..."
brew install -g nvm npm
echo "Installing nodejs 0.12 using nvm..."
nvm install 0.12
echo ''

echo "Installing http-server using npm..."
cd ${HDPCLUSTER_HOME}/http-server
npm install
echo ''

echo "Appending alias and ENV vars to ~/.bash_profile"
echo -e "\n# hdpcluster utility" >> ~/.bash_profile
echo "export HDPCLUSTER_HOME=${HDPCLUSTER_HOME}" >> ~/.bash_profile
echo "alias hdpcluster='${HDPCLUSTER_HOME}/hdpcluster.sh'" >> ~/.bash_profile
. ~/.bash_profile

echo "Setup complete!"
cd $rundir

#!/bin/bash
############################################################################
#           Installer for PSG Workshop on Computer Vision
#1. Creates folder structure needed for the system
#2. Clones code from Github repository
#3. Install the dependencies for python code
#
############################################################################


# Display details about file
echo 'Installs all the dependency needed\n'
echo 'Installation might take several minutes based on the Network speed\n'

# Create the necessary directories
mkdir ~/psg_ws_cv
LOG_PATH='~/psg_ws_cv/log'


# Create log file and log the installation details
mkdir -p $LOG_PATH
exec >  >(tee -a $LOG_PATH/install.log)
exec 2> >(tee -a $LOG_PATH/install.log >&2)


# Install OpenCV, TBB etc..
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git python-pip

# Installing the dependencies for web
echo 'Installing other dependencies'
sudo pip install virtualenv
virtualenv ~/psg_ws_cv/cv_env -p python3
source ~/psg_ws_cv/cv_env/bin/activate

pip install --upgrade pip
pip install -r requirements.txt
deactivate
echo 'INSTALLATION SUCCESSFUL...!'

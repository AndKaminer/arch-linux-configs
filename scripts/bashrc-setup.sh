#!/bin/bash

# This script is designed for clean installs.
# It's job is to append things that I would like to be on PATH to bashrc
# It also aliases things.
# It also does neofetch on startup because I like it

homeDirectory="andy"
bashrcFileName=".bashrc"
jdkInstallationName="jdk-11.0.13--8"


printf "# MY CONFIGURATIONS\n" >> /home/${homeDirectory}/${bashrcFileName}

# PATH stuff
printf "# PATH stuff\n" >> /home/${homeDirectory}/${bashrcFileName}

printf "export PATH=/home/${homeDirectory}/.local/bin:\$PATH\n" >> /home/${homeDirectory}/${bashrcFileName}

printf "export PATH=/opt/${jdkInstallationName}/bin\$PATH\n" >> /home/${homeDirectory}/${bashrcFileName}


# aliases
printf "\n# aliases\n" >> /home/${homeDirectory}/${bashrcFileName}

printf "alias ghidra='/opt/ghidra_10.1_PUBLIC/ghidraRun'\n" >>  /home/${homeDirectory}/${bashrcFileName}


# neofetch
printf "\n# neofetch\n" >> /home/${homeDirectory}/${bashrcFileName}
printf "neofetch\n" >> /home/${homeDirectory}/${bashrcFileName}


#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

if [ ! $(which motion) ]; then
    apt install motion -y
    mkdir /var/log/motion
    # motion user looses its permissions for some reason
    # "chown" step might be redundant can can be removed in the futures
    chown motion:motion /var/log/motion
    systemctl enable motion
    systemctl start motion
    echo "Done installing motion"
fi

# determine system arch
ARCH=
if [ "$(uname -m)" == 'x86_64' ]
then
    ARCH=amd64
elif [ "$(uname -m)" == 'aarch64' ]
then
    ARCH=arm64
elif [ "$(uname -m)" == 'i386' ] || [ "$(uname -m)" == 'i686' ]
then
    ARCH=386
else
    ARCH=arm
fi

ARCHIVE=ngrok-v3-stable-linux-$ARCH.tgz
DOWNLOAD_URL=https://bin.equinox.io/c/bNyj1mQVY4c/$ARCHIVE

if [ ! $(which wget) ]; then
    echo 'Please install wget package'
    exit 1
fi

if [ ! $(which git) ]; then
    echo 'Please install git package'
    exit 1
fi


if [ -z "$1" ]; then
    echo "./install.sh <your_authtoken>"
    exit 1
fi

if [ ! -e ngrok.service ]; then
    echo "make sure you are in the directory with ngrok.service"
    echo "if you don't have the motion-ngrok directory"
    echo "run git clone https://github.com/mirontoli/motion-ngrok.git"
    echo "then cd motion-ngrok"
    echo "then ./install.sh ..."
    exit 1
fi

cp ngrok.service /lib/systemd/system/
mkdir -p /opt/ngrok
cp ngrok.yml /opt/ngrok
sed -i "s/<add_your_token_here>/$1/g" /opt/ngrok/ngrok.yml
sed -i "s/<add_your_domain_here>/$2/g" /opt/ngrok/ngrok.yml
sed -i "s/username1:password1/$3/g" /opt/ngrok/ngrok.yml

cd /opt/ngrok
echo "Downloading ngrok for $ARCH . . ."
wget $DOWNLOAD_URL
tar xzf $ARCHIVE
rm $ARCHIVE
chmod +x ngrok

systemctl enable ngrok.service
systemctl start ngrok.service

echo "Done installing ngrok"
exit 0

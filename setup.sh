#setup.sh
#!/bin/bash
# /home/runner/.ngrok2/ngrok.yml

echo "## Creating User ##"

sudo useradd -m exdeus
sudo adduser exdeus sudo
echo "exdeus:kurama9" | sudo chpasswd
sudo sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo hostname worldserpent

echo "## Updating Password ##"
echo -e "kurama9\nkurama9" | sudo passwd "$USER"

echo "## Installing Ngrok ##"

wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip
chmod +x ./ngrok

echo "## Setup Ngrok Authtoken ##"

./ngrok authtoken "$N_AUTH"

echo "## START ##"
./ngrok tcp 22

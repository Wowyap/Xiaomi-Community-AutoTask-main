#!/bin/bash
yum update -y
yum install python3 git -y

cd /home/ec2-user
git clone https://github.com/Wowyap/POCIMON.git pokemon-app
cd pokemon-app
pip3 install -r requirements.txt

echo "Welcome to the Pokémon App! Run 'cd pokemon-app && python3 poke_main.py'" >> /home/ec2-user/.bashrc
chown -R ec2-user:ec2-user /home/ec2-user/pokemon-app
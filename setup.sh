#!/bin/bash

echo "--------------------------------"
echo "PLEASE GIVE PASSWORD IF PROMPTED"
echo "--------------------------------"
chmod +x run.sh
chmod +x 202Project/delete.sh
sudo apt-get -y install git
git clone https://github.com/Priyanka-Mondal/202Project.git
cd 202Project
chmod +x "throughput/perf.sh"
cd latency	
sudo docker build 27091991/202latency .
cd ..
cd throughput
sudo docker build -t 27091991/202throughput .
cd ../..
#git clone https://github.com/andikleen/pmu-tools
#export PATH=$PATH:`pwd`
#sudo apt-get update && apt-get -y install python-matplotlib

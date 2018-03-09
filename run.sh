#!/bin/bash
############################################NOTE############################################################
# 1.How to run? sudo ./run.sh <an integer argument> If you dont give an argument it will take 20 as default. #
# 2.The integer is the number of RSA key value pairs you want to generate for the latency part.            #
# 3. Latencies are recorded for each key-pair generation.                                                  #
# 4.WARNING: DO NOT GIVE A BIG INTEGER VALUE AS ARGUMENT. Because it generates .pem files to store the     #
#   private-public keys. It will consume lots of space if you give a large value.                          #
# 5.I have tried with 2000 in my local machine and plotted the graph.                                      #
# 6.You can see the .pem files with "ls"  and "cat privatex.pem"  commands at the end                      #
#   of the execution of this script. All the latencies are stored in a file named latency_file.            #
# 7.Do "cat latency_file" to see the contents.It also records the average latency at the end of file.      #
# 8.Please use sudo while executing this script.                                                           #
# 9.Once the latency part is over throughput benchmark will be executed automatically. Total 20 runs of    #
#    throughput benchmark will be executed.                                                                #
#    a. each run will record L1 misses, LLC misses (as L2 misses are not supported in my machine and I dont# 
#       have L3 cache),  										   #
#       Branch misses, instructions, and cycles.                                                           #
#    b. 1/2/4/8 processes are ran with 2T, 2T/4, 2T/16, 2T/64 and 2T/256 instructions. Thus 20 runs.       #
#    c. Perf stat Results are stored in results.perf file at the end.                                      #
#    d. Over all execution takes 35-40 mins.                                                               #
#    e. "**IMPORATNT**" perf_event_open is blacklisted inside docker, So I had to change the security      #
#       file in docker.                                                                                    # 
#       The docker run command may or may not need that security file, depending on 			   #
#       what docker.deb version is installed. So I have given both of them in the run                      #
#       command. Only one of them will work. So while executing run.sh it may show some security issue,    #
#       If that is the case please comment the first docker run command (line 45-46) and uncomment the     #
#       second docker run command. Works fine with first command in my docker.
#       Please let me know if any problem with perf shows up. You can even try                             #
#:	commenting perf command in perf.sh(at line 54 in "202Project/throughput/perf.sh file") script.     # 
#       Without perf it should run the benchmark perfectly fine.					   #
#     f. If it shows RUNNING... that means its running without any problem with perf			   #
#     g. I have not included the code to plot graph in this submission.                                    # 
#        Although plotting works in my docker. Pmu tools are                                               #
#	 installed in the docker.									   #
############################################################################################################




chmod +x 202Project/latencyrun.sh
source 202Project/latencyrun.sh
echo "========================================================="
echo "STARTING THROUGHPUT RUNS>>>>..... IT WILL TAKE LONG TIME(30-40mins).. Dont quit in between!!"
echo "=============================================================================================================================="
echo "============================================================================================================================================="
echo "============================================================================================================================================="
echo "=If there is some permission issue with perf PLEASE COMMENT AND UNCOMMNT 2 LINES IN THE SCRIPT, DETAILS GIVEN IN 9e point inside the script="
echo "============================================================================================================================================="
echo "============================================================================================================================================="
echo "==========================================================================================================================="



############## This is the DOCKER RUN command... only one of them should be uncommented###############

#sudo docker run -it  --security-opt seccomp=202Project/mysec.json 27091991/202throughput 
sudo docker run -it 27091991/202throughput

##############################################################################################


ID=`docker ps -a | grep 27091991/202throughput | awk '{print $1}'`
echo $ID > file
ID2=`awk '{print $1}' file`
docker cp $ID2:/priyanka-mondal-202/throughput/results.perf .

FROM ubuntu 
MAINTAINER priyanka (priyanka02010@gmail.com)
COPY . /priyanka-mondal-202/throughput
WORKDIR  /priyanka-mondal-202/throughput
RUN apt-get update && apt-get install -y openssl 
RUN apt-get update && apt-get install -y libssl-dev 
RUN apt-get update && apt-get -y install linux-tools-`uname -r`
RUN apt-get update && apt-get -y install gcc
RUN apt-get update && apt-get -y install git
RUN apt-get update && apt-get -y install vim
RUN git clone https://github.com/andikleen/pmu-tools
RUN export PATH=$PATH:`pwd`
RUN apt-get update && apt-get -y install python-matplotlib
RUN gcc 202throughput.c -o tp -lcrypto
#RUN gcc 202latency.c -o latency -lcrypto
CMD ["./perf.sh"]

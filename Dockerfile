FROM dorowu/ubuntu-desktop-lxde-vnc
RUN apt update
RUN echo "Installing conda"
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p miniconda
RUN eval "$(miniconda/bin/conda shell.bash hook)"

RUN apt install python3-pip -y
RUN pip3 install nltk
RUN pip3 install matplotlib
RUN pip3 install impyla
RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install scikit-learn
RUN echo "Installing mysql"
RUN apt install mysql-server -y
COPY mysql-bench.deb .
RUN apt install ./mysql-bench.deb -y
RUN apt install mysql-server -y
RUN  echo "service mysql start 2>/dev/null" > .bashrc
RUN apt -y  install openjdk-11-jdk openjdk-11-jre default-jdk
RUN wget -O - https://dbeaver.io/debs/dbeaver.gpg.key |  apt-key add -
RUN echo "deb https://dbeaver.io/debs/dbeaver-ce /" | tee /etc/apt/sources.list.d/dbeaver.list
RUN apt update && apt -y  install dbeaver-ce

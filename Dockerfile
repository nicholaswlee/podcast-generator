FROM ubuntu:latest 

# apt allows us to install packages, the \ character allows us to split commands over multiple lines
RUN apt-get update && apt-get install -y \ 
    python3.10 \ 
    python3-pip \
    git 

RUN pip3 install -r requirements.txt

# common location for executable files
COPY feed.py /usr/bin/feed.py 
# this is the script that will be run when the container starts
COPY entrypoint.sh /entrypoint.sh

# this specifies the command to run when the container starts
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
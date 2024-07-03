FROM python:3.13.0b2

MAINTAINER foufoudu34


# Install dependencies
RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install build-essential libpq-dev rsyslog iputils-ping netbase net-tools openssh-server sudo curl wget git iproute2 systemd systemd-sysv libcurl4-gnutls-dev nmap -y

# Deplace to /
RUN cd /

# Clone the repository
RUN git clone https://github.com/Foufou-exe/Semabox.git

# Set the working directory to /Semabox
WORKDIR /Semabox

# Install requirements
RUN pip install -r install/requirements.txt


RUN rm -f Semabox.py

# Expose ports
EXPOSE 22
EXPOSE 80

ENTRYPOINT [ "python" , "/Semabox/SemaAPI/API.py" ]




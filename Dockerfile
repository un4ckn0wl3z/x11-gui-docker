# ---------------------------------------------------------------------------------
# install XServer for Windows : https://sourceforge.net/projects/vcxsrv/
# docker build -t docker-gui-ssh .
# docker run -d -it --name docker-gui -p 30065:22 docker-gui-ssh:latest bash
# docker exec -it docker-gui bash
# service ssh start
# .\plink.exe testuser@xxx.xxx.xxx.xxx -P 30065 -pw 1234 -X pcmanfm
# ----------------------------------------------------------------------------------

FROM ubuntu:latest

RUN apt update && apt install -y pcmanfm featherpad lxtask xterm openssh-server

CMD pcmanfm

RUN sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config
RUN useradd -m testuser -p $(openssl passwd 1234)

EXPOSE 22
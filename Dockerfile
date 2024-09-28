FROM centos:7.9.2009

# 미러 서버 변경 및 필요한 패키지 설치
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum -y install openssh-server

# SSH 설정
RUN ssh-keygen -A
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH 서비스 시작을 위한 스크립트 생성
RUN echo '#!/bin/bash' > /start.sh
RUN echo '/usr/sbin/sshd -D' >> /start.sh
RUN chmod +x /start.sh

EXPOSE 22 80

CMD ["/start.sh"]
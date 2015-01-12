FROM centos:centos6
MAINTAINER Feng Honglin <hfeng@tutum.co>

RUN yum -y install http://mirrors.123host.vn/epel/6/i386/epel-release-6-8.noarch.rpm

# Install packages and set up sshd
RUN yum -y install openssh-server pwgen
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# Add scripts
ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 22
CMD ["/run.sh"]

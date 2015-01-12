tutum-centos
============

Simple CentOS docker image with SSH access


Usage
-----
Install docker (if you use centos 6):

	yum install http://mirrors.123host.vn/epel/6/i386/epel-release-6-8.noarch.rpm
	yum install docker-io git
	
	service docker start
	
	mkdir /root/giabao && cd /root/giabao
	git clone https://github.com/giabao/centos-ssh.git
	cd centos-ssh
	git checkout centos6
	docker build -t giabao/centos:centos6 .


Running giabao/centos
--------------------

Run a container from the image you created earlier binding it to port 2222 in all interfaces:

	sudo docker run -d -p 0.0.0.0:2222:22 giabao/centos:centos6

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this CentOS container via SSH using:

	    ssh -p <port> root@<host>
	and enter the root password 'U0iSGVUCr7W3' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `U0iSGVUCr7W3` is the password allocated to the `root` user.

Done!


Setting a specific password for the root account
------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `ROOT_PASS` to your specific password when running the container:

	docker run -d -p 0.0.0.0:2222:22 -e ROOT_PASS="mypass" giabao/centos


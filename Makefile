install-dep:
	sudo apt update
	sudo apt upgrade -y
	sudo apt install docker -y
	sudo apt-get remove containerd.io
	sudo apt install docker.io -y
	sudo apt install docker-compose -y
	sudo systemctl stop docker
	sudo systemctl start docker
	sudo apt install npm -y
	sudo useradd -m -b /var/lib -G docker docker-deploy
	sudo mkdir /var/lib/docker-deploy/.ssh
	sudo chown docker-deploy:docker-deploy /var/lib/docker-deploy/.ssh && sudo chmod 0500 /var/lib/docker-deploy/.ssh
	sudo cat /home/ubuntu/.ssh/authorized_keys >> deploy_key.pub
	sudo ls -la
	pwd
	sudo install -o docker-deploy -g docker-deploy -m 0600 deploy_key.pub /var/lib/docker-deploy/.ssh/authorized_keys
	sudo chmod 0500 /var/lib/docker-deploy/.ssh
	rm deploy_key.pub

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
	sudo useradd -m -b /var/lib -G docker ${{ secrets.DEPLOY_USERNAME }}
	sudo mkdir /var/lib/${{ secrets.DEPLOY_USERNAME }}/.ssh
	sudo chown ${{ secrets.DEPLOY_USERNAME }}:${{ secrets.DEPLOY_USERNAME }} /var/lib/${{ secrets.DEPLOY_USERNAME }}/.ssh && sudo chmod 0500 /var/lib/${{ secrets.DEPLOY_USERNAME }}/.ssh
	sudo cat /home/ubuntu/.ssh/authorized_keys >> deploy_key.pub
	sudo install -o docker-deploy -g docker-deploy -m 0600 deploy_key.pub /var/lib/docker-deploy/.ssh/authorized_keys
	sudo chmod 0500 /var/lib/docker-deploy/.ssh
	rm deploy_key.pub

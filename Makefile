install-dep:
	sudo apt update
	sudo apt upgrade -y
	sudo apt install docker -y
	sudo apt install docker.io -y
	sudo apt install docker-compose -y
	sudo systemctl stop docker
	sudo systemctl start docker
	sudo usermod -aG docker ubuntu
	sudo apt install npm -y

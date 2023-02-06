NAME	= Inception

# ---------- #

all:	build

build: 
		sudo mkdir -p /home/hcremers/data /home/hcremers/data/wordpress /home/hcremers/data/database
		sudo chmod 777 /etc/hosts
		sudo echo "127.0.0.1 hcremers.42.fr" >> /etc/hosts
		sudo echo "127.0.0.1 www.hcremers.42.fr" >> /etc/hosts
		cd srcs/ && sudo docker-compose up -d --build

status:
		cd srcs/ && sudo docker-compose ps

up: 
		cd srcs/ && sudo docker-compose up -d

down: 
		cd srcs/ && sudo docker-compose down

clean:
		cd srcs/ && sudo docker-compose down -v --rmi all --remove-orphans

fclean:	clean
		sudo docker system prune --volumes --all --force
		sudo rm -rf /home/hcremers/data
		sudo docker network prune --force
		echo docker volume rm $(docker volume ls -q)
		sudo docker image prune --force

re:		fclean all
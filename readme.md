Usage:

	1. Enter Container
		sudo docker run -it lede-project-docker:latest /bin/bash
		cp rpi3-config.seed .config

	2. make menuconfig <save to .config>

	3. make -j16 V=s


Reference:

Create Image:

	cd lede-project-docker/

	sudo docker build -t lede-project-docker .

List Images:

	sudo docker images

Remeve Image:

	sudo docker rmi 7d9495d03763

	sudo docker image remove 7d9495d03763

Run Container:

	sudo docker run -it lede-project-docker:latest /bin/bash

List Containers:

	sudo docker ps

	sudo docker ps -a

Remove Container:

	sudo docker rm d48b68282c03

Usage:

	1. Enter Container
		sudo docker run -it lede-rpi3-docker:latest /bin/bash

	2. make menuconfig <save to .config>

	3. make -j16 V=s


Reference:

Create Image:

	cd lede-rpi3-docker/

	sudo docker build -t lede-rpi3-docker .

List Images:

	sudo docker images

Remeve Image:

	sudo docker rmi 7d9495d03763

	sudo docker image remove 7d9495d03763

Run Container:

	sudo docker run -it lede-rpi3-docker:latest /bin/bash

List Containers:

	sudo docker ps

	sudo docker ps -a

Remove Container:

	sudo docker rm d48b68282c03

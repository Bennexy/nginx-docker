FROM ubuntu:22.04 as base-image

RUN apt update
RUN apt install -y \
	vim \
	nginx \
	certbot \
	python3-certbot-nginx


CMD ["service", "nginx", "start"]

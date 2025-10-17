FROM ubuntu:22.04

# Installing Dependencies
RUN apt update && \
    apt install -y fortune-mod cowsay netcat && \
    ln -s /usr/games/fortune /usr/bin/fortune && \
    ln -s /usr/games/cowsay /usr/bin/cowsay && \
    apt clean

# Copy app material
COPY wisecow/wisecow.sh /app/wisecow.sh

WORKDIR /app

RUN chmod +x wisecow.sh

EXPOSE 4499
CMD ["bash", "-c", "RUN_SERVER=true ./wisecow.sh"]


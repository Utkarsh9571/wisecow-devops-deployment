FROM ubuntu:22.04

# Installing Dependencies
RUN apt update && \
    apt install -y fortune cowsay netcat && \
    apt clean

# Copy app material
COPY wisecow/wisecow.sh /app/wisecow.sh

WORKDIR /app

RUN chmod +x wisecow.sh

EXPOSE 4499
CMD [ "./wisecow.sh" ]
FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y unzip curl libcurl4 openssl vim
RUN curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip --output bedrock-server.zip
RUN unzip bedrock-server.zip -d bedrock-server
RUN rm bedrock-server.zip

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server

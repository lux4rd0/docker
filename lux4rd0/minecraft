docker build -t lux4rd0/minecraft:1.11.0.23 .

docker run -d --name=minecraft \
    -v '/mnt/docker/minecraft/worlds:/bedrock-server/worlds' \
    -v '/mnt/docker/minecraft/server.properties:/bedrock-server/server.properties' \
    --restart=always \
    --publish 19132:19132/udp \
    --publish 19132:19132 \
    --restart=always \
    lux4rd0/minecraft:1.11.0.23

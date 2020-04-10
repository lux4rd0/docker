docker build --build-arg MINECRAFT_VERSION=$1 -t docker01.tylephony.com:5000/lux4rd0/minecraft:$1 -t docker01.tylephony.com:5000/lux4rd0/minecraft:latest -f Dockerfile --no-cache .

docker push docker01.tylephony.com:5000/lux4rd0/minecraft:$1
docker push docker01.tylephony.com:5000/lux4rd0/minecraft:latest

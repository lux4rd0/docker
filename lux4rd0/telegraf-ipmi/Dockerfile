FROM telegraf:latest

RUN apt-get update && apt-get install -y ipmitool && \
    rm -rf /var/lib/apt/lists/*
